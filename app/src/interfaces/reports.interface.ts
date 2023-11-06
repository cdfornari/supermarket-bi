export interface PopularProducts {
    product_name: string;
    product_description: string;
    product_price: string;
    product_category: string;
    product_quantity: string;
}

export interface BenefitsBranches {
    branch_address_line_1: string;
    branch_municipalty: string;
    branch_city: string;
    branch_mensual_cost: string;
    branch_benefits: string;
}

export interface MoreAbsences {
    first_name: string;
    last_name: string;
    employee_rol: string;
    isActive: string;
    branch_name: string;
    quantity: number;
}

export interface ClientsBuysMore {
    first_name: string;
    last_name: string;
    client_phone: string;
    client_email: string;
    quantityOrders: number;
    quantityProducts: number;
    totalSpent: number
}

export interface HigherProfitsPerProduct {
    id: string;
    name: string;
    price: number;
    cost: number;
    benefits: number;
}

export interface Restock {
    product_name: string;
    product_category: string;
    product_stock: string;
    average_demand: string;
}

export interface HighestSalary {
    employeename: string;
    employeelastname: string;
    highestsalary: string;
    rol: string;
}