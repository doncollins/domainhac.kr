import { useEffect, useRef, useState } from "react"
import useOnScreen from './useOnScreen'

export default function useScrollIntoViewEffect(callback) {
    const [wasEverOnScreen, setWasEverOnScreen] = useState(false)

    const ref = useRef()
    const isOnScreen = useOnScreen(ref)

    useEffect(() => {
        if (isOnScreen) {
            setWasEverOnScreen(true)
        }
    }, [isOnScreen])

    useEffect(() => {
        if (wasEverOnScreen) {
            callback()
        }
    }, [wasEverOnScreen])

    return ref
}