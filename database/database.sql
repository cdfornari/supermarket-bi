-------------------------------------------
-- * Creación de tipos de datos abstractos (TDA)
-------------------------------------------

CREATE TYPE "PersonData" AS (
    "ci" varchar(256),
    "first_name" varchar(256),
    "middle_name" varchar(256),
    "last_name" varchar(256),
    "family_name" varchar(256),
    "phone_number" varchar(256),
    "email" varchar(256),
    "address" varchar(256),
    "gender" varchar(2)
);

-------------------------------------------
-- * Creación de tablas sin Foreign Keys
-------------------------------------------

-- *Tabla de Clientes
CREATE TABLE IF NOT EXISTS "Client" (
    "id" uuid NOT NULL DEFAULT gen_random_uuid(),
    "data" "PersonData" NOT NULL,
    PRIMARY KEY("id")
);

-- *Tabla de Empleados
CREATE TABLE IF NOT EXISTS "Employee" (
    "id" uuid NOT NULL DEFAULT gen_random_uuid(),
    "data" "PersonData" NOT NULL,
    PRIMARY KEY("id")
);

-- *Tabla de roles
CREATE TABLE IF NOT EXISTS "Rol" (
    "id" uuid NOT NULL DEFAULT gen_random_uuid(),
    "description" varchar(256) NOT NULL,
    PRIMARY KEY("id")
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
    "employeeId" uuid NOT NULL,
    "branchId" uuid NOT NULL,
    PRIMARY KEY("date_start"),
    CONSTRAINT "fk_employee" FOREIGN KEY ("employeeId") REFERENCES "Employee"("id"),
    CONSTRAINT "fk_rol" FOREIGN KEY ("role") REFERENCES "Rol"("id"),
    CONSTRAINT "fk_branch" FOREIGN KEY ("branchId") REFERENCES "Branch"("id")
);

-- *Tabla de Ausencia de Empleado
CREATE TABLE IF NOT EXISTS "Absence" (
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
    "price" numeric(10,2) NOT NULL,
    "category" uuid NOT NULL,
    PRIMARY KEY("id"),
    CONSTRAINT "chk_price" CHECK (price > 0),
    CONSTRAINT "fk_category" FOREIGN KEY ("category") REFERENCES "Category"("id")
);

-- *Tabla de Ordenes
CREATE TABLE IF NOT EXISTS "Order" (
    "id" uuid NOT NULL DEFAULT gen_random_uuid(),
    "date" date NOT NULL,
    "taxes" numeric(10,2) NOT NULL,
    "discount" numeric(10,2) NOT NULL,
    "subtotal" numeric(10,2) NOT NULL,
    "clientId" uuid NOT NULL,
    "branch" uuid NOT NULL,
    PRIMARY KEY("id"),
    CONSTRAINT "fk_client" FOREIGN KEY ("clientId") REFERENCES "Client"("id"),
    CONSTRAINT "fk_branch" FOREIGN KEY ("branch") REFERENCES "Branch"("id")
);

