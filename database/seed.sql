BEGIN;
----------------------------------------
-- Inserts para "Rol"
----------------------------------------
INSERT INTO "Rol" ("description") VALUES
  ('Gerente de Tienda'),
  ('Subgerente de Tienda'),
  ('Cajero'),
  ('Reponedor'),
  ('Encargado de Almacén'),
  ('Supervisor de Ventas'),
  ('Asistente de Ventas'),
  ('Jefe de Carnicería'),
  ('Jefe de Panadería'),
  ('Jefe de Frutas y Verduras'),
  ('Jefe de Limpieza'),
  ('Jefe de Marketing'),
  ('Especialista en Compras'),
  ('Especialista en Atención al Cliente');

----------------------------------------
-- Inserts para "Employee"
----------------------------------------
-- TODO

----------------------------------------
-- Inserts para "Category"
----------------------------------------
INSERT INTO "Category" ("name", "description") VALUES
  ('Electrónicos', 'Productos electrónicos y dispositivos'),
  ('Alimentos', 'Productos alimenticios y comestibles'),
  ('Ropa', 'Ropa y accesorios de moda'),
  ('Hogar', 'Productos para el hogar y decoración'),
  ('Cuidado Personal', 'Productos de cuidado personal y belleza'),
  ('Limpieza', 'Productos de limpieza y suministros domésticos'),
  ('Juguetes', 'Juguetes para niños y juegos'),
  ('Bebidas', 'Bebidas no alcohólicas y refrescos'),
  ('Electrodomésticos', 'Electrodomésticos para el hogar'),
  ('Herramientas', 'Herramientas y suministros para el bricolaje'),
  ('Electrónica', 'Electrónica de consumo'),
  ('Mascotas', 'Productos para mascotas y alimentos para animales'),
  ('Automoción', 'Accesorios y productos para automóviles');

----------------------------------------
-- Inserts para "Supplier"
----------------------------------------
INSERT INTO "Supplier" ("name", "email", "phone_number", "address", "sector") VALUES
  ('Distribuidora de Alimentos ABC', 'info@abcfood.com', '+1234567890', '123 Calle Principal', 'Alimentos'),
  ('Electrónica Plus', 'contacto@electronicaplus.com', '+9876543210', '456 Avenida Tecnológica', 'Electrónicos'),
  ('Ropa Fashion', 'info@ropafashion.com', '+1122334455', '789 Calle de la Moda', 'Ropa'),
  ('Productos para el Hogar S.A.', 'ventas@productoshogar.com', '+5544332211', '567 Avenida del Hogar', 'Hogar'),
  ('Cosméticos Belleza Total', 'contacto@belleza-total.com', '+9988776655', '101 Plaza de Belleza', 'Cuidado Personal'),
  ('Productos de Limpieza CleanMax', 'ventas@cleanmax.com', '+3344556677', '23 Calle de la Limpieza', 'Limpieza'),
  ('Juguetes Divertidos S.A.', 'contacto@juguetesdivertidos.com', '+7788990011', '45 Avenida de la Diversión', 'Juguetes'),
  ('Bebidas Refrescantes Co.', 'info@refrescosco.com', '+1236547890', '67 Calle de las Bebidas', 'Bebidas'),
  ('Electrodomésticos HogarTech', 'ventas@hogartech.com', '+6677889900', '89 Avenida de la Tecnología', 'Electrodomésticos'),
  ('Herramientas Pro', 'info@herramientaspro.com', '+1122334455', '123 Plaza del Bricolaje', 'Herramientas'),
  ('Mascotas Felices', 'contacto@mascotasfelices.com', '+9877654321', '456 Calle de las Mascotas', 'Mascotas'),
  ('Automoción Parts', 'ventas@automocionparts.com', '+5544332211', '789 Avenida Automotriz', 'Automoción'),
  ('Productos Orgánicos Verdes', 'info@verdesorganicos.com', '+9988776655', '101 Calle Orgánica', 'Alimentos'),
  ('Electrónica Avanzada', 'contacto@electronicavanzada.com', '+2233445566', '456 Plaza Electrónica', 'Electrónicos'),
  ('Productos Farmacéuticos SaludTotal', 'ventas@saludtotal.com', '+3322114466', '567 Avenida de la Salud', 'Salud y Farmacia');

