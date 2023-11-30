import  { useContext }  from 'react'
import { Link } from 'react-router-dom'
import { XMarkIcon } from '@heroicons/react/24/solid'
import './styles.css'
import { ShoppingCartContext } from '../../Context'
import OrderCard from '..//../Components/OrderCard'
import { totalPrice } from '../../utils'


const CheckoutSideMenu = () => {
    
    const context = useContext(ShoppingCartContext)

    const deleteProduct = (id) => {
        const filteredProducts = context.cartProducts.filter(product => product.id != id)
        context.setCartProducts(filteredProducts)
    }

const handleCheckout = () => {
    const orderToAdd = {
        date:'02.12.23',
        products: context.cartProducts,
        totalProducts: context.cartProducts.length,
        totalPrice: totalPrice(context.cartProducts)
    }

    context.setOrder([...context.order, orderToAdd])
    context.setCartProducts([])
    context.setSearchByTitle(null)
}

    return (
        <aside 
        className={`${context.isCheckoutSideMenuOpen ? 'flex' : 'hidden'} checkout-side-menu overflow-y-scroll h-3/6 flex-300 fixed right-0 border border-black rounded-lg bg-white flex-col`}>
            <div className='flex  items-center p-6 h-auto  w-full  justify-between'>
                <h2 className='text-xl font-bold text-black'>My Order</h2>
                <div>
                    <XMarkIcon className='h-6 w-6 text-red-700 cursor-pointer' 
                    onClick={() => context.closeCheckoutSideMenu()}/>
                </div>
            </div>
            <div className='px-5 pb-2 flex-1'>
                 {
                     context.cartProducts.map(product => (
                         <OrderCard 
                             key={product.id}
                             id={product.id}
                             title={product.title}
                             imageUrl={product.images}
                             price={product.price}
                             deleteProduct={deleteProduct}
                         />
                    ))
                }
            </div>
            <div className='px-5 pb-2 w-full '>
                <p className='flex justify-between mx-2 my-2'>
                    <span className='mx-2 text-xl font-light'>Total:</span>
                    <span className='text-xl '> ${totalPrice(context.cartProducts)}</span>
                </p>
                <Link to='/my-orders/last'>
                    <button 
                        onClick={() => handleCheckout()} 
                        className='w-full bg-gray-500 py-2.5 rounded-lg mb-4'>CheckOut</button>
                </Link>          
            </div>
        </aside>
    )
}

export default CheckoutSideMenu
