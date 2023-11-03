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
    PRIMARY KEY("date_start", "employeeId"),
    CONSTRAINT "fk_employee" FOREIGN KEY ("employeeId") REFERENCES "Employee"("id"),
    CONSTRAINT "fk_rol" FOREIGN KEY ("role") REFERENCES "Rol"("id"),
    CONSTRAINT "fk_branch" FOREIGN KEY ("branchId") REFERENCES "Branch"("id")
);

-- *Tabla de Ausencia de Empleado
CREATE TABLE IF NOT EXISTS "Absence" (
    "startAbsence" date NOT NULL,
    "endAbsence" date NOT NULL,
    "justified" varchar(256) NOT NULL,
    "startEmployee" date NOT NULL,
    "employeeId" uuid NOT NULL,
    PRIMARY KEY("startAbsence", "employeeId", "startEmployee"),
    CONSTRAINT "fk_employeeHistory" FOREIGN KEY ("startEmployee", "employeeId") REFERENCES "EmployeeHistory"("date_start", "employeeId")
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

-----------------------------------------------------------
-- * Funciones para agilizar las consultas de los reportes
-----------------------------------------------------------

CREATE OR REPLACE FUNCTION getPlaceType(
    place varchar(256)
) RETURNS varchar(256) AS $$
BEGIN
    IF EXISTS (SELECT DISTINCT "Branch".address_line_1 FROM "Branch" WHERE UPPER("Branch".address_line_1) = UPPER(place)) THEN
        RETURN 'ADDRESS';  
    ELSIF EXISTS (SELECT DISTINCT "Branch".city FROM "Branch" WHERE UPPER("Branch".city) = UPPER(place)) THEN
        RETURN 'CITY';
    ELSIF EXISTS (SELECT DISTINCT "Branch".municipalty FROM "Branch" WHERE UPPER("Branch".municipalty) = UPPER(place)) THEN
        RETURN 'MUNICIPALTY';
    ELSE
        RETURN NULL;
    END IF;
END;
$$ LANGUAGE plpgsql;

-------------------------------------------
-- * Creación de los reportes
-------------------------------------------

-------------------------------------------
-- * Reporte de Productos más populares y menos populares
-- ? Filtros: fecha de inicio - fecha de fin, Categoría y branch
-- ? SELECT * FROM reportProductsByPopularity(TRUE, 10, NULL, '2020-01-01', '2020-12-31');
-------------------------------------------

CREATE OR REPLACE FUNCTION reportProductsByPopularity(
    sortOrder BOOLEAN, -- True para ordenar de mayor a menor, False para ordenar de menor a mayor
    limitFilter INTEGER DEFAULT NULL,
    branchFilter UUID DEFAULT NULL,
    categoryFilter UUID DEFAULT NULL,
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
        (branchFilter IS NULL OR "Order".branch = branchFilter) AND
        (start_date IS NULL OR end_date IS NULL OR "Order".date BETWEEN start_date AND end_date) AND
        (categoryFilter IS NULL OR "Category".id = categoryFilter)
    GROUP BY "Product".id, "Category".id
    ORDER BY 
        CASE WHEN sortOrder THEN SUM("OrderProduct".quantity) END DESC, 
        CASE WHEN NOT sortOrder THEN SUM("OrderProduct".quantity) END ASC
    LIMIT CASE WHEN limitFilter IS NOT NULL THEN limitFilter END;
END;
$$ LANGUAGE plpgsql;

-------------------------------------------
-- * Reporte de Sucursales con mayores beneficios y menores beneficios
-- ? Filtros: fecha de inicio, fecha de fin y escoger sucursal.
-- ? SELECT * FROM reportBranchesByBenefits(TRUE, 10, NULL, '2010-01-01', '2023-12-31');
-------------------------------------------

CREATE OR REPLACE FUNCTION getBenefits(
    branchId uuid, 
    start_date date DEFAULT NULL, 
    end_date date DEFAULT NULL
) RETURNS numeric(10,2) AS $$
DECLARE
    earning numeric(10,2);
    cost numeric(10,2);
    salaries numeric(10,2);
BEGIN

    SELECT SUM("Order".subtotal - "Order".discount) INTO earning
    FROM "Order"
    WHERE 
        "Order".branch = branchId AND
        (start_date IS NULL OR end_date IS NULL OR "Order".date BETWEEN start_date AND end_date);

    SELECT SUM("ExtraCost".cost) INTO cost
    FROM "ExtraCost"
    WHERE 
        "ExtraCost".branch = branchId AND
        (start_date IS NULL OR end_date IS NULL OR "ExtraCost".date BETWEEN start_date AND end_date);
    
    SELECT SUM("EmployeeHistory".salary) INTO salaries
    FROM "EmployeeHistory"
    WHERE 
        "EmployeeHistory"."branchId" = branchId AND
        ("EmployeeHistory".date_end IS NULL);

    IF cost IS NULL THEN
        cost := 0;
    END IF;

    IF salaries IS NULL THEN
        salaries := 0;
    END IF;

    IF earning IS NULL THEN
        earning := 0;
    END IF;

    RETURN earning - cost - salaries;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION reportBranchesByBenefits(
    sortOrder BOOLEAN, -- True para ordenar de mayor a menor, False para ordenar de menor a mayor
    limitFilter INTEGER DEFAULT NULL,
    branchFilter uuid DEFAULT NULL,
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
    SELECT "Branch".address_line_1, 
        "Branch".municipalty, 
        "Branch".city, 
        "Branch".mensual_cost, 
        getBenefits("Branch".id, start_date, end_date) as branch_benefits
    FROM "Branch" 
    WHERE 
        (branchFilter IS NULL OR "Branch".id = branchFilter)
    ORDER BY 
        CASE WHEN sortOrder THEN (getBenefits("Branch".id, start_date, end_date)) END DESC, 
        CASE WHEN NOT sortOrder THEN (getBenefits("Branch".id, start_date, end_date)) END ASC
    LIMIT CASE WHEN limitFilter IS NOT NULL THEN limitFilter END;
END;
$$ LANGUAGE plpgsql;

-------------------------------------------
-- * Reporte: Empleado con más o menos inasistencias
-- ? Filtros: escoger local, empleados (activos, inactivos u ambos), fecha inicio y fin de la inasistencia, rol
-- ? SELECT * FROM employeeMoreAbsences(TRUE, 5, NULL, 'Cajero',NULL,NULL,NULL);
-------------------------------------------

CREATE OR REPLACE FUNCTION employeeMoreAbsences(
    sortOrder BOOLEAN,
    limitFilter INTEGER DEFAULT NULL,
    activeEmployeeFilter BOOLEAN DEFAULT NULL,
    roleFilter "Rol".id%TYPE DEFAULT NULL,
    branchFilter "Branch".id%TYPE DEFAULT NULL,
    date_start_filter "Absence"."startAbsence"%TYPE DEFAULT NULL, 
    end_date_filter "Absence"."endAbsence"%TYPE DEFAULT NULL
) RETURNS TABLE (
    "first_name" varchar(256),
    "last_name" varchar(256),
    "quantity" integer
) AS $$ 
BEGIN 
    RETURN QUERY
    SELECT ("Employee".data).first_name, ("Employee".data).last_name, COUNT(*)::int AS quantity
    FROM "Employee"
        JOIN "EmployeeHistory" ON "Employee".id = "EmployeeHistory"."employeeId"
        JOIN "Branch" ON "EmployeeHistory"."branchId" = "Branch".id
        JOIN "Rol" ON "EmployeeHistory"."role" = "Rol".id
        JOIN "Absence" ON ("EmployeeHistory".date_start = "Absence"."startEmployee" AND "EmployeeHistory"."employeeId" = "Absence"."employeeId")
    WHERE
        (activeEmployeeFilter IS NULL OR 
            CASE 
                WHEN activeEmployeeFilter THEN "EmployeeHistory".date_end IS NULL 
                WHEN NOT activeEmployeeFilter THEN "EmployeeHistory".date_end IS NOT NULL
            END
        )
        AND
        (branchFilter IS NULL OR "Branch".id = branchFilter)
        AND
        (roleFilter IS NULL OR "Rol".id = roleFilter)
        AND
        (date_start_filter IS NULL OR end_date_filter IS NULL OR ("Absence"."startAbsence" >= date_start_filter AND "Absence"."endAbsence" <= end_date_filter))
    GROUP BY "Employee".id
    ORDER BY
        CASE WHEN sortOrder THEN COUNT(*) END DESC,
        CASE WHEN NOT sortOrder THEN COUNT(*) END ASC
    LIMIT CASE WHEN limitFilter IS NOT NULL THEN limitFilter END;
END;
$$ LANGUAGE plpgsql;

-------------------------------------------
-- * Reporte: Clientes con más o menos compras
-- ? Filtros: escoger sucursal (local, ciudad o municipio), fecha de inicio
-- ? SELECT * FROM clientsBuysMore(TRUE, 4, 'Pueblo', NULL);
-------------------------------------------

CREATE OR REPLACE FUNCTION clientsBuysMore(
    sortOrder BOOLEAN,
    limitFilter INTEGER DEFAULT NULL,
    branchFilter UUID DEFAULT NULL,
    date_start_filter "Order"."date"%TYPE DEFAULT NULL,
    end_date "Order"."date"%TYPE DEFAULT NULL
) RETURNS TABLE (
    "first_name" varchar(256),
    "last_name" varchar(256),
    "quantity" integer
) AS $$ 
BEGIN 
    RETURN QUERY
    SELECT ("Client".data).first_name, ("Client".data).last_name, COUNT(*)::int AS quantity
    FROM "Client"
        JOIN "Order" ON "Client".id = "Order"."clientId"
        JOIN "Branch" ON "Order".branch = "Branch".id
    WHERE        
        (branchFilter IS NULL OR "Branch".id = branchFilter)   
        AND
        (date_start_filter IS NULL OR end_date IS NULL OR "Order".date BETWEEN date_start_filter AND end_date)
    GROUP BY "Client".id
    ORDER BY 
        CASE WHEN sortOrder THEN (COUNT(*)) END DESC,
        CASE WHEN NOT sortOrder THEN (COUNT(*)) END ASC
    LIMIT CASE WHEN limitFilter IS NOT NULL THEN limitFilter END;
END;
$$ LANGUAGE plpgsql;

-------------------------------------------
-- * Reporte de mayores ventas de productos por dia de semana, semana, mes o año
-- ? Filtros: semana, semana, mes o año, fecha de inicio, fecha de fin, escoger sucursal, nombre del producto, categoria y local.
-- ? SELECT * FROM reportSalesByTime('day', NULL, NULL, NULL, '2023-01-01', '2023-12-31')
-------------------------------------------

CREATE OR REPLACE FUNCTION reportSalesByTime(
	p_periodo text,
	category_filter UUID DEFAULT NULL,
	branch_filter UUID DEFAULT NULL,
	product_name_filter UUID DEFAULT NULL,
	start_date date DEFAULT NULL,
	end_date date DEFAULT NULL
)
RETURNS TABLE(time_name TEXT, sales NUMERIC) AS
$$
BEGIN
    IF p_periodo = 'month' THEN
        RETURN QUERY 
        SELECT TO_CHAR(date_trunc('month', "O"."date"), 'MM') AS mounth, 
	    SUM("OP"."quantity") AS sales
		FROM "OrderProduct" "OP"
		JOIN "Product" "P" ON "OP"."productId" = "P"."id"
		JOIN "Order" "O" ON "OP"."orderId" = "O"."id"
		JOIN "Category" "C" ON "C"."id" = "P"."category"
		WHERE 
			(start_date IS NULL OR end_date IS NULL OR "O"."date" BETWEEN start_date AND end_date)
		AND 
			(category_filter IS NULL OR "C"."id" = category_filter)
		AND 
			(product_name_filter IS NULL OR "P"."id" = product_name_filter)
		AND 
			(branch_filter IS NULL OR "O"."branch" = branch_filter)
		GROUP BY (mounth)
		ORDER BY mounth;
    ELSIF p_periodo = 'day' THEN
        RETURN QUERY 
        SELECT TO_CHAR("O"."date", 'Day') AS day_name,  
	    SUM("OP"."quantity") AS sales
		FROM "OrderProduct" "OP"
		JOIN "Product" "P" ON "OP"."productId" = "P"."id"
		JOIN "Order" "O" ON "OP"."orderId" = "O"."id"
		JOIN "Category" "C" ON "C"."id" = "P"."category"
		WHERE 
			(start_date IS NULL OR end_date IS NULL OR "O"."date" BETWEEN start_date AND end_date)
		AND 
			(category_filter IS NULL OR "C"."id" = category_filter)
		AND 
			(product_name_filter IS NULL OR "P"."id" = product_name_filter)
		AND 
			(branch_filter IS NULL OR "O"."branch" = branch_filter)
		GROUP BY (day_name)
		ORDER BY day_name;
	ELSIF p_periodo = 'week' THEN
		RETURN QUERY 
		SELECT CONCAT_WS( '  ', 
		TO_CHAR(date_trunc('week', "O"."date"), 'YYYY-MM-DD'), 
		TO_CHAR(date_trunc('week', "O"."date") + INTERVAL '7 day', 'YYYY-MM-DD'))  AS week,  
		SUM("OP"."quantity") AS sales
		FROM "OrderProduct" "OP"
		JOIN "Product" "P" ON "OP"."productId" = "P"."id"
		JOIN "Order" "O" ON "OP"."orderId" = "O"."id"
		JOIN "Category" "C" ON "C"."id" = "P"."category"
		WHERE 
			(start_date IS NULL OR end_date IS NULL OR "O"."date" BETWEEN start_date AND end_date)
		AND 
			(category_filter IS NULL OR "C"."id" = category_filter)
		AND 
			(product_name_filter IS NULL OR "P"."id" = product_name_filter)
		AND 
			(branch_filter IS NULL OR "O"."branch" = branch_filter)
		GROUP BY (week)
		ORDER BY week;
	ELSIF p_periodo = 'year' THEN
	    RETURN QUERY 
		SELECT TO_CHAR(date_trunc('year', "O"."date"), 'YYYY') AS years,  
			   SUM("OP"."quantity") AS sales
		FROM "OrderProduct" "OP"
		JOIN "Product" "P" ON "OP"."productId" = "P"."id"
		JOIN "Order" "O" ON "OP"."orderId" = "O"."id"
		JOIN "Category" "C" ON "C"."id" = "P"."category"
		WHERE 
			(start_date IS NULL OR end_date IS NULL OR "O"."date" BETWEEN start_date AND end_date)
		AND 
			(category_filter IS NULL OR "C"."id" = category_filter)
		AND 
			(product_name_filter IS NULL OR "P"."id" = product_name_filter)
		AND 
			(branch_filter IS NULL OR "O"."branch" = branch_filter)
		GROUP BY (years);
    END IF;
END;
$$
LANGUAGE 'plpgsql';

-------------------------------------------
-- * Reporte de mayores ventas de productos por dia de semana o mes
-- ? Filtros: fecha de inicio, fecha de fin, escoger sucursal, nombre del producto, categoria y local.
-- ? SELECT * FROM reportHigherProfitsPerProduct(5)
-------------------------------------------

CREATE OR REPLACE FUNCTION reportHigherProfitsPerProduct(
	n_limit BIGINT DEFAULT 20,
	category_filter UUID DEFAULT NULL,
	branch_filter UUID DEFAULT NULL,
	product_name_filter UUID DEFAULT NULL,
	start_date date DEFAULT NULL,
	end_date date DEFAULT NULL
)
RETURNS TABLE (id uuid, name VARCHAR, benefits NUMERIC) AS $$
BEGIN
    RETURN QUERY 
    SELECT "P"."id", "P"."name", "P1"."subtotal" - "P2"."cost" AS benefits
    FROM (
        SELECT "P"."id" , "P"."price" * SUM("OP"."quantity") AS subtotal
        FROM "OrderProduct" "OP"
        INNER JOIN "Product" "P" ON "OP"."productId" = "P"."id"
        INNER JOIN "Order" "O" ON "O"."id" = "OP"."orderId"
        INNER JOIN "Category" "C" ON "P"."category" = "C"."id"
        WHERE 
			(start_date IS NULL OR end_date IS NULL OR "O"."date" BETWEEN start_date AND end_date)
		AND 
			(product_name_filter IS NULL OR "P"."id" = product_name_filter)
		AND 
			(branch_filter IS NULL OR "O"."branch" = branch_filter)
		AND 
			(category_filter IS NULL OR "C"."id" = category_filter)
        GROUP BY ("P"."id")
    ) "P1"
    JOIN (
        SELECT "P"."id", SUM("B"."purchase_price") AS cost
        FROM "BatchBuy" "B"
        INNER JOIN "Product" "P" ON "B"."product" = "P"."id"
        INNER JOIN "Category" "C" ON "P"."category" = "C"."id"
        WHERE 
			(start_date IS NULL OR end_date IS NULL OR "B"."date" BETWEEN start_date AND end_date)
		AND 
			(product_name_filter IS NULL OR "P"."id" = product_name_filter)
		AND 
			(branch_filter IS NULL OR "B"."branch" = branch_filter)
		AND 
			(category_filter IS NULL OR "C"."id" = category_filter)
        GROUP BY ("P"."id")
    ) "P2" ON ("P1"."id" = "P2"."id")
    JOIN "Product" "P" ON ("P"."id" = "P1"."id")
    ORDER BY (benefits)
    LIMIT n_limit;
END;
$$ LANGUAGE plpgsql;

-------------------------------------------
-- * Reporte de productos que necesitan restock, evaluando inventario y demanda.
-- ? Filtros: busqueda por sucursal y por tipo de filtro (semana, mes), periodo de tiempo
-- ? SELECT * FROM reportInventoryDemandAnalysis('b1', 'week', 1);
-------------------------------------------

CREATE OR REPLACE FUNCTION getInventoryByProduct(productId uuid, branchId uuid ) 
RETURNS numeric(10,0) AS $$
DECLARE
    productQuantity numeric(10,0); 
    productSold numeric(10,0);
BEGIN

    SELECT SUM("BatchBuy".quantity) INTO productQuantity
    FROM "BatchBuy"
    WHERE 
        "BatchBuy".product = productId AND
        "BatchBuy".branch = branchId;

    SELECT SUM("OrderProduct".quantity) INTO productSold
    FROM "OrderProduct"
        JOIN "Order" ON "OrderProduct"."orderId" = "Order".id
    WHERE 
        "OrderProduct"."productId" = productId AND
        "Order".branch = branchId;

    IF productSold IS NULL THEN
        productSold := 0;
    END IF;
    
    RETURN productQuantity - productSold;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION getAverageDemand(
   productId uuid, 
   branchId uuid,
   typeFilter varchar(256), -- 'week', 'month'
   timeFrame int -- TimeFrame es el numero de semanas o meses que se quieren evaluar
) RETURNS numeric(10,0) AS $$
DECLARE 
   averageDemand numeric(10,0);
BEGIN
    IF typeFilter = 'week' THEN
        SELECT SUM("OrderProduct".quantity) INTO averageDemand
        FROM "OrderProduct"
            JOIN "Order" ON "OrderProduct"."orderId" = "Order".id
        WHERE 
            "OrderProduct"."productId" = productId AND
            "Order".branch = branchId AND
            "Order".date BETWEEN NOW() - INTERVAL '1 week' * timeFrame AND NOW();
    ELSEIF typeFilter = 'month' THEN
        SELECT SUM("OrderProduct".quantity) INTO averageDemand
        FROM "OrderProduct"
            JOIN "Order" ON "OrderProduct"."orderId" = "Order".id
        WHERE 
            "OrderProduct"."productId" = productId AND
            "Order".branch = branchId AND
            "Order".date BETWEEN NOW() - INTERVAL '1 month' * timeFrame AND NOW();
    END IF;

    IF averageDemand IS NULL THEN
        averageDemand := 0;
    END IF;

    RETURN averageDemand;
END;
$$ LANGUAGE plpgsql;

-- ! IMPORTANTE HAY QUE REVISAR POR PROBLEMA DE DATA :D

CREATE OR REPLACE FUNCTION reportInventoryDemandAnalysis(branchId uuid, typeFilter varchar(256), timeFrame int) 
RETURNS TABLE (
    "product_name" varchar(256),
    "product_category" varchar(256),
    "product_stock" numeric(10,0),
    "average_demand" numeric(10,0)
) AS $$
BEGIN
    RETURN QUERY
    SELECT "Product".name, "Category".name, getInventoryByProduct("Product".id, branchId), getAverageDemand("Product".id, branchId, typeFilter, timeFrame)
    FROM "BatchBuy" 
        JOIN "Product" ON "BatchBuy".product = "Product".id
        JOIN "Category" ON "Product".category = "Category".id
    GROUP BY "Product".id, "Category".id;
END;
$$ LANGUAGE plpgsql;

-------------------------------------------
-- * Reporte de los empleados con mejor Salario
-- ? Filtros: Por genero, rol, Antiguedad en la empresa, sucursal
-- ? SELECT * FROM reportTopEarningEmployees('M', 'Gerente', 5, 10);
-------------------------------------------

CREATE OR REPLACE FUNCTION getServiceYears(employeeId uuid) RETURNS numeric(10,0) AS $$
DECLARE
    serviceYears numeric(10,0);
BEGIN
    SELECT DATE_PART('year', NOW()) - DATE_PART('year', eh.date_start) INTO serviceYears
    FROM "EmployeeHistory" eh
    WHERE eh."employeeId" = employeeId AND eh.date_end IS NULL;
    RETURN serviceYears;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION reportTopEarningEmployees(
	activeEmployeeFilter BOOLEAN,
	employeeGender varchar(2),
	employeeRole uuid,
	branchFilter "Branch".id%TYPE,
	limitFilter int
)
RETURNS TABLE (
    employeeName varchar(255),
    employeeLastName varchar(256),
    highestSalary numeric(10, 2),
    rol varchar(255)
) AS $$
BEGIN
    RETURN QUERY
    SELECT (e.data).first_name, (e.data).last_name, eh.salary, r.description
    FROM "Employee" e
        JOIN "EmployeeHistory" eh ON e.id = eh."employeeId"
        JOIN "Rol" r ON r.id = eh.role
    WHERE 
        (employeeGender IS NULL OR (e.data).gender = employeeGender) AND
        (employeeRole IS NULL OR r.id = employeeRole) AND
        (branchFilter IS NULL OR "eh"."branchId" = branchFilter) AND
        (activeEmployeeFilter IS NULL OR 
            CASE 
                WHEN activeEmployeeFilter THEN "eh".date_end IS NULL 
                WHEN NOT activeEmployeeFilter THEN "eh".date_end IS NOT NULL
            END
        )
    ORDER BY eh.salary DESC
    LIMIT CASE WHEN limitFilter IS NOT NULL THEN limitFilter END;
END;
$$ LANGUAGE plpgsql;

-------------------------------------------
-- * Funciones para obtener los datos para filtrar
-------------------------------------------

CREATE OR REPLACE FUNCTION getBranches() RETURNS SETOF "Branch" AS $$ 
BEGIN
    RETURN QUERY
    SELECT *
    FROM "Branch";
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION getCategories() RETURNS SETOF "Category" AS $$
BEGIN
    RETURN QUERY
    SELECT *
    FROM "Category";
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION getRoles() RETURNS SETOF "Rol" AS $$
BEGIN
    RETURN QUERY
    SELECT *
    FROM "Rol";
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION getProducts() RETURNS SETOF "Product" AS $$
BEGIN
    RETURN QUERY
    SELECT *
    FROM "Product";
END;
$$ LANGUAGE plpgsql;