----------------------------------------
-- Inserts para "Client"
----------------------------------------
-- TODO


----------------------------------------
-- Inserts para "Branch"
----------------------------------------
INSERT INTO "Branch" ("address_line_1", "municipalty", "city", "zip", "mensual_cost") VALUES
  ('123 Main Street', 'Cityville', 'Ciudad', '12345', 1500.00),
  ('456 Elm Avenue', 'Townsville', 'Pueblo', '54321', 1200.00),
  ('789 Oak Lane', 'Villageton', 'Villa', '98765', 1700.00),
  ('1010 Pine Road', 'Hamletsville', 'Pueblo', '76543', 1400.00),
  ('222 Spruce Drive', 'Suburbia', 'Ciudad', '23456', 1600.00),
  ('333 Cedar Lane', 'Ruralville', 'Pueblo', '87654', 1300.00),
  ('444 Birch Avenue', 'Uptown', 'Ciudad', '34567', 1800.00),
  ('555 Maple Street', 'Downtown', 'Ciudad', '45678', 1900.00),
  ('666 Oak Avenue', 'Beachtown', 'Playa', '56789', 2000.00),
  ('777 Palm Road', 'Mountainville', 'Montaña', '67890', 2100.00),
  ('888 Redwood Drive', 'Laketown', 'Lago', '78901', 2200.00),
  ('999 Willow Road', 'Countryside', 'Campo', '89012', 1700.00),
  ('1233 Cypress Lane', 'Harborville', 'Puerto', '90123', 1600.00),
  ('2344 Pine Street', 'Hillside', 'Ladera', '91234', 1800.00),
  ('3455 Cedar Avenue', 'Valleyview', 'Valle', '92345', 1500.00);

----------------------------------------
-- Inserts para "EmployeeHistory"
----------------------------------------
-- TODO

-- ----------------------------------------
-- -- Inserts para "Absence"
-- ----------------------------------------
-- -- TODO

----------------------------------------
-- Inserts para "ExtraCost"
----------------------------------------
INSERT INTO "ExtraCost" ("date", "cost", "description", "branch") VALUES
  ('2022-01-05', 100.00, 'Mantenimiento de equipos', (SELECT "id" FROM "Branch" WHERE "address_line_1" = '123 Main Street')),
  ('2022-02-10', 50.00, 'Limpieza y suministros', (SELECT "id" FROM "Branch" WHERE "address_line_1" = '456 Elm Avenue')),
  ('2022-03-15', 75.00, 'Reparaciones en tienda', (SELECT "id" FROM "Branch" WHERE "address_line_1" = '789 Oak Lane')),
  ('2022-04-20', 120.00, 'Publicidad local', (SELECT "id" FROM "Branch" WHERE "address_line_1" = '1010 Pine Road')),
  ('2022-05-25', 90.00, 'Renovación de mobiliario', (SELECT "id" FROM "Branch" WHERE "address_line_1" = '222 Spruce Drive')),
  ('2022-06-30', 60.00, 'Mantenimiento de estacionamiento', (SELECT "id" FROM "Branch" WHERE "address_line_1" = '333 Cedar Lane')),
  ('2022-07-05', 110.00, 'Actualización de sistemas', (SELECT "id" FROM "Branch" WHERE "address_line_1" = '444 Birch Avenue')),
  ('2022-08-10', 80.00, 'Mejora de iluminación', (SELECT "id" FROM "Branch" WHERE "address_line_1" = '555 Maple Street')),
  ('2022-09-15', 95.00, 'Decoración de temporada', (SELECT "id" FROM "Branch" WHERE "address_line_1" = '666 Oak Avenue')),
  ('2022-10-20', 70.00, 'Entrenamiento del personal', (SELECT "id" FROM "Branch" WHERE "address_line_1" = '777 Palm Road')),
  ('2022-11-25', 85.00, 'Promociones especiales', (SELECT "id" FROM "Branch" WHERE "address_line_1" = '888 Redwood Drive')),
  ('2022-12-30', 110.00, 'Mantenimiento de señalización', (SELECT "id" FROM "Branch" WHERE "address_line_1" = '999 Willow Road')),
  ('2022-01-10', 65.00, 'Actualización de software', (SELECT "id" FROM "Branch" WHERE "address_line_1" = '1233 Cypress Lane')),
  ('2022-02-15', 75.00, 'Seguridad y cámaras', (SELECT "id" FROM "Branch" WHERE "address_line_1" = '2344 Pine Street')),
  ('2022-03-20', 120.00, 'Promoción de eventos', (SELECT "id" FROM "Branch" WHERE "address_line_1" = '3455 Cedar Avenue'));

