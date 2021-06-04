require "test_helper"

class FetchNewVocabularyJobTest < ActiveJob::TestCase
  test "it creates new phrases when needed" do
    Tld.create label: 'oo'

    FetchNewVocabularyJob.perform_now(FixedVocabularyProvider.new [
      VocabularyItem.new('foo', 100),
      VocabularyItem.new('boo', 200)
    ])

    assert Phrase.count == 2
    assert Phrase.where(text: 'foo', score: 100).exists?
    assert Phrase.where(text: 'boo', score: 200).exists?
  end

  test "it does not create duplicate phrases" do
    Tld.create label: 'oo'

    vocabulary_provider = FixedVocabularyProvider.new [
      VocabularyItem.new('foo', 100),
      VocabularyItem.new('boo', 200)
    ]

    FetchNewVocabularyJob.perform_now vocabulary_provider
    FetchNewVocabularyJob.perform_now vocabulary_provider

    assert Phrase.count == 2
  end

  test "it creates appropriate new domains when needed" do
    tld = Tld.create label: 'oo'

    FetchNewVocabularyJob.perform_now(FixedVocabularyProvider.new [
      VocabularyItem.new('foo', 100),
      VocabularyItem.new('boo', 200)
    ])

    assert Domain.count == 2
    assert Domain.where(label: 'f', tld: tld).exists?
    assert Domain.where(label: 'b', tld: tld).exists?
  end

  test "it does not create duplicate domains" do
    Tld.create label: 'oo'

    vocabulary_provider = FixedVocabularyProvider.new [
      VocabularyItem.new('foo', 100),
      VocabularyItem.new('boo', 200)
    ]

    FetchNewVocabularyJob.perform_now vocabulary_provider
    FetchNewVocabularyJob.perform_now vocabulary_provider

    assert Domain.count == 2
  end

  test "it creates new domain-phrase associations when needed" do
    tld = Tld.create label: 'oo'

    FetchNewVocabularyJob.perform_now(FixedVocabularyProvider.new [
      VocabularyItem.new('foo', 100),
      VocabularyItem.new('boo', 200)
    ])

    assert Domain.includes(:phrases).where(label: 'f', phrases: { text: 'foo' }).exists?
    assert Domain.includes(:phrases).where(label: 'b', phrases: { text: 'boo' }).exists?
  end

  test "it does not create duplicate domain-phrase associations" do
    Tld.create label: 'oo'

    vocabulary_provider = FixedVocabularyProvider.new [
      VocabularyItem.new('foo', 100),
      VocabularyItem.new('boo', 200)
    ]

    FetchNewVocabularyJob.perform_now vocabulary_provider
    FetchNewVocabularyJob.perform_now vocabulary_provider

    assert Hack.count == 2
  end
end
