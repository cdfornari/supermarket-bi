import { pool } from '../../../utils/database';

interface RequestBody {
  branch: number | null;
  type: string | null;
  n: number | null;
}

export async function POST(req: Request) {
  const { branch, type, n }: RequestBody = await req.json();
  const result = await pool.query(
    `SELECT * 
        FROM 
        reportinventorydemandanalysis(${branch},${type},${n})
        `
  );
  return Response.json(result.rows);
}