----------------------------------------
-- Inserts para "Product"
----------------------------------------
INSERT INTO "Product" ("name", "description", "price", "category") VALUES
  ('Televisor LED 50 pulgadas', 'Televisor de alta definición con pantalla LED de 50 pulgadas', 499.99, (SELECT "id" FROM "Category" WHERE "name" = 'Electrónicos')),
  ('Camiseta de Algodón', 'Camiseta de algodón de manga corta en varios colores y tallas', 19.99, (SELECT "id" FROM "Category" WHERE "name" = 'Ropa')),
  ('Sofá de Cuero', 'Sofá de cuero de 3 plazas con diseño moderno', 799.99, (SELECT "id" FROM "Category" WHERE "name" = 'Hogar')),
  ('Refrigerador de Doble Puerta', 'Refrigerador de doble puerta con dispensador de agua', 899.99, (SELECT "id" FROM "Category" WHERE "name" = 'Electrónicos')),
  ('Cereal Integral', 'Cereal integral con fibra y vitaminas', 4.99, (SELECT "id" FROM "Category" WHERE "name" = 'Alimentos')),
  ('Zapatillas Deportivas', 'Zapatillas deportivas para correr y hacer ejercicio', 49.99, (SELECT "id" FROM "Category" WHERE "name" = 'Ropa')),
  ('Juego de Sartenes Antiadherentes', 'Juego de sartenes antiadherentes de alta calidad', 39.99, (SELECT "id" FROM "Category" WHERE "name" = 'Hogar')),
  ('Secadora de Ropa', 'Secadora de ropa de capacidad grande con múltiples ciclos', 599.99, (SELECT "id" FROM "Category" WHERE "name" = 'Electrónicos')),
  ('Aceite de Oliva Extra Virgen', 'Aceite de oliva extra virgen de calidad premium', 9.99, (SELECT "id" FROM "Category" WHERE "name" = 'Alimentos')),
  ('Chaqueta de Invierno', 'Chaqueta de invierno resistente al agua y con forro térmico', 79.99, (SELECT "id" FROM "Category" WHERE "name" = 'Ropa')),
  ('Juego de Comedor de Madera', 'Juego de comedor de madera con 6 sillas acolchadas', 499.99, (SELECT "id" FROM "Category" WHERE "name" = 'Hogar')),
  ('Lavadora de Carga Frontal', 'Lavadora de carga frontal con tecnología de ahorro de agua', 699.99, (SELECT "id" FROM "Category" WHERE "name" = 'Electrónicos')),
  ('Pasta de Trigo Integral', 'Pasta de trigo integral para platos de pasta saludables', 3.99, (SELECT "id" FROM "Category" WHERE "name" = 'Alimentos')),
  ('Traje de Baño para Mujer', 'Traje de baño de una pieza con diseño elegante', 29.99, (SELECT "id" FROM "Category" WHERE "name" = 'Ropa')),
  ('Mesa de Centro de Vidrio', 'Mesa de centro de vidrio con estructura de metal', 119.99, (SELECT "id" FROM "Category" WHERE "name" = 'Hogar'));

