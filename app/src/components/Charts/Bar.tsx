"use client";
import { ApexOptions } from "apexcharts";
import { FC, useState, useMemo } from "react";
import dynamic from "next/dynamic";
const ApexCharts = dynamic(() => import("react-apexcharts"), { ssr: false });



interface BarState {
  series: {
    name: string;
    data: number[];
  }[];
}

interface Props {
  title: string;
  categories: string[];
  data: number[];
  dataUnits: string;
  height: string;
  width: string;
}


const options: ApexOptions = {
  colors: ["#386df2"],
  chart: {
    type: "bar",
    height: 350,
    width: 200,
    toolbar: {
      show: true,
    },
    zoom: {
      enabled: false,
    },
  },
  responsive: [
    {
      breakpoint: 1536,
      options: {
        plotOptions: {
          bar: {
            borderRadius: 0,
            columnWidth: "40%",
          },
        },
      },
    },
  ],
  plotOptions: {
    bar: {
      horizontal: false,
      borderRadius: 0.5,
      columnWidth: "25%",
      borderRadiusApplication: "end",
      borderRadiusWhenStacked: "last",
    },
  },
  dataLabels: {
    enabled: true,
  },

  yaxis:{
    labels: {
      style: {
        colors: "#000",
        fontSize: '16px'
      }
    }
  },
  grid: {
      row: {
      colors: ['#f3f3f3', 'transparent'], // takes an array which will be repeated on columns
      opacity: 0.5
      },
  },
  fill: {
    opacity: 1,
  },
  tooltip: {
    enabled: true,
    cssClass : 'text-black'
  }
};


export const Bar: FC<Props> = ({title, categories, dataUnits, data, width, height}) => {
  const [state, setState] = useState<BarState>({
    series: [
      {
        name: dataUnits,
        data,
      },
      
    ],
  });

  options.xaxis = useMemo(() => {
      return { 
        
        categories,
        labels: {
          style: {
            colors: "#000",
            fontSize: '16px'
          }
        }
       }
     }
    , [categories])

  options.title = useMemo(() => {
    return {
      text : title,
      align: 'center',
      style: {
        fontSize: '20px',
        color: "#386df2"
        
      }
    }
  }, [])

  //ni puta idea que hace esto
  const handleReset = () => {
    setState((prevState) => ({
      ...prevState,
    }));
  };
  handleReset;

  return (
    <div className="col-span-12 rounded-sm border border-stroke bg-white p-7.5 shadow-default dark:border-strokedark dark:bg-boxdark xl:col-span-4">

      <div>
        <div  className="-ml-5 -mb-9">
          <ApexCharts
            options={options}
            series={state.series}
            type="bar"
            width={width}
            height={height}
          />
        </div>
      </div>
    </div>
  );
};

export default Bar;