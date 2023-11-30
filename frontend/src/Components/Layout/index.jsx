
import PropTypes from 'prop-types'


const Layout = ( {children} ) => {
    Layout.PropTypes = {
        children: PropTypes.node.isRequired,
    }
    return (
        <div className="flex flex-col items-center mt-20 w-screen">
            {children}
        </div>
    )
}

export default Layout