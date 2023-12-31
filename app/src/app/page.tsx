'use client';
import { FC, useEffect, useState } from 'react';
import useSWR from 'swr';
import axios from 'axios';
import { Report } from '@/components/ui/Report';
import {
  Card,
  CardBody,
  CardHeader,
  Input,
  Select,
  SelectItem,
  Spinner,
  Table,
  TableBody,
  TableCell,
  TableColumn,
  TableHeader,
  TableRow,
  Image
} from '@nextui-org/react';
import { fetcher } from '@/utils/fetcher';
import { formatString } from '@/utils/formatString';
import { PopularProducts } from '@/interfaces/reports.interface';
import { Branch } from '@/interfaces/branch.interface';
import { Category } from '@/interfaces/category.interface';

export default function Home() {
  const [branch, setBranch] = useState<string>();
  const [category, setCategory] = useState<string>();
  const [endDate, setEndDate] = useState(
    new Date().toISOString().split('T')[0]
  );
  const [startDate, setStartDate] = useState(() => {
    const date = new Date();
    date.setFullYear(date.getFullYear() - 20);
    return date.toISOString().split('T')[0];
  });
  const [order, setOrder] = useState(true);
  return (
    <>
      <Report
        filters={
          <Filters
            setBranch={setBranch}
            setCategory={setCategory}
            setStartDate={setStartDate}
            setEndDate={setEndDate}
            setOrder={setOrder}
            date={startDate}
          />
        }
        head={head()}
        body={
          <Body
            branch={branch}
            category={category}
            endDate={endDate}
            order={order}
            startDate={startDate}
          />
        }
      />
    </>
  );
}

interface IFilters {
  setBranch: (value: string | undefined) => void;
  setCategory: (value: string | undefined) => void;
  setStartDate: (value: string) => void;
  setEndDate: (value: string) => void;
  setOrder: (value: boolean) => void;
  date: string;
}

const Filters: FC<IFilters> = ({
  setBranch,
  setCategory,
  setStartDate,
  setEndDate,
  date,
}) => {
  const { data: branches, isLoading: isLoadingBranches } = useSWR<Branch[]>(
    'api/branches',
    { fetcher }
  );
  const { data: categories, isLoading: isLoadingCategories } = useSWR<Category[]>(
    'api/categories',
    { fetcher }
  );
  return (
    <Card className="h-full">
      <CardBody>
        <div className="h-full w-full flex flex-col gap-4">
          <Input
            type="date"
            label="Fecha inicial"
            defaultValue={date}
            onChange={(e) => setStartDate(e.target.value)}
          />
          <Input
            type="date"
            label="Fecha fin"
            defaultValue={new Date().toDateString()}
            onChange={(e) => setEndDate(e.target.value)}
          />
          {isLoadingBranches ? (
            <div className="flex justify-center w-full">
              <Spinner />
            </div>
          ) : (
            <Select
              label="Sucursal"
              onChange={(e) =>
                setBranch(e.target.value == '0' ? undefined : e.target.value)
              }
            >
              {[null, ...(branches ?? [])].map((item: Branch | null) =>
                item ? (
                  <SelectItem key={item.id} value={item.id}>
                    {`${item.address_line_1}, ${item.city}, ${item.municipalty}, ${item.zip}`}
                  </SelectItem>
                ) : (
                  <SelectItem key={0} value={0}>
                    Todas
                  </SelectItem>
                )
              )}
            </Select>
          )}
          {isLoadingCategories ? (
            <div className="flex justify-center w-full">
              <Spinner />
            </div>
          ) : (
            <Select
              label="Categoría"
              onChange={(e) =>
                setCategory(e.target.value == '0' ? undefined : e.target.value)
              }
            >
              {[null, ...(categories ?? [])].map((item: Category | null) =>
                item ? (
                  <SelectItem key={item.id} value={item.id}>
                    {item.name}
                  </SelectItem>
                ) : (
                  <SelectItem key={0} value={0}>
                    Todas
                  </SelectItem>
                )
              )}
            </Select>
          )}
        </div>
      </CardBody>
    </Card>
  );
};

const head = () => {
  return (
    <Card className="w-full">
      <CardHeader className="flex gap-3">
        <Image
          alt="Shopping Hub Logo"
          radius="sm"
          src="/logo.png"
          width={200}
        />
        <div className="flex flex-col">
          <p className="text-md">Productos más populares.</p>
          <p className="text-small text-default-500">
            Este reporte muestra los productos que han demostrado un mayor nivel de popularidad en nuestra plataforma.
          </p>
        </div>
      </CardHeader>
    </Card>
  );
};

interface IBody {
  category: string | undefined;
  branch: string | undefined;
  startDate: string;
  endDate: string;
  order: boolean;
}

const Body: FC<IBody> = ({ category, branch, endDate, order, startDate }) => {
  const [data, setData] = useState<any>();
  useEffect(() => {
    axios
      .post<any>('api/popularProducts', {
        categoryFilter: category ? formatString(category) : null,
        branch: branch ? formatString(branch) : null,
        date_start: formatString(startDate),
        date_end: endDate ? formatString(endDate) : null,
        sortOrder: order,
        limit: null,
      })
      .then((res) => {
        console.log(res.data);
        setData(res.data);
      })
      .catch((err) => console.log(err));
  }, [category, branch, endDate, order, startDate]);
  if (!data) return <Spinner />;
  return (
    <Card className="h-full">
      <CardBody>
        <Table aria-label= "Productos Populares" >
          <TableHeader>
            <TableColumn>Producto</TableColumn>
            <TableColumn>Categoría</TableColumn>
            <TableColumn>Precio</TableColumn>
            <TableColumn>Ventas Totales</TableColumn>
          </TableHeader>
          <TableBody
            emptyContent={
              'No hay ventas con los parámetros de búsqueda seleccionados'
            }
          >
            {data.map((item: PopularProducts, i: number) => (
              <TableRow key={item.product_name}>
                <TableCell>{item.product_name}</TableCell>
                <TableCell>{item.product_category}</TableCell>
                <TableCell>{item.product_price}</TableCell>
                <TableCell>{item.product_quantity}</TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </CardBody>
    </Card>
  );
};
