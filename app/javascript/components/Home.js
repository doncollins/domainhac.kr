import React, { useEffect, useState } from 'react'
import TldCard from './TldCard'
import Loading from './Loading'
import fetchTlds from '../services/fetchTlds'

export default function() {
    const [tlds, setTlds] = useState(null)

    useEffect(async () => {
        if (!tlds) {
            const tlds = await fetchTlds()
            setTlds(tlds)
        }
    }, [tlds])

    return (
        <div className="flex flex-col items-center p-8 text-gray-700">
            <div className="text-6xl font-bold mb-1 flex items-end">
                domainhac<span className="text-blue-500 text-3xl"><i className="fa fa-certificate" /></span>kr
            </div>

            <div className="mb-8 text-xs text-gray-500">
                <span> Powered by </span>
                <a className="text-blue-500 underline" href="https://www.datamuse.com/api/" target="_blank">Datamuse API</a>
                <span> and </span>
                <a className="text-blue-500 underline" href="https://api.gandi.net/docs/" target="_blank">Gandi API</a>.
            </div>

            {tlds && (
                tlds.map(tld => (
                    <TldCard key={tld.id} tld={tld} />
                ))
            ) || <Loading />}
        </div>
    )
}