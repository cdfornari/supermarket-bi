import { pool } from "../../../utils/database";

export async function GET(req: Request) {
    const result = await pool.query(
        `SELECT * 
        FROM 
        getBranches()
        `
    );
    return Response.json(result.rows);
}