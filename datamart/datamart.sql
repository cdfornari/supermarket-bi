-- Creamos el shcema dimensional
CREATE SCHEMA IF NOT EXISTS dimensional;

-----------------------------------------
-- *Dimensiones
-----------------------------------------

-- *Dimensión de tiempo
CREATE TABLE IF NOT EXISTS dimensional.dim_time (
    time_id uuid NOT NULL DEFAULT gen_random_uuid(),
    year INT NOT NULL,
    month INT NOT NULL,
    day INT NOT NULL,
    day_name VARCHAR(20) NOT NULL,
    month_name VARCHAR(20) NOT NULL,
    PRIMARY KEY (time_id)
);

-- *Dimensión de Categoria
CREATE TABLE IF NOT EXISTS dimensional.dim_category (
    category_id uuid NOT NULL,
    category_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (category_id)
);

-- *Dimensión de Producto
CREATE TABLE IF NOT EXISTS dimensional.dim_product (
    product_id uuid NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (product_id)
);

-- *Dimensión de Cliente
CREATE TABLE IF NOT EXISTS dimensional.dim_client (
    client_id uuid NOT NULL,
    client_ci VARCHAR(100) NOT NULL,
    client_name VARCHAR(100) NOT NULL,  
    client_address VARCHAR(100) NOT NULL,
    client_gender VARCHAR(2) NOT NULL,
    PRIMARY KEY (client_id)
);

-- *Dimensión de Sucursal
CREATE TABLE IF NOT EXISTS dimensional.dim_branch (
    branch_id uuid NOT NULL,
    branch_name VARCHAR(100) NOT NULL,
    branch_city VARCHAR(100) NOT NULL,
    PRIMARY KEY (branch_id)
);

-----------------------------------------
-- *Creamos la tabla de Hechos
-----------------------------------------

CREATE TABLE IF NOT EXISTS dimensional.sales (
    product_id uuid NOT NULL,
    time_id uuid NOT NULL,
    branch_id uuid NOT NULL,
    category_id uuid NOT NULL,
    client_id uuid NOT NULL,
    quantity INT NOT NULL, -- Cantidad de productos
    amount DECIMAL(10,2) NOT NULL, -- Precio de venta 
    cost DECIMAL(10,2) NOT NULL, -- Costo unitario del producto
    profit DECIMAL(10,2) NOT NULL, -- Sería amount - cost
    PRIMARY KEY (time_id, category_id, product_id, client_id, branch_id),
    FOREIGN KEY (time_id) REFERENCES dimensional.dim_time (time_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES dimensional.dim_category (category_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES dimensional.dim_product (product_id) ON DELETE CASCADE,
    FOREIGN KEY (client_id) REFERENCES dimensional.dim_client (client_id) ON DELETE CASCADE,
    FOREIGN KEY (branch_id) REFERENCES dimensional.dim_branch (branch_id) ON DELETE CASCADE
);

-----------------------------------------
-- *Funciones para utilizar en Pentaho
-----------------------------------------

-- *Función para obtener el time_id de la dimensión de tiempo
CREATE OR REPLACE FUNCTION dimensional.get_time_id(dateToSearch date) RETURNS uuid AS $$
DECLARE
    timeId uuid;
BEGIN
    SELECT dt.time_id INTO timeId FROM dimensional.dim_time dt WHERE year = EXTRACT(YEAR FROM dateToSearch) AND month = EXTRACT(MONTH FROM dateToSearch) AND day = EXTRACT(DAY FROM dateToSearch);
    RETURN timeId;
END;
$$ LANGUAGE plpgsql;

-- *Función para obtener el costo unitario de un producto
CREATE OR REPLACE FUNCTION dimensional.get_cost(product_id uuid) RETURNS DECIMAL(10,2) AS $$
DECLARE
    cost DECIMAL(10,2);
BEGIN
    SELECT SUM(bb.purchase_price) / SUM(bb.quantity) INTO cost 
    FROM public."BatchBuy" bb 
    WHERE bb.product = product_id;
    RETURN cost;
END;
$$ LANGUAGE plpgsql;