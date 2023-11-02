import { pool } from "../../../utils/database";

export async function GET(req: Request) {
    const result = await pool.query(
        `SELECT * 
        FROM 
        getProducts()
        `
    );
    return Response.json(result.rows);
}