----------------------------------------
-- Inserts para "Order"
----------------------------------------
-- TODO

----------------------------------------
-- Inserts para "OrderProduct"
----------------------------------------
-- TODO

----------------------------------------
-- Inserts para "BatchBuy"
----------------------------------------
INSERT INTO "BatchBuy" ("quantity", "date", "taxes", "date_production", "due_date", "purchase_price", "supplier", "branch", "product") VALUES
  (100, '2022-01-05', 50.00, '2021-12-15', '2022-06-15', 5000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos de Limpieza CleanMax'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '123 Main Street'), (SELECT "id" FROM "Product" WHERE "name" = 'Cereal Integral')),
  (50, '2022-02-10', 30.00, '2022-01-20', '2022-07-20', 3000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Juguetes Divertidos S.A.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '456 Elm Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Camiseta de Algodón')),
  (80, '2022-03-15', 40.00, '2022-02-25', '2022-08-25', 8000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Bebidas Refrescantes Co.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '789 Oak Lane'), (SELECT "id" FROM "Product" WHERE "name" = 'Sofá de Cuero')),
  (150, '2022-04-20', 75.00, '2022-03-30', '2022-09-30', 15000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Electrodomésticos HogarTech'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '1010 Pine Road'), (SELECT "id" FROM "Product" WHERE "name" = 'Refrigerador de Doble Puerta')),
  (200, '2022-05-25', 100.00, '2022-05-05', '2022-11-05', 20000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Herramientas Pro'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '222 Spruce Drive'), (SELECT "id" FROM "Product" WHERE "name" = 'Zapatillas Deportivas')),
  (120, '2022-06-30', 60.00, '2022-06-10', '2022-12-10', 12000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Mascotas Felices'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '333 Cedar Lane'), (SELECT "id" FROM "Product" WHERE "name" = 'Juego de Sartenes Antiadherentes')),
  (90, '2022-07-05', 45.00, '2022-07-15', '2023-01-15', 9000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Automoción Parts'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '444 Birch Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Secadora de Ropa')),
  (110, '2022-08-10', 55.00, '2022-08-20', '2023-02-20', 11000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos Orgánicos Verdes'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '555 Maple Street'), (SELECT "id" FROM "Product" WHERE "name" = 'Aceite de Oliva Extra Virgen')),
  (60, '2022-09-15', 30.00, '2022-09-25', '2023-03-25', 6000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Electrónica Avanzada'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '666 Oak Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Chaqueta de Invierno')),
  (80, '2022-10-20', 40.00, '2022-10-30', '2023-04-30', 8000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos Farmacéuticos SaludTotal'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '777 Palm Road'), (SELECT "id" FROM "Product" WHERE "name" = 'Mesa de Centro de Vidrio')),
  (75, '2022-12-30', 37.50, '2022-12-10', '2023-06-10', 7500.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Juguetes Divertidos S.A.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '999 Willow Road'), (SELECT "id" FROM "Product" WHERE "name" = 'Televisor LED 50 pulgadas')),
  (90, '2023-01-10', 45.00, '2023-01-20', '2023-07-20', 9000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos de Limpieza CleanMax'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '1233 Cypress Lane'), (SELECT "id" FROM "Product" WHERE "name" = 'Refrigerador de Doble Puerta')),
  (60, '2023-02-15', 30.00, '2023-02-25', '2023-08-25', 6000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Bebidas Refrescantes Co.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '2344 Pine Street'), (SELECT "id" FROM "Product" WHERE "name" = 'Zapatillas Deportivas')),
  (110, '2023-03-20', 55.00, '2023-03-30', '2023-09-30', 11000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Electrodomésticos HogarTech'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '3455 Cedar Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Camiseta de Algodón'));

COMMIT;