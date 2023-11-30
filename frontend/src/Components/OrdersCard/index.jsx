import { CurrencyDollarIcon, ShoppingBagIcon, CalendarDaysIcon } from "@heroicons/react/24/solid"

const OrdersCard = props => {
    const { totalPrice, totalProducts  } = props
    return (
        <div className='flex justify-between w-full h-20 my-2 border rounded-lg border-white items-center px-4'>
            <p className='flex justify-between w-80 '>
                <span className='flex items-center'>
                    <CalendarDaysIcon className='w-5 h-5 mx-3' />
                    01-02-23
                </span>
                
                <span className='flex items-center'>
                    <ShoppingBagIcon className='w-5 h-5 mx-1'/>
                    {totalProducts} Products
                </span>
                <span className='flex items-center'>
                    <CurrencyDollarIcon className='w-5 h-5 mx-1'/>
                    $ {totalPrice}</span>
            </p>
        </div>
    )
}

export default OrdersCard
