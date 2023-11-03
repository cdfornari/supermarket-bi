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


type GenderssMapKey = 'M' | 'F';
const genders : GenderssMapKey[] = ['M', 'F']
const gendersMap = {
  "M": 'Hombre',
  "F": 'Mujer', 
}

export default function Home() {
  const [branch, setBranch] = useState<string>();
  const [rol, setRol] = useState<string>();
  const [onlyActive, setOnlyActive] = useState<boolean>(false);
  const [gender, setGender] = useState<string>();
  return (
    <>
      <Report
        filters={
          <Filters
            setBranch={setBranch}
            setGender={setGender}
            setRol={setRol}
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
            gender={gender}
          />
        }
      />
    </>
  );
}

interface IFilters {
  setBranch: (value: string | undefined) => void;
  setRol: (value: string | undefined) => void;
  setGender: (value: string | undefined) => void;
  setActive: (value: boolean) => void;
  active: boolean;
}

const Filters: FC<IFilters> = ({
  setBranch,
  setRol,
  setGender,
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


        <Select
						label="Género"
						onChange={(e) =>
							// console.log(e.target.value)
							setGender(e.target.value)
						}
						
					>
						{genders.map((item: GenderssMapKey) =>
							(
								<SelectItem key={item} value={item}>
									{gendersMap[item]}
								</SelectItem>
							)
						)}
          </Select>

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
      <CardHeader>
        <h1>Empleados y sus salarios</h1>
      </CardHeader>
    </Card>
  );
};

interface IBody {
  rol: string | undefined;
  branch: string | undefined;
  onlyActive: boolean;
  gender : string | undefined;

}

const Body: FC<IBody> = ({
  rol,
  branch,
  gender,
  onlyActive,
}) => {
  const [data, setData] = useState<any>();
  useEffect(() => {
    console.log({
      roleFilter: rol ? formatString(rol) : null,
      activeEmployee: onlyActive,
      branchFilter: branch ? formatString(branch) : null,
      employeeGender : gender ? formatString(gender) : null,
      limit: null,
    })
    axios
      .post<any>('api/highestSalary', {
        roleFilter: rol ? formatString(rol) : null,
        activeEmployee: onlyActive,
        branchFilter: branch ? formatString(branch) : null,
        employeeGender : gender ? formatString(gender) : null,
        limit: null,
      })
      .then((res) => {
        console.log(res.data);
        setData(res.data);
      })
      .catch((err) => console.log(err));
  }, [rol, branch, onlyActive, gender]);
  if (!data) return <Spinner />;
  return (
    <Card className="h-full">
      <CardBody>
        <Table>
          <TableHeader>
            <TableColumn>Nombre</TableColumn>
            <TableColumn>Salario maximo</TableColumn>
            <TableColumn>Rol</TableColumn>
          </TableHeader>
          <TableBody
            emptyContent={
              'No hay empleados con los parámetros de búsqueda seleccionados'
            }
          >
            {data.map((item: any, i: number) => (
              <TableRow key={item.employeename + item.employeelastname}>
                <TableCell>{`${item.employeename} ${item.employeelastname}`}</TableCell>
                <TableCell>{item.highestsalary}</TableCell>
                <TableCell>{item.rol}</TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </CardBody>
    </Card>
  );
};
