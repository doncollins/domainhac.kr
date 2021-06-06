import React from 'react'
import renderer from 'react-test-renderer';
import TldCard from './TldCard';

it('renders correctly', () => {
    const tld = {
        id: 1,
        label: 'oo',
    }

    const domains = [
        {
            id: 1,
            label: 'f',
            tld: tld,
            availability: {
                id: 1,
                available: true,
                updated_at: new Date()
            },
        },        {
            id: 2,
            label: 'b',
            tld: tld,
            availability: {
                id: 2,
                available: false,
                updated_at: new Date()
            },
        }
    ]

    const component = renderer.create(
        <TldCard tld={tld} domains={domains} />
    )

    expect(component.toJSON()).toMatchSnapshot()
})