import React from 'react'
import { formatRelative } from 'date-fns'

export default function({ domain }) {
    const formattedDate = formatRelative(
        new Date(domain.availability.updated_at),
        new Date()
    )

    return (
        <div className="px-2 py-1 flex items-center justify-between">
            <i className="fa fa-check text-blue-500" />

            <div className="flex items-center">
                <div style={{width: '100px'}} className="text-right">{domain.label}</div>
                <div>.</div>
                <div>{domain.tld.label}</div>
            </div>

            <div className="text-xs text-gray-500 ml-8 flex items-center">
                Last updated {formattedDate}
            </div>
        </div>
    )
}