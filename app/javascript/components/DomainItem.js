import React from 'react'
import { formatRelative } from 'date-fns'

export default function({ domain }) {
    const formattedDate = formatRelative(
        new Date(domain.availability.updated_at),
        new Date()
    )

    return (
        <div className="px-2 py-1 w-full flex items-center justify-between bg-gray-100 even:bg-white">
            <i className="fa fa-check text-blue-500" />

            <div className="flex-grow ml-8 sm:ml-2 flex items-center justify-start">
                <div className="sm:w-32 text-right">{domain.label}</div>
                <div className="text-blue-500">.</div>
                <div>{domain.tld.label}</div>
            </div>

            <div className="text-xs text-gray-500 flex items-center justify-end sm:w-1/2">
                <span class="hidden sm:inline">Updated&nbsp;</span>
                <span>{formattedDate}</span>
            </div>
        </div>
    )
}