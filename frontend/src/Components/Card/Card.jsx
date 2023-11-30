
import { useContext } from 'react'
import {ShoppingCartContext} from '../../Context'
import { PlusIcon, CheckIcon } from '@heroicons/react/24/solid'

const Card = ( data ) => {

    const context = useContext(ShoppingCartContext)

    const showProduct = (productDetail) => {
        context.openProductDetail()
        context.setProductToShow(productDetail)
        context.closeCheckoutSideMenu()
    }

    const addProductToCart = (event, productData) => {
        event.stopPropagation()
        context.setCount(context.count + 1)
        context.setCartProducts([...context.cartProducts, productData])
        context.openCheckoutSideMenu()
        context.closeProductDetail()
    }

    const renderIcon = (id) => {
        const isInCart = context.cartProducts.filter(product => product.id === id).length > 0



    }

    return (
        <div className='bg-white cursor-pointer w-11/12 h-80 shadow-xl rounded-lg ' 
        onClick={(event) => addProductToCart(event, data.data)}>
            <figure className='relative mb-2 w-full h-4/5 rounded-lg '>
                <span className='absolute color-grey-50 rounded-lg bg-white/60 px-4 py-0.5 m-1 bottom-0 left-0 text-xs color-black '>{ data.data.category.name }</span>
                <img className=' rounded-t-lg w-full h-full object-cover' src={data.data.images[0]} alt={data.data.title} />
                {renderIcon(data.data.id)}
            </figure>
            <p className='flex justify-between'>
                <span className='text-sm font-light px-2'>{ data.data.title }</span>
                <span className='text-lg font-medium px-2'>${data.data.price}</span>
            </p>

        </div>
    )
}

export default Card