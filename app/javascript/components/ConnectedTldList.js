import React, { useEffect, useState } from 'react'
import TldList from './TldList'
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
        <TldList tlds={tlds} />
    )
}