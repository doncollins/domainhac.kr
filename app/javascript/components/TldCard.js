import React, { useState } from 'react'
import useScrollIntoViewEffect from '../hooks/useScrollIntoViewEffect'
import fetchDomains from '../services/fetchDomains'
import DomainItem from './DomainItem'
import Loading from './Loading'

export default function({ tld }) {
    const [domains, setDomains] = useState(null)

    const ref = useScrollIntoViewEffect(async () => {
        const domains = await fetchDomains({ tld: tld.label })
        setDomains(domains)
    })

    return (
        <div ref={ref} className="mb-8 w-full">
            <div className="text-4xl font-bold text-blue-500 mb-4 text-center">
                .{tld.label}
            </div>

            <div className="flex w-full justify-center">
                {domains && (
                    <div class="flex-grow max-w-xs sm:max-w-md shadow">
                        {domains.map(domain => (
                            <DomainItem key={domain.id} domain={domain} />
                        ))}
                    </div>
                ) || <Loading />}
            </div>
        </div>
    )
}