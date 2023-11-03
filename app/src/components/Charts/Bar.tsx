"use client";
import { ApexOptions } from "apexcharts";
import { FC, useState, useMemo, useEffect } from 'react';
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


const defaultOptions: ApexOptions = {
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
      columnWidth: "50%",
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
        colors: "#ffffff",
        fontSize: '16px'
      }
    }
  },

  grid: {
      row: {
      colors: ['#386df2', 'transparent'], // takes an array which will be repeated on columns
      opacity: 0.2
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

  const [options, setOptions] = useState(defaultOptions);


  useEffect(() => {

    setOptions((prevState) => ({
      ...prevState,
      xaxis: {
        labels: {
          style: {
            colors: "#fff",
            fontSize: '16px'
          }
        },
        categories,
      },
      title : {
        text: title,
        align: 'center',
          style: {
            fontSize: '20px',
            color: "#386df2" 
          }
      }
    }));
    setState({
        series: [
          {
            name: dataUnits,
            data,
          },
        ],
    })

  }, [categories, title, data])
  

  //ni puta idea que hace esto
  const handleReset = () => {
    setState((prevState) => ({
      ...prevState,
    }));
  };
  handleReset;

  return (
    <div className="col-span-12 shadow-default dark:border-strokedark dark:bg-boxdark " >

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