import { pool } from "../../../utils/database";


interface RequestBody {
    period : string | null,
	categoryFilter : string | null,
	branchFilter : string | null,
	productFilter : string | null,
	dateStart : string,
	dateEnd : string
}

export async function POST(req: Request) {
    const {period = "'month'", categoryFilter = null, branchFilter = null, productFilter = null, dateStart = "'2000-01-01'", dateEnd = "'2023-12-31'"}: RequestBody = await req.json();
    const result = await pool.query(
            `
            SELECT * FROM reportSalesByTime(${period}, ${categoryFilter}, ${branchFilter}, ${productFilter}, ${dateStart}, ${dateEnd})
        `
    );
    return Response.json(result.rows);
}