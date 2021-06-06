import React, { forwardRef }  from 'react'
import DomainItem from './DomainItem'
import Loading from './Loading'

export default forwardRef(({ tld, domains }, ref) => {
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
})