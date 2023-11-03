import { usePathname } from 'next/navigation';

export const useTabs = () => {
  const pathname = usePathname();
  return tabs(pathname);
};

const tabs = (pathname: string) => [
  {
    name: 'Productos populares',
    href: '/',
    active: pathname === '/',
  },
  {
    name: 'Productos con mayor margen de ganancia',
    href: '/products',
    active: pathname === '/products',
  },
  {
    name: 'Ventas',
    href: '/ventas',
    active: pathname === '/ventas',
  },
  {
    name: 'Productos que necesitan restock',
    href: '/restock',
    active: pathname === '/inventario',
  },
  {
    name: 'Sucursales con mayor utilidad',
    href: '/sucursales',
    active: pathname === '/sucursales',
  },
  {
    name: 'Clientes que más compran',
    href: '/clients',
    active: pathname === '/clients',
  },
  {
    name: 'Sueldos de empleados',
    href: '/sueldos',
    active: pathname === '/sueldos',
  },
  {
    name: 'Ausencias de empleados',
    href: '/ausencias',
    active: pathname === '/ausencias',
  },
];
