import { TrashIcon } from "@heroicons/react/24/solid"

const OrderCard = props => {

    const { id, title, imageUrl, price, deleteProduct } = props
    let renderIconTrash
    if (deleteProduct) {
        renderIconTrash = <TrashIcon onClick={() => deleteProduct(id)} className='h-6 w-6 text-black cursor-pointer' />
    }
    return (
        <div className='flex justify-between w-full my-2'>
            <div className='flex items-center justify-between gap-2'>
                <figure className='w-20 h-20'>
                    <img className='w-full h-full rounded-lg ' src={imageUrl} alt={title}/>
                </figure>
                <p className='text-sm font-light'>{title}</p>
            </div>
            <div className='flex items-center gap-2'>
                <p className='text-lg font-medium'>${price}</p>
                {renderIconTrash}
            </div>

        </div>
    )
}

export default OrderCard
