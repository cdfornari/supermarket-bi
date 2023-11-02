import { pool } from "../../../utils/database";

export async function GET(req: Request) {
    const result = await pool.query(
        `SELECT * 
        FROM 
        getRoles()
        `
    );
    return Response.json(result.rows);
}