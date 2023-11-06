'use client';
import { FC, useEffect, useState } from 'react';
import useSWR from 'swr';
import axios from 'axios';
import { Report } from '@/components/ui/Report';
import {
  Card,
  CardBody,
  CardHeader,
  Image,
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
} from '@nextui-org/react';
import { fetcher } from '@/utils/fetcher';
import { formatString } from '@/utils/formatString';
import { ClientsBuysMore } from '@/interfaces/reports.interface';
import { Branch } from '@/interfaces/branch.interface';

export default function Home() {
  const [branch, setBranch] = useState<string>();
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
  setStartDate: (value: string) => void;
  setEndDate: (value: string) => void;
  setOrder: (value: boolean) => void;
  date: string;
}

const Filters: FC<IFilters> = ({
  setBranch,
  setStartDate,
  setEndDate,
  date,
}) => {
  const { data: branches, isLoading: isLoadingBranches } = useSWR<Branch[]>(
    'api/branches',
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
          <p className="text-md">Clientes que más compran.</p>
          <p className="text-small text-default-500">
            Este reporte proporciona un análisis detallado del comportamiento de compra de nuestros clientes.
          </p>
        </div>
      </CardHeader>
    </Card>
  );
};

interface IBody {
  branch: string | undefined;
  startDate: string;
  endDate: string;
  order: boolean;
}

const Body: FC<IBody> = ({
  branch,
  endDate,
  order,
  startDate,
}) => {
  const [data, setData] = useState<any>();
  useEffect(() => {
    axios
      .post<any>('api/buysMore', {
        branchFilter: branch ? formatString(branch) : null,
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
  }, [
    branch,
    endDate,
    order,
    startDate,
  ]);
  if (!data) return <Spinner />;
  return (
    <Card className="h-full">
      <CardBody>
        <Table aria-label="Clientes con más compras" >
          <TableHeader>
            <TableColumn>Nombre Cliente</TableColumn>
            <TableColumn>Teléfono</TableColumn>
            <TableColumn>Email</TableColumn>
            <TableColumn>Total Ordenes</TableColumn>
            <TableColumn>Total Productos</TableColumn>
            <TableColumn>Total gastado</TableColumn>
          </TableHeader>
          <TableBody
            emptyContent={
              'No hay ventas con los parámetros de búsqueda seleccionados'
            }
          >
            {data.map((item: ClientsBuysMore, i: number) => (
              <TableRow key={i}>
                <TableCell>{`${item.first_name} ${item.last_name}`}</TableCell>
                <TableCell>{`${item.client_phone}`}</TableCell>
                <TableCell>{`${item.client_email}`}</TableCell>
                <TableCell>{`${item.quantityOrders}`}</TableCell>
                <TableCell>{`${item.quantityProducts}`}</TableCell>
                <TableCell>{`${item.totalSpent} $`}</TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </CardBody>
    </Card>
  );
};