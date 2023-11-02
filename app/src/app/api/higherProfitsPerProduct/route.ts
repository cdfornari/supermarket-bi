import { pool } from "../../../utils/database";

interface RequestBody {
    limit : number | null,
	categoryFilter : string | null,
	branchFilter : string | null,
	productNameFilter : string | null,
	dateStart : string | null,
	dateEnd : string | null
}

export async function POST(req: Request) {
    const { limit = 5, categoryFilter = null, branchFilter = null, productNameFilter = null, dateStart = "'2000-01-01'", dateEnd = "'2023-12-31'"}: RequestBody = await req.json();
    const result = await pool.query(
        `SELECT * 
        FROM 
        reportHigherProfitsPerProduct(${limit}, ${categoryFilter} ,${branchFilter}, ${productNameFilter} , ${dateStart}, ${dateEnd})
        `
    );
    return Response.json(result.rows);
}