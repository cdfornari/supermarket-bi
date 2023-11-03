import { pool } from '../../../utils/database';

interface RequestBody {
  sortOrder: boolean;
  limit: number | null;
  branchFilter: string | null;
  date_start: string | null;
  date_end: string | null;
}

export async function POST(req: Request) {
  const { sortOrder, limit, branchFilter, date_start, date_end }: RequestBody =
    await req.json();
  const result = await pool.query(
    `SELECT * 
        FROM 
        clientsBuysMore(${sortOrder}, ${limit} ,${branchFilter}, ${date_start}, ${date_end})
        `
  );
  return Response.json(result.rows);
}
