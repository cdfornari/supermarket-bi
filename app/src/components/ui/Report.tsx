import { FC } from 'react';

interface Props {
  filters: React.ReactNode;
  head: React.ReactNode;
  body: React.ReactNode;
}

export const Report: FC<Props> = ({ head, filters, body }) => {
  return (
    <div className="w-full h-full grid grid-cols-6 grid-rows-6">
      <div className="col-span-6 row-span-1 flex items-center">{head}</div>
      <div className="col-span-1 row-span-5 px-2">{filters}</div>
      <div className="col-span-5 row-span-5 px-2">{body}</div>
    </div>
  );
};
