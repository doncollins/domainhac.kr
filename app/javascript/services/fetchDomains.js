export default async function fetchDomains({ tld }) {
    const response = await fetch('/api/domains?' + new URLSearchParams({ tld }))
    const { domains } = await response.json()
    return domains
}