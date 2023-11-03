'use client';
import { FC, useEffect, useState } from 'react';
import useSWR from 'swr';
import axios from 'axios';
import { Report } from '@/components/ui/Report';
import {
  Button,
  Card,
  CardBody,
  CardHeader,
  Checkbox,
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

export default function Home() {
  const [branch, setBranch] = useState<string>();
  const [rol, setRol] = useState<string>();
  const [onlyActive, setOnlyActive] = useState<boolean>(false);
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
            setRol={setRol}
            setStartDate={setStartDate}
            setEndDate={setEndDate}
            setOrder={setOrder}
            date={startDate}
            setActive={setOnlyActive}
            active={onlyActive}
          />
        }
        head={head()}
        body={
          <Body
            onlyActive={onlyActive}
            branch={branch}
            rol={rol}
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
  setRol: (value: string | undefined) => void;
  setStartDate: (value: string) => void;
  setEndDate: (value: string) => void;
  setOrder: (value: boolean) => void;
  setActive: (value: boolean) => void;
  date: string;
  active: boolean;
}

const Filters: FC<IFilters> = ({
  setBranch,
  setRol,
  setStartDate,
  setEndDate,
  setOrder,
  date,
  setActive,
  active,
}) => {
  const { data: branches, isLoading: isLoadingBranches } = useSWR<any[]>(
    'api/branches',
    { fetcher }
  );
  const { data: roles, isLoading: isLoadingRoles } = useSWR<any[]>(
    'api/roles',
    { fetcher }
  );
  return (
    <Card className="h-full">
      <CardBody>
        <div className="h-full w-full flex flex-col gap-4">
          {
            active ? (
              <Button
                onClick={() => setActive(false)}
                color="success"
                variant='flat'
              >
                Solo empleados activos
              </Button>
            ) : (
              <Button
                onClick={() => setActive(true)}
                color="danger"
                variant='flat'
              >
                Solo empleados inactivos
              </Button>
            )
          }
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
          {isLoadingRoles ? (
            <div className="flex justify-center w-full">
              <Spinner />
            </div>
          ) : (
            <Select
              label="Rol"
              onChange={(e) =>
                setRol(e.target.value == '0' ? undefined : e.target.value)
              }
            >
              {[null].concat(roles ?? []).map((item: any) =>
                item ? (
                  <SelectItem key={item.id} value={item.id}>
                    {item.description}
                  </SelectItem>
                ) : (
                  <SelectItem key={0} value={0}>
                    Todos
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
          <p className="text-md">Ausencias de empleados.</p>
          <p className="text-small text-default-500">
            Este reporte ofrece un análisis detallado de la asistencia de los empleados en nuestra organización.
          </p>
        </div>
      </CardHeader>
    </Card>
  );
};

interface IBody {
  rol: string | undefined;
  branch: string | undefined;
  onlyActive: boolean;
  startDate: string;
  endDate: string;
  order: boolean;
}

const Body: FC<IBody> = ({
  rol,
  branch,
  endDate,
  order,
  startDate,
  onlyActive,
}) => {
  const [data, setData] = useState<any>();
  useEffect(() => {
    axios
      .post<any>('api/moreAbsences', {
        roleFilter: rol ? formatString(rol) : null,
        activeEmployee: onlyActive,
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
  }, [rol, branch, endDate, order, startDate, onlyActive]);
  if (!data) return <Spinner />;
  return (
    <Card className="h-full">
      <CardBody>
        <Table>
          <TableHeader>
            <TableColumn>Nombre del empleado</TableColumn>
            <TableColumn>Rol</TableColumn>
            <TableColumn>Estado del empleado</TableColumn>
            <TableColumn>Direccion de sucursal</TableColumn>
            <TableColumn>Cantidad inasistencias</TableColumn>
          </TableHeader>
          <TableBody
            emptyContent={
              'No hay empleados con ausencias con los parámetros de búsqueda seleccionados'
            }
          >
            {data.map((item: MoreAbsences, i: number) => (
              <TableRow key={i}>
                <TableCell>{item.first_name + ' ' +item.last_name}</TableCell>
                <TableCell>{item.employee_rol}</TableCell>
                <TableCell>{item.isActive}</TableCell>
                <TableCell>{item.branch_name}</TableCell>
                <TableCell>{item.quantity}</TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </CardBody>
    </Card>
  );
};

interface MoreAbsences {
  first_name: string;
  last_name: string;
  employee_rol: string;
  isActive: string;
  branch_name: string;
  quantity: number;
}
