import { pool } from "../../../../utils/database";

export async function GET(req: Request) {
    const { searchParams } = new URL(req.url);
    
    const sortOrder = searchParams.get('sortOrder');
    const branchFilter = searchParams.get('branchFilter');
    const date_start = searchParams.get('date_start');
    const date_end = searchParams.get('date_end');

    const result = await pool.query(
        `SELECT * 
        FROM 
        reportBranchesByBenefits(${sortOrder}, ${branchFilter}, ${date_start} , ${date_end})
        `
    );
    return Response.json(result.rows);

    // Nota: los datos string deben mandarse entre comillas simples ('dato')
}