import React from 'react'
import renderer from 'react-test-renderer';
import mockNow from '../test/mockNow';
import Loading from './Loading';

beforeEach(mockNow)

it('renders correctly', () => {
    const component = renderer.create(
        <Loading />
    )

    expect(component.toJSON()).toMatchSnapshot()
})