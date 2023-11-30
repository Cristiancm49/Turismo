import { NavLink } from 'react-router-dom'
import { useContext} from 'react'
import { ShoppingCartContext } from '../../Context'
import { GlobeAsiaAustraliaIcon } from '@heroicons/react/24/solid'

function NavBar () {
    
    
    const context = useContext(ShoppingCartContext)

    const activeStyle = 'underline underline-offset-4'

    return (
        <nav className='hidden lg:flex justify-between items-center top-0 fixed w-full lg:py-5 lg:px-8 lg:text-sm lg:font-light h-auto bg-blue-500'>
            
            

            <ul className='flex items-center gap-5'>
                <li className='font-semibold'>
                    <NavLink to='/'>
                        <div className='flex justify-center items-center'>
                            <GlobeAsiaAustraliaIcon className='w-10 h-10 ' />
                            <div className='px-1 flex justify-center items-center'>
                                <a className='text-white font-medium text-2xl'>CAQTUR</a>
                            </div>
                            
                        </div>
                        
                        
                    </NavLink>
                </li>
                <li>
                    <NavLink 
                    onClick={() => context.setSearchByCategory('furnitures')}
                    to='/' 
                    className={({isActive}) => 
                        isActive ? activeStyle: undefined
                    }>
                        <a className='text-white font-medium text-xl'>Paquetes</a>
                         
                    </NavLink>
                </li>
                <li>
                    <NavLink 
                    onClick={() => context.setSearchByCategory('Clothes')}
                    to='/clothes' 
                    className={({isActive}) => 
                        isActive ? activeStyle: undefined
                    }>    <a className='text-white font-medium text-xl'>Empresas</a>
                    </NavLink>
                </li>
                <li>
                    <NavLink 
                    onClick={() => context.setSearchByCategory('furnitures')} 
                    to='/furnitures'
                    className={({isActive}) => 
                        isActive ? activeStyle: undefined
                    }>
                        <a className='text-white font-medium text-xl'>Recomendados</a>
                    </NavLink>
                </li>
                
                <li>
                    <NavLink
                    onClick={() => context.setSearchByCategory('others')} 
                    to='/others'
                    className={({isActive}) => 
                        isActive ? activeStyle: undefined
                    }>
                        <a className='text-white font-medium text-xl'>Conocenos</a>
                        
                    </NavLink>
                </li>

            </ul>
            <ul className='flex items-center gap-3'>
                <li>
                    <NavLink 
                    to='/my-orders'
                    className={({isActive}) => 
                        isActive ? activeStyle: undefined
                    }>
                        <a className='text-white font-medium text-xl'>Reservas</a>
                    </NavLink>
                </li>

                <li>
                    <NavLink 
                    to='/sign-in'
                    className={({isActive}) => 
                        isActive ? activeStyle: undefined
                    }>
                        <a className='text-white font-medium text-xl'>Cristian Cortes</a>
                    </NavLink>
                </li>
                <li className='flex items-center justify-center'>
                    <div className='w-12 h-12 '>
                    <img className='w-full h-full rounded-full' src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRH6noiqHp7CHKzBMzXnk9RMJ6Eh4kjd4oxg&usqp=CAU' alt='Fto de perfil' />
                    </div>
                  
                </li>
                

            </ul>
        </nav>
    )
}

export default NavBar