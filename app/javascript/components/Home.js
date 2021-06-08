import React from 'react'
import ConnectedTldList from './ConnectedTldList'

export default function() {
    return (
        <div className="w-full flex flex-col items-center p-4 sm:p-8 text-gray-700">
            <div className="text-4xl sm:text-6xl font-bold mb-1 flex items-end">
                domainhac<span className="text-blue-500 text-lg sm:text-3xl"><i className="fa fa-certificate" /></span>kr
            </div>

            <div className="mb-16 text-xs text-gray-500">
                <span> Powered by </span>
                <a className="text-blue-500 underline" href="https://www.datamuse.com/api/" target="_blank">Datamuse API</a>
                <span> and </span>
                <a className="text-blue-500 underline" href="https://api.gandi.net/docs/" target="_blank">Gandi API</a>.
            </div>

            <ConnectedTldList />
        </div>
    )
}