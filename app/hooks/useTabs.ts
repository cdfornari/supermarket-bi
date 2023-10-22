import { usePathname } from 'next/navigation';

export const useTabs = () => {
  const pathname = usePathname();
  return tabs(pathname);
};

const tabs = (pathname: string) => [
  {
    name: 'Ventas y costos',
    href: '/',
    active: pathname === '/',
  },
  {
    name: 'Inventario',
    href: '/inventario',
    active: pathname === '/inventario',
  },
  {
    name: 'Clientes',
    href: '/clientes',
    active: pathname === '/clientes',
  },
  {
    name: 'Empleados',
    href: '/empleados',
    active: pathname === '/empleados',
  },
];
