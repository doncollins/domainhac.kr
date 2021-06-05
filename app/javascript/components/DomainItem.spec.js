import React from 'react'
import renderer from 'react-test-renderer';
import mockNow from '../test/mockNow';
import DomainItem from './DomainItem';

beforeEach(mockNow)

it('renders correctly', () => {
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
            updated_at: new Date()
        },
    }

    const component = renderer.create(
        <DomainItem domain={domain} />
    )

    const tree = component.toJSON()

    expect(tree).toMatchSnapshot()
})