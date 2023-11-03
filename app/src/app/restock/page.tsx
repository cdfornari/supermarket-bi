'use client';
import { FC, useEffect, useState } from 'react';
import useSWR from 'swr';
import axios from 'axios';
import { Report } from '@/components/ui/Report';
import {
  Card,
  CardBody,
  CardHeader,
  Chip,
  Select,
  SelectItem,
  Spinner,
  Table,
  TableBody,
  TableCell,
  TableColumn,
  TableHeader,
  TableRow,
} from '@nextui-org/react';
import { fetcher } from '@/utils/fetcher';
import { formatString } from '@/utils/formatString';

export default function Home() {
  const [branch, setBranch] = useState<string>();
  const [order, setOrder] = useState(true);
  return (
    <>
      <Report
        filters={<Filters setBranch={setBranch} />}
        head={head()}
        body={<Body branch={branch} />}
      />
    </>
  );
}

interface IFilters {
  setBranch: (value: string | undefined) => void;
}

const Filters: FC<IFilters> = ({ setBranch }) => {
  const { data: branches, isLoading: isLoadingBranches } = useSWR<any[]>(
    'api/branches',
    { fetcher }
  );
  return (
    <Card className="h-full">
      <CardBody>
        <div className="h-full w-full flex flex-col gap-4">
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
              {[null].concat(branches ?? []).map((item: any) =>
                item ? (
                  <SelectItem key={item.id} value={item.id}>
                    {`${item.address_line_1}, ${item.city}, ${item.state}, ${item.zip}`}
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
      <CardHeader>
        <h1>Productos que necesitan restock.</h1>
      </CardHeader>
    </Card>
  );
};

interface IBody {
  branch: string | undefined;
}

const Body: FC<IBody> = ({ branch }) => {
  const [data, setData] = useState<any>();
  useEffect(() => {
    axios
      .post<any>('api/restock', {
        branch: branch ? formatString(branch) : null,
        type: "'month'",
        n: 100,
      })
      .then((res) => {
        console.log(res.data);
        setData(
          res.data.map((item: any) => ({
            ...item,
            product_stock: item.product_stock ?? 10000,
          }))
        );
      })
      .catch((err) => console.log(err));
  }, [branch]);
  if (!data) return <Spinner />;
  return (
    <Card className="h-full">
      <CardBody>
        <Table>
          <TableHeader>
            <TableColumn>Producto</TableColumn>
            <TableColumn>Categoría</TableColumn>
            <TableColumn>Estatus</TableColumn>
          </TableHeader>
          <TableBody
            emptyContent={
              'No hay productos con los parámetros de búsqueda seleccionados'
            }
          >
            {data.map((item: any) => (
              <TableRow key={item.product_name}>
                <TableCell>{item.product_name}</TableCell>
                <TableCell>{item.product_category}</TableCell>
                <TableCell>
                  {Number(item.product_stock) === 0 ? (
                    <Chip color="danger">Agotado</Chip>
                  ) : Number(item.product_stock) >=
                    Number(item.average_demand) * 2 ? (
                    <Chip color="success">Suficiente</Chip>
                  ) : Number(item.product_stock) >
                    Number(item.average_demand) ? (
                    <Chip color="warning">Poco</Chip>
                  ) : (
                    <Chip color="danger">Por debajo de la demanda</Chip>
                  )}
                </TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </CardBody>
    </Card>
  );
};
