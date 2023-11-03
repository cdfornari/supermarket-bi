'use client';
import { FC, useEffect, useState, useMemo } from 'react';
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
import Bar from '@/components/Charts/Bar';

type PeriodsMapKey = 'day' | 'month' | 'week' | 'year';
const periods: PeriodsMapKey[] = ['day', 'month','week', 'year' ]
const periodsMap = {
	"day": 'Día de la semana',
	"month": 'Mes',
	"week": 'Semana',
	"year": 'Año'
}


export default function Home() {
  const [branch, setBranch] = useState<string>();
  const [product, setProduct] = useState<string>();
  const [period, setPeriod] = useState<string>('day');
  const [category, setCategory] = useState<string>();
  const [endDate, setEndDate] = useState<string>();
  const [startDate, setStartDate] = useState<string>();
  return (
    <>
      <Report
        filters={
          <Filters
            setBranch={setBranch}
            setCategory={setCategory}
            setStartDate={setStartDate}
            setEndDate={setEndDate}
            setProduct={setProduct}
            setPeriod={setPeriod}
          />
        }
        head={head()}
        body={
          <Body
            branch={branch}
            category={category}
            endDate={endDate}
            product={product}
            period={period}
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
  setStartDate: (value: string | undefined) => void;
  setEndDate: (value: string | undefined) => void;
  setProduct: (value: string  | undefined) => void;
  setPeriod: (value: string ) => void;
}
const Filters: FC<IFilters> = ({
  setBranch,
  setCategory,
  setStartDate,
  setEndDate,
  setProduct,
  setPeriod,
}) => {
  const { data: branches, isLoading: isLoadingBranches } = useSWR<any[]>(
    'api/branches',
    { fetcher }
);
  const { data: categories, isLoading: isLoadingCategories } = useSWR<any[]>(
    'api/categories',
    { fetcher }
  );
  const { data: products, isLoading: isLoadingProducts } = useSWR<any[]>(
    'api/products',
    { fetcher }
  );
  return (
    <Card className="h-full">
      <CardBody>
        <div className="h-full w-full flex flex-col gap-4">
        	<Select
						label="Periodo"
						onChange={(e) =>
							// console.log(e.target.value)
							setPeriod(e.target.value)
						}
						
					>
						{periods.map((item: PeriodsMapKey) =>
							(
								<SelectItem key={item} value={item}>
									{periodsMap[item]}
								</SelectItem>
							)
						)}
          </Select>
          <Input
            type="date"
            label="Fecha inicial"
						defaultValue={new Date().toDateString()}
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
          {isLoadingProducts ? (
            <div className="flex justify-center w-full">
              <Spinner />
            </div>
          ) : (
            <Select
              label="Productos"
              onChange={(e) =>
                setProduct(e.target.value == '0' ? undefined : e.target.value)
              }
            >
              {[null].concat(products ?? []).map((item: any) =>
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
          <p className="text-md">Ventas.</p>
          <p className="text-small text-default-500">
            Este reporte proporciona un desglose detallado de las ventas de productos en diferentes periodos de tiempo, desde días específicos de la semana hasta años completos.
          </p>
        </div>
      </CardHeader>
    </Card>
  );
};

interface IBody {
  category: string | undefined;
  branch: string | undefined;
  startDate: string | undefined;
  endDate: string | undefined;
  product: string | undefined;
  period: string | undefined;
}
const y = []
const Body: FC<IBody> = ({ category, branch, endDate, product, startDate, period }) => {
  
	const [data, setData] = useState<any>();

	const y = useMemo(() => {
		if (period == 'week') {
			return data ? data.map((item: any) => item.time_name.split(' ')) : []
		} 
		if (period == 'month') {
			const months = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre']
			return data ? data.map((item: any) => months[item.time_name - 1]) : []
		}
		return data ? data.map((item: any) => item.time_name) : []

	}, [data])

	const x = useMemo(() => {
		return data ? data.map((item: any) => item.sales) : []
	}, [data])
  useEffect(() => {
    console.log({ category, branch, endDate, product, startDate, period })
		axios
      .post<any>('api/salesByTime', {
        categoryFilter: category ? formatString(category) : null,
        branchFilter: branch ? formatString(branch) : null,
        dateStart:  startDate ? formatString(startDate) : null,
        dateEnd:  endDate ? formatString(endDate) : null,
        productFilter: product ? formatString(product) : null,
				period: period ? formatString(period) : 'day'
      })
      .then((res) => {
        console.log(res.data);
				
        setData(res.data);
      })
      .catch((err) => console.log(err));
  }, [category, branch, endDate, product, startDate, period]);
  if (!data) return <Spinner />;
  return (
    <Card className="h-full"> 
			<CardBody >
				<Bar 
					categories={y}
					data={x}
					dataUnits='ventas'
				  title='Ventas'
					width='100%'
					height='460px'				
				/>
				
			</CardBody>
    </Card>
  );
};
