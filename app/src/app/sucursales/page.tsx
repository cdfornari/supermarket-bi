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
  Spinner,
  Table,
  TableBody,
  TableCell,
  TableColumn,
  TableHeader,
  TableRow,
} from '@nextui-org/react';
import { formatString } from '@/utils/formatString';
import { BenefitsBranches } from '@/interfaces/reports.interface';

export default function Home() {
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
            setStartDate={setStartDate}
            setEndDate={setEndDate}
            setOrder={setOrder}
            date={startDate}
          />
        }
        head={head()}
        body={<Body endDate={endDate} order={order} startDate={startDate} />}
      />
    </>
  );
}

interface IFilters {
  setStartDate: (value: string) => void;
  setEndDate: (value: string) => void;
  setOrder: (value: boolean) => void;
  date: string;
}

const Filters: FC<IFilters> = ({
  setStartDate,
  setEndDate,
  date,
}) => {
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
          <p className="text-md">Sucursales con mayor utilidad.</p>
          <p className="text-small text-default-500">
            Este reporte ofrece una visión detallada del rendimiento financiero de cada una de nuestras sucursales.
          </p>
        </div>
      </CardHeader>
    </Card>
  );
};

interface IBody {
  startDate: string;
  endDate: string;
  order: boolean;
}

const Body: FC<IBody> = ({ endDate, order, startDate }) => {
  const [data, setData] = useState<any>();
  useEffect(() => {
    axios
      .post<any>('api/benefitsBranches', {
        date_start: formatString(startDate),
        date_end: endDate ? formatString(endDate) : null,
        sortOrder: order,
        limit: null,
        branchFilter: null,
      })
      .then((res) => {
        console.log(res.data);
        setData(res.data);
      })
      .catch((err) => console.log(err));
  }, [endDate, order, startDate]);
  if (!data) return <Spinner />;
  return (
    <Card className="h-full">
      <CardBody>
        <Table aria-label="Sucursales con mayor utilidad" >
          <TableHeader>
            <TableColumn>Dirección</TableColumn>
            <TableColumn>Costo de mantenimiento mensual</TableColumn>
            <TableColumn>Utilidades</TableColumn>
          </TableHeader>
          <TableBody
            emptyContent={
              'No hay resultados con los parámetros de búsqueda seleccionados'
            }
          >
            {data.map((item: BenefitsBranches, i: number) => (
              <TableRow key={i}>
                <TableCell>{`${item.branch_address_line_1}, ${item.branch_municipalty}, ${item.branch_city}`}</TableCell>
                <TableCell>{`$${item.branch_mensual_cost}`}</TableCell>
                <TableCell>{`$${item.branch_benefits}`}</TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </CardBody>
    </Card>
  );
};