-- *Tabla de Ordenes de Productos
CREATE TABLE IF NOT EXISTS "OrderProduct" (
    "orderId" uuid NOT NULL,
    "productId" uuid NOT NULL,
    "quantity" numeric(10,0) NOT NULL,
    PRIMARY KEY("orderId", "productId"),
    CONSTRAINT "chk_quantity" CHECK (quantity > 0),
    CONSTRAINT "fk_order" FOREIGN KEY ("orderId") REFERENCES "Order"("id"),
    CONSTRAINT "fk_product" FOREIGN KEY ("productId") REFERENCES "Product"("id")
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

-------------------------------------------
-- * Creación de métodos para la validación del TDA
-------------------------------------------

CREATE OR REPLACE FUNCTION ci_already_exists(ci varchar(256), person_type varchar ) RETURNS BOOLEAN AS $$
BEGIN
	IF person_type = 'Client' THEN
	    IF ci in (SELECT (data).ci FROM "Client") THEN
	        RAISE EXCEPTION 'ERROR la cédula ya está registrada como cliente';
	    ELSE
	        RETURN False;
	    END IF;
	ELSEIF person_type = 'Employee' THEN
		IF ci in (SELECT (data).ci FROM "Employee") THEN
	        RAISE EXCEPTION 'ERROR la cédula ya está registrada como empleado';
	    ELSE
	        RETURN False;
	    END IF;
	END IF;
END;
$$ LANGUAGE plpgsql;

-- * Validación de cédula de identidad
CREATE OR REPLACE FUNCTION validate_ci(ci varchar(256), person_type VARCHAR) RETURNS varchar(256) AS $$
BEGIN
    IF NOT (ci_already_exists(ci, person_type)) AND ci ~ '^[VE]-' THEN
        RETURN ci;
    ELSE
        RAISE EXCEPTION 'ERROR la cédula de identidad no cumple con al formato';
    END IF;
END;
$$ LANGUAGE plpgsql;

-- * Validación de email
CREATE OR REPLACE FUNCTION validate_email(email varchar(256)) RETURNS varchar(256) AS $$
BEGIN
    IF email ~* '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$' THEN
        RETURN email;
    ELSE
        RAISE EXCEPTION 'ERROR el email no cumple con al formato';
    END IF;
END;
$$ LANGUAGE plpgsql;

-- * Validación de género
CREATE OR REPLACE FUNCTION validate_gender(gender varchar(2)) RETURNS varchar(2) AS $$
BEGIN
    IF gender IN ('M', 'F') THEN
        RETURN gender;
    ELSE
        RAISE EXCEPTION 'ERROR género no especificado';
    END IF;
END;
$$ LANGUAGE plpgsql;

-- * Validación de teléfono
CREATE OR REPLACE FUNCTION validate_phone(phone varchar(256)) RETURNS varchar(256) AS $$
BEGIN
    IF phone ~* '^\+\d{1,3}\s?\d{1,14}$' THEN
        RETURN phone;
    ELSE
        RAISE EXCEPTION 'ERROR teléfono no especificado';
    END IF;
END;
$$ LANGUAGE plpgsql;

-- *Crear persona
CREATE OR REPLACE PROCEDURE create_person(
    ci varchar(256),
    first_name varchar(256),
    middle_name varchar(256),
    last_name varchar(256),
    family_name varchar(256),
    phone_number varchar(256),
    email varchar(256),
    person_address varchar(256),
    gender varchar(2),
    person_type varchar
)
AS $$
BEGIN
	IF person_type = 'Client' THEN
		INSERT INTO "Client" VALUES (
	        gen_random_uuid(),
	        ROW(
		        validate_ci(ci, person_type),
		        first_name,
		        middle_name,
		        last_name,
		        family_name,
		        validate_phone(phone_number),
		        validate_email(email),
		        person_address,
		        validate_gender(gender)
	        )
	    );
	ELSEIF person_type = 'Employee' THEN
		INSERT INTO "Employee" VALUES (
	        gen_random_uuid(),
	        ROW(
		        validate_ci(ci, person_type),
		        first_name,
		        middle_name,
		        last_name,
		        family_name,
		        validate_phone(phone_number),
		        validate_email(email),
		        person_address,
		        validate_gender(gender)
	        )
	    );
	END IF;
END;
$$ LANGUAGE plpgsql;

-- Ejemplo de la llamada al procedure
-- CALL create_person(
-- 	'V-1000',
-- 	'Juan',
-- 	'Carlos',
-- 	'Perez',
-- 	'Gonzalez',
-- 	'+58442857485',
-- 	'uncorreo@gmail.com',
-- 	'Chacaito, miranda',
-- 	'M',
-- 	'Employee'
-- )

-------------------------------------------
-- * Creación de los reportes
-------------------------------------------

-- * Reporte de Productos más populares y menos populares
-- ? Filtros: fecha de inicio, fecha de fin - Categoria

CREATE OR REPLACE FUNCTION reportProductsByPopularity(
    sortOrder BOOLEAN, -- True para ordenar de mayor a menor, False para ordenar de menor a mayor
    categoryFilter varchar(256) DEFAULT NULL,
    start_date date DEFAULT NULL,
    end_date date DEFAULT NULL
) RETURNS TABLE (
    "product_name" varchar(256),
    "product_description" varchar(256),
    "product_price" numeric(10,2),
    "product_category" varchar(256),
    "product_quantity" numeric(10,0)
) AS $$
BEGIN
    RETURN QUERY
    SELECT "Product".name, "Product".description, "Product".price, "Category".name, SUM("OrderProduct".quantity)
    FROM "Product" 
        JOIN "OrderProduct" ON "Product".id = "OrderProduct"."productId"
        JOIN "Category" ON "Product".category = "Category".id
        JOIN "Order" ON "OrderProduct"."orderId" = "Order".id
    WHERE 
        (start_date IS NULL OR end_date IS NULL OR "Order".date BETWEEN start_date AND end_date) 
        AND
        (categoryFilter IS NULL OR "Category".name = categoryFilter)
    GROUP BY "Product".id, "Category".id
    ORDER BY 
        CASE WHEN popularity THEN SUM("OrderProduct".quantity) END DESC, 
        CASE WHEN NOT popularity THEN SUM("OrderProduct".quantity) END ASC;
END;
$$ LANGUAGE plpgsql;

-- ? Ejemplo de la llamada al reporte
-- ? SELECT * FROM reportProductsByPopularity(TRUE, NULL, '2020-01-01', '2020-12-31');

-- * Reporte de Sucursales con mayores beneficios y menores beneficios
-- ? Filtros: fecha de inicio, fecha de fin, escoger sucursal.

CREATE OR REPLACE FUNCTION reportBranchesByBenefits(
    sortOrder BOOLEAN, -- True para ordenar de mayor a menor, False para ordenar de menor a mayor
    branchFilter varchar(256) DEFAULT NULL,
    start_date date DEFAULT NULL,
    end_date date DEFAULT NULL
) RETURNS TABLE (
    "branch_address_line_1" varchar(256),
    "branch_municipalty" varchar(256),
    "branch_city" varchar(256),
    "branch_mensual_cost" numeric(10,2),
    "branch_benefits" numeric(10,2)
) AS $$
BEGIN
    RETURN QUERY
    SELECT "Branch".address_line_1, "Branch".municipalty, "Branch".city, "Branch".mensual_cost, SUM("Order".subtotal - "Order".discount) as benefits
    FROM "Branch" 
        JOIN "Order" ON "Branch".id = "Order".branch
    WHERE 
        (start_date IS NULL OR end_date IS NULL OR "Order".date BETWEEN start_date AND end_date) 
        AND
        (branchFilter IS NULL OR "Branch".address_line_1 = branchFilter)
    GROUP BY "Branch".id
    ORDER BY 
        CASE WHEN sortOrder THEN SUM("Order".subtotal - "Order".discount) END DESC, 
        CASE WHEN NOT sortOrder THEN SUM("Order".subtotal - "Order".discount) END ASC;
END;
$$ LANGUAGE plpgsql;

-- ? Ejemplo de la llamada al reporte
-- ? SELECT * FROM reportBranchesByBenefits(TRUE, NULL, '2010-01-01', '2023-12-31');