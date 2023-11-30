import Layout from '../../Components/Layout'
import { Link } from 'react-router-dom'
import { ChevronLeftIcon } from '@heroicons/react/24/solid'
import { useContext } from 'react'
import { ShoppingCartContext } from '../../Context'
import  OrderCard  from '../../Components/OrderCard'

function MyOrder () {
    const context = useContext(ShoppingCartContext)
    const currentPath = window.location.pathname
    let index = currentPath.substring(currentPath.lastIndexOf('/') + 1)
    console.log(index)

    if(index === 'last') index = context.order?.length - 1
    

     return (
        <Layout>
            <div className='flex mb-3 w-80 relative justify-center'>
                <Link to='/my-orders'>
                <ChevronLeftIcon className='h-6 w-6 text-black cursor-pointer mx-2 absolute left-0 ' />
                </Link> 
                <h1>MyOrder</h1>
                
            </div>
            <div className='h-auto w-80 flex flex-col '>
                 {
                    context.order?.[index]?.products.map(product => (
                        <OrderCard 
                            key={product.id}
                            id={product.id}
                            title={product.title}
                            imageUrl={product.images}
                            price={product.price}  
                        />
                    ))
                }
            </div>
        </Layout>
     )
}

export default MyOrder