import React, { useState } from 'react'
import useScrollIntoViewEffect from '../hooks/useScrollIntoViewEffect'
import fetchDomains from '../services/fetchDomains'
import TldCard from './TldCard'

export default function({ tld }) {
    const [domains, setDomains] = useState(null)

    const ref = useScrollIntoViewEffect(async () => {
        const domains = await fetchDomains({ tld: tld.label })
        setDomains(domains)
    })

    return (
        <TldCard ref={ref} tld={tld} domains={domains} />
    )
}