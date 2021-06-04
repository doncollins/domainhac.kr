class FetchNewVocabularyJob < ApplicationJob
  queue_as :default

  def perform(vocabulary_provider)
    Tld.all.each do |tld|
      fetch_vocabulary_for_tld vocabulary_provider, tld
    end
  end

  def fetch_vocabulary_for_tld(vocabulary_provider, tld)
    vocabulary_items = vocabulary_provider.find_items_ending_with tld.label

    if !vocabulary_items.empty?
      phrases = ensure_phrases vocabulary_items
      domains = ensure_domains vocabulary_items, tld
      ensure_associations phrases, domains, tld
    end
  end

  def ensure_phrases(items)
    Phrase.upsert_all(
      items.map{|item| {
        text: item.text,
        score: item.score,
        created_at: Time.now,
        updated_at: Time.now
      }},
      unique_by: [:text]
    )

    Phrase.where(text: items.map{|item| item.text}).all
  end

  def ensure_domains(items, tld)
    labels = items.map{|item| item.text.delete_suffix tld.label}

    Domain.upsert_all(
      labels.map{|label| {
        tld_id: tld.id,
        label: label,
        created_at: Time.now,
        updated_at: Time.now
      }},
      unique_by: [:tld_id, :label]
    )

    Domain.where(tld: tld, label: labels).all
  end

  def ensure_associations(phrases, domains, tld)
    domains_by_label = {}
    domains.each do |domain| domains_by_label[domain.label] = domain end

    all_pairs = phrases.map do |phrase|
      label = phrase.text.delete_suffix tld.label
      domain = domains_by_label[label]
      { domain_id: domain.id, phrase_id: phrase.id }
    end

    Hack.upsert_all(
      all_pairs.map {|pair| {
        domain_id: pair[:domain_id],
        phrase_id: pair[:phrase_id],
        created_at: Time.now,
        updated_at: Time.now,
      }},
      unique_by: [:domain_id, :phrase_id]
    )
  end
end
