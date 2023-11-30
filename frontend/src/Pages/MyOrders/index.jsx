import Layout from "../../Components/Layout"
import { Link } from "react-router-dom"
import { ShoppingCartContext } from "../../Context"
import  OrdersCard  from '../../Components/OrdersCard'
import { useContext } from "react"


function MyOrder () {
    const context  = useContext(ShoppingCartContext)

    return (
        <Layout>

            My Orders
            {
                context.order.map((order, index) => (
                    <Link key={index} to={`/my-orders/${index}`}>
                        <OrdersCard 
                            totalPrice={order.totalPrice}  
                            totalProducts={order.totalProducts}/>
                    </Link>
                    ))
            }
            
        </Layout>
    )
}

export default MyOrder