-- ------------------------------------------------
-- -- !Función que permite generar UUID (ID Unicos)
-- ------------------------------------------------
-- CREATE FUNCTION uuid_generate_v4()
--  RETURNS uuid
--  LANGUAGE c
--  PARALLEL SAFE STRICT
-- AS '$libdir/uuid-ossp', $function$uuid_generate_v4$function$;

------------------------------------------------
-- * Creación de tablas sin Foreign Keys
------------------------------------------------

-- *Tabla de roles
CREATE TABLE IF NOT EXISTS "Rol" (
    "id" uuid NOT NULL DEFAULT gen_random_uuid(),
    "description" varchar(256) NOT NULL,
    PRIMARY KEY("id")
);

-- *Tabla de Empleados
CREATE TABLE IF NOT EXISTS "Employee" (
    "ci" numeric(10,0) NOT NULL,
    "first_name" varchar(256) NOT NULL,
    "middle_name" varchar(256),
    "last_name" varchar(256) NOT NULL,
    "family_name" varchar(256) NOT NULL,
    "phone_number" varchar2 NOT NULL,
    "email" varchar(256) NOT NULL UNIQUE,
    "address" varchar(256) NOT NULL,
    PRIMARY KEY("ci"),
    CONSTRAINT "chk_email" CHECK (email ~* '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$')
);

-- *Tabla de Categoría de productos
CREATE TABLE IF NOT EXISTS "Category" (
    "id" uuid NOT NULL DEFAULT gen_random_uuid(),
    "name" varchar(256) NOT NULL,
    "description" varchar(256) NOT NULL,
    PRIMARY KEY("id")
);

-- *Tabla de Proveedores
CREATE TABLE IF NOT EXISTS "Supplier" (
    "id" uuid NOT NULL DEFAULT gen_random_uuid(),
    "name" varchar(256) NOT NULL,
    "email" varchar(256) NOT NULL UNIQUE,
    "phone_number" varchar(256) NOT NULL,
    "address" varchar(256) NOT NULL,
    "sector" varchar(256) NOT NULL,
    PRIMARY KEY("id"),
    CONSTRAINT "chk_email" CHECK (email ~* '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$')
);

-- *Tabla de Clientes
CREATE TABLE IF NOT EXISTS "Client" (
    "ci" numeric(10,0) NOT NULL,
    "first_name" varchar(256) NOT NULL,
    "middle_name" varchar(256),
    "last_name" varchar(256) NOT NULL,
    "family_name" varchar(256) NOT NULL,
    "phone_number" varchar(256) NOT NULL,
    "email" varchar(256) NOT NULL,
    "address" varchar(256) NOT NULL,
    "gender" varchar(2) NOT NULL,
    PRIMARY KEY("ci"),
    CONSTRAINT "chk_email" CHECK (email ~* '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$'),
    CONSTRAINT "chk_gender" CHECK (gender IN ('M', 'F'))
);

-- *Tabla de Sucursales
CREATE TABLE IF NOT EXISTS "Branch" (
    "id" uuid NOT NULL DEFAULT gen_random_uuid(),
    "address_line_1" varchar(256) NOT NULL,
    "address_line_2" varchar(256),
    "municipalty" varchar(256) NOT NULL,
    "city" varchar(256) NOT NULL,
    "zip" varchar(256) NOT NULL,
    "mensual_cost" numeric(10,2) NOT NULL,
    PRIMARY KEY("id")
);

-------------------------------------------
-- * Creación de tablas con Foreign Keys
-------------------------------------------

-- *Tabla de Historico de Empleado
CREATE TABLE IF NOT EXISTS "EmployeeHistory"(
    "date_start" date NOT NULL,
    "date_end" date,
    "salary" numeric(10,2) NOT NULL,
    "role" uuid NOT NULL,
    "ci_employee" numeric(10,0) NOT NULL,
    "branchId" uuid NOT NULL,
    PRIMARY KEY("date_start"),
    CONSTRAINT "fk_employee" FOREIGN KEY ("ci_employee") REFERENCES "Employee"("ci"),
    CONSTRAINT "fk_rol" FOREIGN KEY ("role") REFERENCES "Rol"("id"),
    CONSTRAINT "fk_branch" FOREIGN KEY ("branchId") REFERENCES "Branch"("id")
)

