import { pool } from "../../../utils/database";

interface RequestBody {
	categoryFilter : string | null,
	branchFilter : string | null,
}

export async function POST(req: Request) {
    const { categoryFilter, branchFilter }: RequestBody = await req.json();
    const result = await pool.query(
        `SELECT * 
        FROM 
        reportHigherProfitsPerProduct(${categoryFilter}, ${branchFilter})
        `
    );
    return Response.json(result.rows);
}