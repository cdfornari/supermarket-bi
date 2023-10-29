import { pool } from "../../../../utils/database";

interface RequestBody {
    sortOrder: boolean;
    limit: number | null;
    date_start: string | null;
    date_end: string | null;
    categoryFilter: string | null;
}

export async function POST(req: Request) {
    const { sortOrder, limit, date_start, date_end, categoryFilter }: RequestBody = await req.json();
    console.log(sortOrder, date_start, date_end, categoryFilter);
    const result = await pool.query(
        `SELECT * 
        FROM 
        reportProductsByPopularity(${sortOrder}, ${limit} ,${categoryFilter}, ${date_start}, ${date_end})
        `
    );
    return Response.json(result.rows);
}