-- *Tabla de Ausencia de Empleado
CREATE TABLE IF NOT EXIST "Absence" (
    "date" date NOT NULL,
    "justified" varchar(256) NOT NULL,
    "date_start" date NOT NULL,
    PRIMARY KEY("date"),
    CONSTRAINT "fk_employeeHistory" FOREIGN KEY ("date_start") REFERENCES "EmployeeHistory"("date_start")
);

-- *Tabla de Costo Extra
CREATE TABLE IF NOT EXISTS "ExtraCost" (
    "id" uuid NOT NULL DEFAULT gen_random_uuid(),
    "date" date NOT NULL,
    "cost" numeric(10,2) NOT NULL,
    "description" varchar(256) NOT NULL,
    "branch" uuid NOT NULL,
    PRIMARY KEY("id"),
    CONSTRAINT "fk_branch" FOREIGN KEY ("branch") REFERENCES "Branch"("id")
);

-- *Tabla de Productos
CREATE TABLE IF NOT EXISTS "Product" (
    "id" uuid NOT NULL DEFAULT gen_random_uuid(),
    "name" varchar(256) NOT NULL,
    "description" varchar(256) NOT NULL,
    "category" uuid NOT NULL,
    PRIMARY KEY("id"),
    CONSTRAINT "fk_category" FOREIGN KEY ("category") REFERENCES "Category"("id")
);

-- *Tabla de precio Historico
CREATE TABLE IF NOT EXISTS "PriceHistory" (
    "date" date NOT NULL,
    "price" numeric(10,2) NOT NULL,
    "productId" uuid NOT NULL,
    PRIMARY KEY("date"),
    CONSTRAINT "fk_product" FOREIGN KEY ("productId") REFERENCES "Product"("id")
)

-- *Tabla de Ordenes
CREATE TABLE IF NOT EXISTS "Order" (
    "id" uuid NOT NULL DEFAULT gen_random_uuid(),
    "date" date NOT NULL,
    "total" numeric(10,2) NOT NULL,
    "taxes" numeric(10,2) NOT NULL,
    "discount" numeric(10,2) NOT NULL,
    "client" numeric(10,0) NOT NULL,
    "branch" uuid NOT NULL,
    PRIMARY KEY("id"),
    CONSTRAINT "fk_client" FOREIGN KEY ("client") REFERENCES "Client"("ci"),
    CONSTRAINT "fk_branch" FOREIGN KEY ("branch") REFERENCES "Branch"("id")
);

-- *Tabla de Ordenes de Productos
CREATE TABLE IF NOT EXISTS "OrderProduct" (
    "order" uuid NOT NULL,
    "product" uuid NOT NULL,
    "quantity" numeric(10,0) NOT NULL,
    "discount" numeric(10,2) NOT NULL,
    PRIMARY KEY("order", "product"),
    CONSTRAINT "chk_quantity" CHECK (quantity > 0),
    CONSTRAINT "fk_order" FOREIGN KEY ("order") REFERENCES "Order"("id"),
    CONSTRAINT "fk_product" FOREIGN KEY ("product") REFERENCES "Product"("id")
);

-- *Tabla de Compra por lotes
CREATE TABLE IF NOT EXISTS "BatchBuy" (
    "id" uuid NOT NULL DEFAULT gen_random_uuid(),
    "quantity" numeric(10,0) NOT NULL,
    "date" date NOT NULL,
    "taxes" numeric(10,2) NOT NULL,
    "date_production" date NOT NULL,
    "due_date" date NOT NULL,
    "purchase_price" numeric(10,2) NOT NULL,
    "supplier" uuid NOT NULL,
    "branch" uuid NOT NULL,
    "product" uuid NOT NULL,
    PRIMARY KEY("id"),
    CONSTRAINT "chk_quantity" CHECK (quantity > 0),
    CONSTRAINT "fk_supplier" FOREIGN KEY ("supplier") REFERENCES "Supplier"("id"),
    CONSTRAINT "fk_branch" FOREIGN KEY ("branch") REFERENCES "Branch"("id"),
    CONSTRAINT "fk_product" FOREIGN KEY ("product") REFERENCES "Product"("id")
);