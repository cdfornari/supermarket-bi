import { pool } from "../../../../utils/database";

export async function GET(req: Request) {
    const { searchParams } = new URL(req.url);

    const sortOrder: string | null = searchParams.get('sortOrder');
    const date_start: string | null = searchParams.get('date_start');
    const date_end: string | null = searchParams.get('date_end');
    const categoryFilter: string | null = searchParams.get('categoryFilter');

    const result = await pool.query(
        `SELECT * 
        FROM 
        reportProductsByPopularity(${sortOrder}, ${categoryFilter}, ${date_start}, ${date_end})
        `
    );
    return Response.json(result.rows);

    // Nota: los datos string deben mandarse entre comillas simples ('dato')
}