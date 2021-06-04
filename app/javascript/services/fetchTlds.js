export default async function fetchTlds() {
    const response = await fetch('/api/tlds')
    const { tlds } = await response.json()
    return tlds
}