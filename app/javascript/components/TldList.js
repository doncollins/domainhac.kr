import React from 'react'
import ConnectedTldCard from './ConnectedTldCard'
import Loading from './Loading'

export default function({ tlds }) {
    return (
        <div className="w-full">
            {tlds && (
                tlds.map(tld => (
                    <ConnectedTldCard key={tld.id} tld={tld} />
                ))
            ) || <Loading />}
        </div>
    )
}