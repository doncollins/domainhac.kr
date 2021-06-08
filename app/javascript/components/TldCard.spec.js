import React from 'react'
import renderer from 'react-test-renderer';
import mockNow from '../test/mockNow';
import TldCard from './TldCard';

it('renders correctly', () => {
    mockNow()

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
                updated_at: '2021-06-05T22:14:11+00:00',
            },
        },        {
            id: 2,
            label: 'b',
            tld: tld,
            availability: {
                id: 2,
                available: false,
                updated_at: '2021-06-05T22:14:11+00:00',
            },
        }
    ]

    const component = renderer.create(
        <TldCard tld={tld} domains={domains} />
    )

    expect(component.toJSON()).toMatchSnapshot()
})