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
    Chip,
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


type GenderssMapKey = 'M' | 'F';
const genders: GenderssMapKey[] = ['M', 'F']
const gendersMap = {
    "M": 'Hombre',
    "F": 'Mujer',
}

export default function Home() {
    const [branch, setBranch] = useState<string>();
    const [category, setCategory] = useState<string>();
    return (
        <>
            <Report
                filters={
                    <Filters
                        setBranch={setBranch}
                        setCategory={setCategory}
                    />
                }
                head={head()}
                body={
                    <Body
                        branch={branch}
                        category={category}
                    />
                }
            />
        </>
    );
}

interface IFilters {
    setBranch: (value: string | undefined) => void;
    setCategory: (value: string | undefined) => void;
}

const Filters: FC<IFilters> = ({
    setBranch,
    setCategory,
}) => {
    const { data: branches, isLoading: isLoadingBranches } = useSWR<any[]>(
        'api/branches',
        { fetcher }
    );
    const { data: categories, isLoading: isLoadingCategories } = useSWR<any[]>(
        'api/categories',
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
                            {[null].concat(categories ?? []).map((item: any) =>
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
                    <p className="text-md">Productos con mayor margen de Ganancia.</p>
                    <p className="text-small text-default-500">
                        Este reporte ofrece un análisis detallado de la rentabilidad de nuestros productos.
                    </p>
                </div>
            </CardHeader>
        </Card>
    );
};

interface IBody {
    branch: string | undefined;
    category: string | undefined;
}

const Body: FC<IBody> = ({
    branch,
    category
}) => {
    const [data, setData] = useState<any>();
    useEffect(() => {
        console.log({
            branchFilter: branch ? formatString(branch) : null,
            categoryFilter: category ? formatString(category) : null,
        })
        axios
            .post<any>('api/higherProfitsPerProduct', {
                branchFilter: branch ? formatString(branch) : null,
                categoryFilter: category ? formatString(category) : null,
            })
            .then((res) => {
                console.log(res.data);
                setData(res.data);
            })
            .catch((err) => console.log(err));
    }, [category, branch]);
    if (!data) return <Spinner />;
    return (
        <Card className="h-full">
            <CardBody>
                <Table>
                    <TableHeader>
                        <TableColumn>Nombre Producto</TableColumn>
                        <TableColumn>Precio Producto</TableColumn>
                        <TableColumn>Costo por Producto</TableColumn>
                        <TableColumn>Beneficios (%)</TableColumn>
                    </TableHeader>
                    <TableBody
                        emptyContent={
                            'No hay empleados con los parámetros de búsqueda seleccionados'
                        }
                    >
                        {data.map((item: HigherProfitsPerProduct) => (
                            <TableRow key={item.id}>
                                <TableCell>{item.name}</TableCell>
                                <TableCell>{Number(item.price).toFixed(2)}</TableCell>
                                <TableCell>{Number(item.cost).toFixed(2)}</TableCell>
                                <TableCell>
                                    {
                                        <Chip
                                            color={
                                                Number(item.benefits) <= 30 && Number(item.benefits) >= 0
                                                    ? 'warning'
                                                    : Number(item.benefits) > 30
                                                        ? 'success'
                                                        : 'danger'
                                            }
                                        >
                                            {`${Number(item.benefits).toFixed(2)} %`}
                                        </Chip>
                                    }
                                </TableCell>
                            </TableRow>
                        ))}
                    </TableBody>
                </Table>
            </CardBody>
        </Card>
    );
};

interface HigherProfitsPerProduct {
    id: string;
    name: string;
    price: number;
    cost: number;
    benefits: number;
}
