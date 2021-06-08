import React from 'react'
import renderer from 'react-test-renderer';
import Loading from './Loading';

it('renders correctly', () => {
    const component = renderer.create(
        <Loading />
    )

    expect(component.toJSON()).toMatchSnapshot()
})