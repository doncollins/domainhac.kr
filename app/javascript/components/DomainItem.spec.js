import React from 'react'
import renderer from 'react-test-renderer';
import mockNow from '../test/mockNow';
import DomainItem from './DomainItem';

it('renders correctly', () => {
    mockNow()

    const domain = {
        id: 1,
        label: 'f',
        tld: {
            id: 1,
            label: 'oo',
        },
        availability: {
            id: 1,
            available: true,
            updated_at: '2021-06-05T22:14:11+00:00',
        },
    }

    const component = renderer.create(
        <DomainItem domain={domain} />
    )

    expect(component.toJSON()).toMatchSnapshot()
})