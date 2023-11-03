import { pool } from "../../../utils/database";

interface RequestBody {
    limit: number | null;
    activeEmployee: boolean | null;
    employeeGender : string | null;
    roleFilter: string | null;
    branchFilter: string | null;
}

export async function POST(req: Request) {
    const { employeeGender, limit, activeEmployee, roleFilter, branchFilter}: RequestBody = await req.json();
    const result = await pool.query(
        `SELECT * 
        FROM 
        reportTopEarningEmployees( ${activeEmployee}, ${ employeeGender}, ${roleFilter}, ${branchFilter}, ${limit})
        `
    );
    return Response.json(result.rows);
}