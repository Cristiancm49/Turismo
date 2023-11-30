import  { useContext }  from 'react'
import { XMarkIcon } from '@heroicons/react/24/solid'
import './styles.css'
import { ShoppingCartContext } from '../../Context'
const ProductDetail = () => {
    
    const context = useContext(ShoppingCartContext)
    

    return (
        <aside 
        className={`${context.isProductDetailOpen ? 'flex' : 'hidden'} product-detail  flex-col fixed right-0 border border-black rounded-lg bg-white`}>
            <div className='flex justify-between items-center p-6'>
                <h2 className='text-xl font-bold text-black'>Detail</h2>
                <div>
                    <XMarkIcon className='h-6 w-6 text-red-700 cursor-pointer' onClick={() => context.closeProductDetail()}/>
                </div>
            </div>
            <figure className='px-3 flex justify-center items-center'>
                <img 
                className='w-11/12 h-full rounded-lg'
                src={context.productToShow.images} 
                alt={context.productToShow.title} />
            </figure>
            <p className='flex flex-col p-6'>
                <span className='text-black font-medium text-xl'>{context.productToShow.title}</span>
                <span className='text-black font-bold'>${context.productToShow.price}</span>
                <span>{context.productToShow.description}</span>
            </p>
        </aside>
    )
}

export default ProductDetail
