BEGIN;
----------------------------------------
-- * Inserts para "Rol"
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
-- * Inserts para "Employee"
----------------------------------------
INSERT INTO "Employee" ("id", "data") VALUES
  ('0752d788-e0c5-4ad0-8dfb-f7e40a366748', (validate_ci('V-28155407', 'Employee'), 'Sofía', 'María', 'Torres', 'Gómez', validate_phone('+6549873210'), validate_email('sofia@gmail.com'), 'Calle Secundaria 789', validate_gender('F'))),
  ('180dd597-d996-4bc9-8ec1-b1f85e46b05d', (validate_ci('V-28155405', 'Employee'), 'Marta', 'Isabel', 'García', 'López', validate_phone('+4563217890'), validate_email('marta@gmail.com'), 'Calle de la Paz 123', validate_gender('F'))),
  ('23b20ce8-150b-47a3-b69a-bb4a4876d4a3', (validate_ci('V-28155416', 'Employee'), 'Sara', 'Isabel', 'Ruiz', 'López', validate_phone('+6549873210'), validate_email('sara@gmail.com'), 'Avenida de la Libertad 987', validate_gender('F'))),
  ('305c851c-7cc0-4438-870c-92b19c8a781f', (validate_ci('V-28155404', 'Employee'), 'Joaquín', 'Santiago', 'Martínez', 'Gómez', validate_phone('+9876543210'), validate_email('joaquin@gmail.com'), 'Avenida Secundaria 789', validate_gender('M'))),
  ('62fceb2d-e71e-4163-826b-573503b4277a', (validate_ci('V-28155403', 'Employee'), 'Elena', 'Lucía', 'Paredes', 'Pérez', validate_phone('+1236549870'), validate_email('elena@gmail.com'), 'Calle Principal 555', validate_gender('F'))),
  ('768c3809-ba88-4fc3-99db-cfd67f2a21ed', (validate_ci('V-28155411', 'Employee'), 'Carlos', 'Andrés', 'Gómez', 'Martínez', validate_phone('+4563217890'), validate_email('carlos@gmail.com'), 'Calle Principal 789', validate_gender('M'))),
  ('836924a1-c4ad-4ef4-b138-467ab0bda514', (validate_ci('V-28155412', 'Employee'), 'Elena', 'Sofía', 'Paredes', 'Gómez', validate_phone('+3219876540'), validate_email('elena@gmail.com'), 'Avenida Secundaria 987', validate_gender('F'))),
  ('a55601e1-98ad-4ff1-9c9d-748547f8a79f', (validate_ci('V-28155410', 'Employee'), 'Isabel', 'Elena', 'López', 'Pérez', validate_phone('+1236549870'), validate_email('isabel@gmail.com'), 'Avenida del Sol 456', validate_gender('F'))),
  ('a70c9976-2c69-4219-8e9d-a26ba26da1d2', (validate_ci('V-28155406', 'Employee'), 'Felipe', 'Andrés', 'Fernández', 'Pérez', validate_phone('+3219876540'), validate_email('felipe@gmail.com'), 'Avenida Principal 456', validate_gender('M'))),
  ('c684a12f-f051-4c90-8c97-0372ce9fd3eb', (validate_ci('V-28155409', 'Employee'), 'Luis', 'Andrés', 'Ramírez', 'Gómez', validate_phone('+9876543210'), validate_email('luis@gmail.com'), 'Calle de la Esperanza 123', validate_gender('M'))),
  ('c6f0da21-ac9b-488f-a339-73454549e621', (validate_ci('V-28155414', 'Employee'), 'María', 'Isabel', 'García', 'Gómez', validate_phone('+7891234560'), validate_email('maria@gmail.com'), 'Avenida Principal 456', validate_gender('F'))),
  ('d57aa8ac-a693-4ff7-a61b-d4d9895a54c6', (validate_ci('V-28155415', 'Employee'), 'Pedro', 'Santiago', 'Fernández', 'Pérez', validate_phone('+9876543210'), validate_email('pedro@gmail.com'), 'Calle Secundaria 789', validate_gender('M'))),
  ('e2a8a7e6-1125-4425-ab62-8c8b1b41b272', (validate_ci('V-28155408', 'Employee'), 'Antonio', 'José', 'Ruiz', 'Martínez', validate_phone('+7891234560'), validate_email('antonio@gmail.com'), 'Avenida de la Libertad 987', validate_gender('M'))),
  ('ec11edd1-8d92-4552-bdb5-8562c9e59612', (validate_ci('V-28155413', 'Employee'), 'Javier', 'Andrés', 'Martínez', 'Martínez', validate_phone('+6549873210'), validate_email('javier@gmail.com'), 'Calle de la Paz 123', validate_gender('M')));

----------------------------------------
-- * Inserts para "Category"
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
-- * Inserts para "Supplier"
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
-- * Inserts para "Client"
----------------------------------------
INSERT INTO "Client" ("id", "data") VALUES
  ('040e0e89-c38d-4cc8-87f6-d7f1a466ef67', (validate_ci('V-26543781', 'Client'), 'Javier', 'Andrés', 'Torres', 'García', validate_phone('+1239876540'), validate_email('javier@example.com'), 'Calle Principal 777', validate_gender('M'))),
  ('30d60bd6-7152-4fe6-88ba-c9a4ca5056b8', (validate_ci('V-24123321', 'Client'), 'Pedro', 'Antonio', 'Ruiz', 'Sánchez', validate_phone('+4563217890'), validate_email('pedro@example.com'), 'Calle de la Paz 999', validate_gender('M'))),
  ('6ba454b3-19a7-43fb-8289-ddb9272072e8', (validate_ci('V-23456421', 'Client'), 'Sara', 'Isabel', 'Vargas', 'López', validate_phone('+9874563210'), validate_email('sara@example.com'), 'Avenida Principal 1233', validate_gender('F'))),
  ('71d2c191-d1ae-4b41-b661-722b5441c447', (validate_ci('V-29000111', 'Client'), 'Ana', 'Sofía', 'Gómez', 'Martínez', validate_phone('+6543219870'), validate_email('ana@example.com'), 'Avenida del Sol 555', validate_gender('F'))),
  ('7b6da078-6a46-4ca5-be8e-f571e755ddd7', (validate_ci('V-21980670', 'Client'), 'Andrés', 'Joaquín', 'Molina', 'Gómez', validate_phone('+7896543210'), validate_email('andres@example.com'), 'Calle Secundaria 2344', validate_gender('M'))),
  ('7f5eee41-f134-474c-a9f7-6fe565313003', (validate_ci('V-7123456', 'Client'), 'Laura', 'Elena', 'Pérez', 'García', validate_phone('+3216549870'), validate_email('laura@example.com'), 'Avenida Principal 101', validate_gender('F'))),
  ('87136d57-e8b9-4226-a4e2-523b80220e25', (validate_ci('V-27654781', 'Client'), 'Alejandro', 'Andres', 'Molina', 'Figueroa', validate_phone('+1234567890'), validate_email('juan@gmail.com'), 'Calle Principal 123', validate_gender('M'))),
  ('91043236-48a4-42ab-b477-380965eb24a8', (validate_ci('V-33123232', 'Client'), 'Luis', 'Felipe', 'Ramírez', 'Pérez', validate_phone('+9871236540'), validate_email('luis@example.com'), 'Calle de la Esperanza 444', validate_gender('M'))),
  ('92e7974b-08fd-46ae-b486-d9d6e7d05b98', (validate_ci('V-31234543', 'Client'), 'Juan', 'Carlos', 'González', 'Pérez', validate_phone('+1234567890'), validate_email('juan@example.com'), 'Calle Principal 123', validate_gender('M'))),
  ('97341fc5-832f-4ad5-a709-db66988bc928', (validate_ci('V-254345174', 'Client'), 'Carmen', 'Marta', 'Fernández', 'Hernández', validate_phone('+3217894560'), validate_email('carmen@example.com'), 'Avenida Secundaria 888', validate_gender('F'))),
  ('a6692de2-4cdd-4148-895d-7744a35e5b0c', (validate_ci('V-14657865', 'Client'), 'María', 'Isabel', 'López', 'Rodríguez', validate_phone('+9876543210'), validate_email('maria@example.com'), 'Avenida Secundaria 456', validate_gender('F'))),
  ('abfc50cf-26ba-4ccc-b769-0bea1aac7ec7', (validate_ci('V-32090786', 'Client'), 'Isabel', 'María', 'Sánchez', 'López', validate_phone('+6549873210'), validate_email('isabel@example.com'), 'Avenida de la Libertad 333', validate_gender('F'))),
  ('cad85b7f-6e8f-44e9-be5c-181253aee8c1', (validate_ci('V-10123432', 'Client'), 'Carlos', 'Alberto', 'Martínez', 'Gómez', validate_phone('+4567891230'), validate_email('carlos@example.com'), 'Calle de la Paz 789', validate_gender('M'))),
  ('f6d95af0-f12a-45ce-a386-c0d78a7f8863', (validate_ci('V-29087654', 'Client'), 'Manuel', 'José', 'Hernández', 'Fernández', validate_phone('+7891234560'), validate_email('manuel@example.com'), 'Calle Secundaria 222', validate_gender('M')));

----------------------------------------
-- * Inserts para "Branch"
----------------------------------------
INSERT INTO "Branch" ("id", "address_line_1", "address_line_2", "municipalty", "city", "zip", "mensual_cost") VALUES
  ('066724c7-1f4a-4992-8b55-6c4946bba009', '1233 Cypress Lane', NULL, 'Harborville', 'Puerto', '90123', 1600.00),
  ('13386c41-0c80-48f3-8c06-f79788b1d224', '222 Spruce Drive', NULL, 'Suburbia', 'Ciudad', '23456', 1600.00),
  ('1a27cdd2-a522-4286-a933-d86b4be9a362', '456 Elm Avenue', NULL, 'Townsville', 'Pueblo', '54321', 1200.00),
  ('36a6270f-9654-4e5f-aae5-b74702b7d75f', '1010 Pine Road', NULL, 'Hamletsville', 'Pueblo', '76543', 1400.00),
  ('3ee0aca9-8d74-4cf4-b7f2-4bc8230c4b57', '444 Birch Avenue', NULL, 'Uptown', 'Ciudad', '34567', 1800.00),
  ('4eba5f09-6a5f-471a-b117-36af2c70079d', '123 Main Street', NULL, 'Cityville', 'Ciudad', '12345', 1500.00),
  ('58466b8f-c950-437d-b7d6-4a31d2036318', '999 Willow Road', NULL, 'Countryside', 'Campo', '89012', 1700.00),
  ('643b9dfd-263c-4109-8c35-256efced4509', '789 Oak Lane', NULL, 'Villageton', 'Villa', '98765', 1700.00),
  ('6b773fb5-4031-4458-b6a9-ece09500fecd', '333 Cedar Lane', NULL, 'Ruralville', 'Pueblo', '87654', 1300.00),
  ('96772540-3787-4e83-b5a8-1e3f0ec79d05', '555 Maple Street', NULL, 'Downtown', 'Ciudad', '45678', 1900.00),
  ('970690aa-c820-4ef4-ad82-ac5830ea3fda', '777 Palm Road', NULL, 'Mountainville', 'Montaña', '67890', 2100.00),
  ('98b1c76e-c6c4-4967-b855-385f332c1e57', '666 Oak Avenue', NULL, 'Beachtown', 'Playa', '56789', 2000.00),
  ('a54e7697-083b-43b8-bce7-2b42e50db9ec', '888 Redwood Drive', NULL, 'Laketown', 'Lago', '78901', 2200.00),
  ('ba03f2fd-31ed-43d7-8644-389bd8a7125a', '2344 Pine Street', NULL, 'Hillside', 'Ladera', '91234', 1800.00),
  ('eb2985fd-3e90-4a84-ba9d-87d2789ac82d', '3455 Cedar Avenue', NULL, 'Valleyview', 'Valle', '92345', 1500.00);

----------------------------------------
-- * Inserts para "EmployeeHistory"
----------------------------------------
INSERT INTO "EmployeeHistory" ("date_start", "date_end", "salary", "role", "employeeId", "branchId") VALUES
  ('1999-01-01', '2005-12-31', 250.00, (SELECT "id" FROM "Rol" WHERE "description" = 'Jefe de Marketing'), '0752d788-e0c5-4ad0-8dfb-f7e40a366748', '066724c7-1f4a-4992-8b55-6c4946bba009'),
  ('2002-03-01', '2004-06-30', 220.00, (SELECT "id" FROM "Rol" WHERE "description" = 'Jefe de Frutas y Verduras'), '180dd597-d996-4bc9-8ec1-b1f85e46b05d', '13386c41-0c80-48f3-8c06-f79788b1d224'),
  ('2005-07-01', '2010-05-15', 300.00, (SELECT "id" FROM "Rol" WHERE "description" = 'Gerente de Tienda'), '23b20ce8-150b-47a3-b69a-bb4a4876d4a3', '1a27cdd2-a522-4286-a933-d86b4be9a362'),
  ('2010-09-15', '2015-11-30', 280.00, (SELECT "id" FROM "Rol" WHERE "description" = 'Especialista en Atención al Cliente'), '305c851c-7cc0-4438-870c-92b19c8a781f', '36a6270f-9654-4e5f-aae5-b74702b7d75f'),
  ('2015-02-15', '2018-12-31', 260.00, (SELECT "id" FROM "Rol" WHERE "description" = 'Cajero'), '62fceb2d-e71e-4163-826b-573503b4277a', '3ee0aca9-8d74-4cf4-b7f2-4bc8230c4b57'),
  ('2016-05-01', '2019-10-15', 270.00, (SELECT "id" FROM "Rol" WHERE "description" = 'Jefe de Carnicería'), '768c3809-ba88-4fc3-99db-cfd67f2a21ed', '4eba5f09-6a5f-471a-b117-36af2c70079d'),
  ('2017-08-10', '2020-11-30', 230.00, (SELECT "id" FROM "Rol" WHERE "description" = 'Subgerente de Tienda'), '836924a1-c4ad-4ef4-b138-467ab0bda514', '58466b8f-c950-437d-b7d6-4a31d2036318'),
  ('2019-12-01', '2021-05-20', 290.00, (SELECT "id" FROM "Rol" WHERE "description" = 'Jefe de Limpieza'), 'a55601e1-98ad-4ff1-9c9d-748547f8a79f', '643b9dfd-263c-4109-8c35-256efced4509'),
  ('2020-03-01', null, 260.00, (SELECT "id" FROM "Rol" WHERE "description" = 'Supervisor de Ventas'), 'c684a12f-f051-4c90-8c97-0372ce9fd3eb', '6b773fb5-4031-4458-b6a9-ece09500fecd'),
  ('2020-05-15', null, 310.00, (SELECT "id" FROM "Rol" WHERE "description" = 'Especialista en Compras'), 'c6f0da21-ac9b-488f-a339-73454549e621', '96772540-3787-4e83-b5a8-1e3f0ec79d05'),
  ('2018-06-20', '2021-12-31', 240.00, (SELECT "id" FROM "Rol" WHERE "description" = 'Reponedor'), 'd57aa8ac-a693-4ff7-a61b-d4d9895a54c6', 'ba03f2fd-31ed-43d7-8644-389bd8a7125a'),
  ('2019-08-10', '2022-07-15', 270.00, (SELECT "id" FROM "Rol" WHERE "description" = 'Cajero'), 'e2a8a7e6-1125-4425-ab62-8c8b1b41b272', 'eb2985fd-3e90-4a84-ba9d-87d2789ac82d'),
  ('2020-11-05', '2023-02-28', 280.00, (SELECT "id" FROM "Rol" WHERE "description" = 'Jefe de Panadería'), 'ec11edd1-8d92-4552-bdb5-8562c9e59612', '970690aa-c820-4ef4-ad82-ac5830ea3fda'),
  ('2021-04-15', null, 260.00, (SELECT "id" FROM "Rol" WHERE "description" = 'Asistente de Ventas'), 'a70c9976-2c69-4219-8e9d-a26ba26da1d2', '98b1c76e-c6c4-4967-b855-385f332c1e57'),
  ('2023-04-15', null, 260.00, (SELECT "id" FROM "Rol" WHERE "description" = 'Asistente de Ventas'), 'ec11edd1-8d92-4552-bdb5-8562c9e59612', 'a54e7697-083b-43b8-bce7-2b42e50db9ec');


  -- INSERT INTO "EmployeeHistory" ("date_start", "date_end", "salary", "role", "employeeId", "branchId") VALUES
  -- ('2023-11-02', null, 150.00, (SELECT "id" FROM "Rol" WHERE "description" = 'Encargado de Almacén'), '0752d788-e0c5-4ad0-8dfb-f7e40a366748', '066724c7-1f4a-4992-8b55-6c4946bba009'),
  -- ('2005-11-02', '2007-12-31', 130.00, (SELECT "id" FROM "Rol" WHERE "description" = 'Reponedor'), '180dd597-d996-4bc9-8ec1-b1f85e46b05d', '066724c7-1f4a-4992-8b55-6c4946bba009'),
  -- ('2023-11-02', null, 150.00, (SELECT "id" FROM "Rol" WHERE "description" = 'Encargado de Almacén'), '0752d788-e0c5-4ad0-8dfb-f7e40a366748', '13386c41-0c80-48f3-8c06-f79788b1d224'),
  -- ('2005-11-02', '2007-12-31', 130.00, (SELECT "id" FROM "Rol" WHERE "description" = 'Reponedor'), '180dd597-d996-4bc9-8ec1-b1f85e46b05d', '13386c41-0c80-48f3-8c06-f79788b1d224'),

----------------------------------------
-- * Inserts para "Absence"
----------------------------------------
INSERT INTO "Absence" ("startAbsence", "endAbsence", "justified", "startEmployee", "employeeId") VALUES
  ('2000-07-15', '2000-08-15', 'Vacaciones', '1999-01-01', '0752d788-e0c5-4ad0-8dfb-f7e40a366748'),
  ('2001-07-15', '2001-08-15', 'Enfermedad', '1999-01-01', '0752d788-e0c5-4ad0-8dfb-f7e40a366748'),
  ('2004-07-15', '2004-08-15', 'Otro', '1999-01-01', '0752d788-e0c5-4ad0-8dfb-f7e40a366748'),
  ('2003-09-20', '2003-10-20', 'Enfermedad', '2002-03-01', '180dd597-d996-4bc9-8ec1-b1f85e46b05d'),
  ('2006-10-05', '2006-11-05', 'Otro', '2005-07-01', '23b20ce8-150b-47a3-b69a-bb4a4876d4a3'),
  ('2012-03-15', '2012-05-15', 'Enfermedad', '2010-09-15', '305c851c-7cc0-4438-870c-92b19c8a781f'),
  ('2017-05-10', '2017-07-10', 'Vacaciones', '2015-02-15', '62fceb2d-e71e-4163-826b-573503b4277a'),
  ('2018-08-25', '2018-08-30', 'Otro', '2016-05-01', '768c3809-ba88-4fc3-99db-cfd67f2a21ed'),
  ('2016-12-26', '2017-01-09', 'Vacaciones', '2016-05-01', '768c3809-ba88-4fc3-99db-cfd67f2a21ed'),
  ('2019-11-12', '2019-11-30', 'Enfermedad', '2017-08-10', '836924a1-c4ad-4ef4-b138-467ab0bda514'),
  ('2020-02-07', '2020-05-07', 'Vacaciones', '2018-06-20', 'd57aa8ac-a693-4ff7-a61b-d4d9895a54c6'),
  ('2021-06-15', '2021-06-15', 'Otro', '2019-08-10', 'e2a8a7e6-1125-4425-ab62-8c8b1b41b272'),
  ('2022-09-20', '2022-09-20', 'Enfermedad', '2019-12-01', 'a55601e1-98ad-4ff1-9c9d-748547f8a79f'),
  ('2020-05-01', '2020-05-20', 'Vacaciones', '2020-03-01', 'c684a12f-f051-4c90-8c97-0372ce9fd3eb'),
  ('2020-09-01', '2020-09-20', 'Enfermedad', '2020-03-01', 'c684a12f-f051-4c90-8c97-0372ce9fd3eb'),
  ('2021-01-01', '2021-01-20', 'Otro', '2020-03-01', 'c684a12f-f051-4c90-8c97-0372ce9fd3eb'),
  ('2021-05-01', '2021-05-17', 'Vacaciones', '2020-03-01', 'c684a12f-f051-4c90-8c97-0372ce9fd3eb'),
  ('2021-12-01', '2021-12-15', 'Otro', '2020-03-01', 'c684a12f-f051-4c90-8c97-0372ce9fd3eb'),
  ('2022-12-01', '2023-01-20', 'Vacaciones', '2020-03-01', 'c684a12f-f051-4c90-8c97-0372ce9fd3eb'),
  ('2023-01-01', '2023-01-20', 'Enfermedad', '2020-03-01', 'c684a12f-f051-4c90-8c97-0372ce9fd3eb'),
  ('2023-01-30', '2023-04-30', 'Otro', '2020-05-15', 'c6f0da21-ac9b-488f-a339-73454549e621');


----------------------------------------
-- * Inserts para "ExtraCost"
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
-- * Inserts para "Product"
----------------------------------------
INSERT INTO "Product" ("id", "name", "description", "price", "category") VALUES
  ('5096a7f7-3c17-4762-9b4a-3420d56b2312', 'Zapatillas Deportivas', 'Zapatillas deportivas para correr y hacer ejercicio', 49.99, (SELECT "id" FROM "Category" WHERE "name" = 'Ropa')),
  ('5b018062-e4b1-4d5b-b074-d6b2ff046de8', 'Refrigerador de Doble Puerta', 'Refrigerador de doble puerta con dispensador de agua', 899.99, (SELECT "id" FROM "Category" WHERE "name" = 'Electrónicos')),
  ('6026076b-dd4f-4aa4-a2e8-1a8ddd62fd2b', 'Mesa de Centro de Vidrio', 'Mesa de centro de vidrio con estructura de metal', 119.99, (SELECT "id" FROM "Category" WHERE "name" = 'Hogar')),
  ('60eccff5-642f-4e7c-91fe-31464357163e', 'Pasta de Trigo Integral', 'Pasta de trigo integral para platos de pasta saludables', 3.99, (SELECT "id" FROM "Category" WHERE "name" = 'Alimentos')),
  ('77470869-b65b-4372-9512-3d2cfa749a8a', 'Juego de Comedor de Madera', 'Juego de comedor de madera con 6 sillas acolchadas', 499.99, (SELECT "id" FROM "Category" WHERE "name" = 'Hogar')),
  ('95382210-a804-481f-9438-b81c1d5f6cd3', 'Camiseta de Algodón', 'Camiseta de algodón de manga corta en varios colores y tallas', 19.99, (SELECT "id" FROM "Category" WHERE "name" = 'Ropa')),
  ('997e0ddf-afb0-452d-8b77-4718e4c500fc', 'Cereal Integral', 'Cereal integral con fibra y vitaminas', 4.99, (SELECT "id" FROM "Category" WHERE "name" = 'Alimentos')),
  ('a86c905b-01b0-44c2-932d-7f0bd7ba1391', 'Aceite de Oliva Extra Virgen', 'Aceite de oliva extra virgen de calidad premium', 9.99, (SELECT "id" FROM "Category" WHERE "name" = 'Alimentos')),
  ('ac7dfa84-bfad-4a11-aa7d-61e28663d1ae', 'Juego de Sartenes Antiadherentes', 'Juego de sartenes antiadherentes de alta calidad', 39.99, (SELECT "id" FROM "Category" WHERE "name" = 'Hogar')),
  ('b3b920a4-a222-4f2b-8183-f04e5d580492', 'Secadora de Ropa', 'Secadora de ropa de capacidad grande con múltiples ciclos', 599.99, (SELECT "id" FROM "Category" WHERE "name" = 'Electrónicos')),
  ('ba214aae-1118-45c1-ac0b-20e92f2aca8f', 'Televisor LED 50 pulgadas', 'Televisor de alta definición con pantalla LED de 50 pulgadas', 499.99, (SELECT "id" FROM "Category" WHERE "name" = 'Electrónicos')),
  ('bcd5e30d-8357-4ca0-8328-37aa2d58a7de', 'Chaqueta de Invierno', 'Chaqueta de invierno resistente al agua y con forro térmico', 79.99, (SELECT "id" FROM "Category" WHERE "name" = 'Ropa')),
  ('eb5026ef-76a0-45b0-8559-133d4b3fa2e6', 'Sofá de Cuero', 'Sofá de cuero de 3 plazas con diseño moderno', 799.99, (SELECT "id" FROM "Category" WHERE "name" = 'Hogar')),
  ('fa36db30-18a5-4b73-b4e3-41819f32e1d5', 'Lavadora de Carga Frontal', 'Lavadora de carga frontal con tecnología de ahorro de agua', 699.99, (SELECT "id" FROM "Category" WHERE "name" = 'Electrónicos')),
  ('ffbf4319-450e-4e75-8d03-aa1398d57c17', 'Traje de Baño para Mujer', 'Traje de baño de una pieza con diseño elegante', 29.99, (SELECT "id" FROM "Category" WHERE "name" = 'Ropa'));

----------------------------------------
-- * Inserts para "Order"
----------------------------------------
INSERT INTO "Order" ("id", "date", "taxes", "discount", "subtotal", "clientId", "branch") VALUES
  ('1f197f20-0dfb-4815-90b0-d4f6504a3cd0', '2000-01-10', 56.24, 5.00, 629.94, '040e0e89-c38d-4cc8-87f6-d7f1a466ef67', '066724c7-1f4a-4992-8b55-6c4946bba009'),
  ('b21c1a0d-6c0b-4f05-87a9-06b6a5f3c3df', '2001-01-15', 224.09, 10.00, 2499.96, '30d60bd6-7152-4fe6-88ba-c9a4ca5056b8', '13386c41-0c80-48f3-8c06-f79788b1d224'),
  ('573a34a1-1ea1-4a0b-81e9-ea998e732ca3', '2003-02-01', 0.35, 0.00, 3.99, '6ba454b3-19a7-43fb-8289-ddb9272072e8', '1a27cdd2-a522-4286-a933-d86b4be9a362'),
  ('1c4d63dc-8ef4-4b20-85e2-2c0bc6362e4a', '2015-02-10', 6.83, 4.00, 79.96, '71d2c191-d1ae-4b41-b661-722b5441c447', '36a6270f-9654-4e5f-aae5-b74702b7d75f'),
  ('be32d8e2-841d-4ec7-879c-95c398e22fc3', '2017-02-20', 18.57, 3.60, 209.97, '7b6da078-6a46-4ca5-be8e-f571e755ddd7', '3ee0aca9-8d74-4cf4-b7f2-4bc8230c4b57'),
  ('f7e2bfec-6f3c-4ab2-8c71-e8c8b3cb47d9', '2019-03-05', 287.59, 4.40, 3199.95, '7f5eee41-f134-474c-a9f7-6fe565313003', '4eba5f09-6a5f-471a-b117-36af2c70079d'),
  ('77b54183-86b4-4753-8f41-2e82543a26f2', '2020-03-10', 50.09, 3.40, 559.97, '87136d57-e8b9-4226-a4e2-523b80220e25', '58466b8f-c950-437d-b7d6-4a31d2036318'),
  ('d1f2de35-6e78-4be5-8d45-711bd8b1c6f2', '2021-03-15', 12.11, 5.40, 139.97, '91043236-48a4-42ab-b477-380965eb24a8', '643b9dfd-263c-4109-8c35-256efced4509'),
  ('1e82d8fe-9e1b-4c0d-894e-d6e4b33b1c42', '2022-04-01', 129.01, 6.40, 1439.91, '92e7974b-08fd-46ae-b486-d9d6e7d05b98', '96772540-3787-4e83-b5a8-1e3f0ec79d05'),
  ('b5f4c3bc-4a7f-4bfa-8d75-d9e6b44b4f3b', '2023-04-10', 80.99, 0.00, 899.99, '97341fc5-832f-4ad5-a709-db66988bc928', 'ba03f2fd-31ed-43d7-8644-389bd8a7125a'),
  ('3a7b9c57-7e9b-4cae-89e7-d1d6c3a3b2e5', '2016-04-20', 17.99, 0.00, 199.96, 'a6692de2-4cdd-4148-895d-7744a35e5b0c', 'eb2985fd-3e90-4a84-ba9d-87d2789ac82d'),
  ('a9c81d90-aa86-4b71-bf2a-6e1c19e0f4a7', '2023-01-10', 449.98, 0.00, 4999.85, '040e0e89-c38d-4cc8-87f6-d7f1a466ef67', '066724c7-1f4a-4992-8b55-6c4946bba009'),
  ('b3e8b86c-7857-48c5-a12a-9d4f2e33d1a3', '2023-02-10', 104.39, 0.00, 1159.94, '040e0e89-c38d-4cc8-87f6-d7f1a466ef67', '066724c7-1f4a-4992-8b55-6c4946bba009'),
  ('c7f8a4e5-6d9b-49e8-9d14-e2a5c9b11b7c', '2023-03-10', 10.97, 0.00, 121.94, '30d60bd6-7152-4fe6-88ba-c9a4ca5056b8', '13386c41-0c80-48f3-8c06-f79788b1d224'),
  ('d1a9e2c4-8b3f-47e1-9c5d-2a0f6e3b4d7d', '2023-04-10', 463.48, 0.00, 5149.85, '6ba454b3-19a7-43fb-8289-ddb9272072e8', '13386c41-0c80-48f3-8c06-f79788b1d224'),
  ('e6f2c3a7-4b5d-48e9-9a8c-1c0d9a2b3e8e', '2023-05-10', 143.99, 0.00, 1599.98, '71d2c191-d1ae-4b41-b661-722b5441c447', '1a27cdd2-a522-4286-a933-d86b4be9a362'),
  ('f4b3c2a9-1a7d-49e8-9e7d-3a3b1c4e2f5a', '2023-06-10', 674.99, 0.00, 7499.91, '71d2c191-d1ae-4b41-b661-722b5441c447', '1a27cdd2-a522-4286-a933-d86b4be9a362'),
  ('8c9a7b6e-3f4a-4d2e-5e1c-9b8a7c0d6e5d', '2023-07-10', 11.69, 0.00, 129.98, '7f5eee41-f134-474c-a9f7-6fe565313003', '36a6270f-9654-4e5f-aae5-b74702b7d75f'),
  ('9b7c6a8f-5e9d-4c2b-1a3f-8e7d9c4b2a5b', '2023-08-10', 58.49, 0.00, 649.94, '87136d57-e8b9-4226-a4e2-523b80220e25', '36a6270f-9654-4e5f-aae5-b74702b7d75f'),
  ('6d9a7c2e-4f5b-1e3a-9c8b-7a5d3e1f2c4a', '2023-09-10', 4.49, 0.00, 49.95, '87136d57-e8b9-4226-a4e2-523b80220e25', '3ee0aca9-8d74-4cf4-b7f2-4bc8230c4b57'),
  ('5e1c4a7d-9b8f-3a2c-6e5d-4b1a7d5f9c8b', '2023-10-10', 350.99, 0.00, 3899.94, '87136d57-e8b9-4226-a4e2-523b80220e25', '3ee0aca9-8d74-4cf4-b7f2-4bc8230c4b57');

----------------------------------------
-- * Inserts para "OrderProduct"
----------------------------------------
INSERT INTO "OrderProduct" ("orderId", "productId", "quantity") VALUES
  ('a9c81d90-aa86-4b71-bf2a-6e1c19e0f4a7', '95382210-a804-481f-9438-b81c1d5f6cd3', 5),
  ('a9c81d90-aa86-4b71-bf2a-6e1c19e0f4a7', '5b018062-e4b1-4d5b-b074-d6b2ff046de8', 5),
  ('a9c81d90-aa86-4b71-bf2a-6e1c19e0f4a7', 'bcd5e30d-8357-4ca0-8328-37aa2d58a7de', 5),
  ('1c4d63dc-8ef4-4b20-85e2-2c0bc6362e4a', '95382210-a804-481f-9438-b81c1d5f6cd3', 4),
  ('1e82d8fe-9e1b-4c0d-894e-d6e4b33b1c42', '5b018062-e4b1-4d5b-b074-d6b2ff046de8', 1),
  ('1e82d8fe-9e1b-4c0d-894e-d6e4b33b1c42', 'bcd5e30d-8357-4ca0-8328-37aa2d58a7de', 6),
  ('b3e8b86c-7857-48c5-a12a-9d4f2e33d1a3', 'ffbf4319-450e-4e75-8d03-aa1398d57c17', 2),
  ('b3e8b86c-7857-48c5-a12a-9d4f2e33d1a3', '5096a7f7-3c17-4762-9b4a-3420d56b2312', 2),
  ('b3e8b86c-7857-48c5-a12a-9d4f2e33d1a3', '77470869-b65b-4372-9512-3d2cfa749a8a', 2),
  ('1e82d8fe-9e1b-4c0d-894e-d6e4b33b1c42', 'ffbf4319-450e-4e75-8d03-aa1398d57c17', 2),
  ('1f197f20-0dfb-4815-90b0-d4f6504a3cd0', '5096a7f7-3c17-4762-9b4a-3420d56b2312', 2),
  ('1f197f20-0dfb-4815-90b0-d4f6504a3cd0', '77470869-b65b-4372-9512-3d2cfa749a8a', 1),
  ('c7f8a4e5-6d9b-49e8-9d14-e2a5c9b11b7c', 'a86c905b-01b0-44c2-932d-7f0bd7ba1391', 1),
  ('c7f8a4e5-6d9b-49e8-9d14-e2a5c9b11b7c', '5096a7f7-3c17-4762-9b4a-3420d56b2312', 2),
  ('c7f8a4e5-6d9b-49e8-9d14-e2a5c9b11b7c', '60eccff5-642f-4e7c-91fe-31464357163e', 3),
  ('1f197f20-0dfb-4815-90b0-d4f6504a3cd0', 'a86c905b-01b0-44c2-932d-7f0bd7ba1391', 3),
  ('3a7b9c57-7e9b-4cae-89e7-d1d6c3a3b2e5', '5096a7f7-3c17-4762-9b4a-3420d56b2312', 4),
  ('573a34a1-1ea1-4a0b-81e9-ea998e732ca3', '60eccff5-642f-4e7c-91fe-31464357163e', 1),
  ('d1a9e2c4-8b3f-47e1-9c5d-2a0f6e3b4d7d', 'ba214aae-1118-45c1-ac0b-20e92f2aca8f', 10),
  ('d1a9e2c4-8b3f-47e1-9c5d-2a0f6e3b4d7d', 'ffbf4319-450e-4e75-8d03-aa1398d57c17', 5),
  ('77b54183-86b4-4753-8f41-2e82543a26f2', 'ba214aae-1118-45c1-ac0b-20e92f2aca8f', 1),
  ('77b54183-86b4-4753-8f41-2e82543a26f2', 'ffbf4319-450e-4e75-8d03-aa1398d57c17', 2),
  ('e6f2c3a7-4b5d-48e9-9a8c-1c0d9a2b3e8e', 'eb5026ef-76a0-45b0-8559-133d4b3fa2e6', 2),
  ('b21c1a0d-6c0b-4f05-87a9-06b6a5f3c3df', 'ba214aae-1118-45c1-ac0b-20e92f2aca8f', 2),
  ('b21c1a0d-6c0b-4f05-87a9-06b6a5f3c3df', 'eb5026ef-76a0-45b0-8559-133d4b3fa2e6', 1),
  ('f4b3c2a9-1a7d-49e8-9e7d-3a3b1c4e2f5a', 'fa36db30-18a5-4b73-b4e3-41819f32e1d5', 3),
  ('f4b3c2a9-1a7d-49e8-9e7d-3a3b1c4e2f5a', '5b018062-e4b1-4d5b-b074-d6b2ff046de8', 6),
  ('b21c1a0d-6c0b-4f05-87a9-06b6a5f3c3df', 'fa36db30-18a5-4b73-b4e3-41819f32e1d5', 1),
  ('b5f4c3bc-4a7f-4bfa-8d75-d9e6b44b4f3b', '5b018062-e4b1-4d5b-b074-d6b2ff046de8', 1),
  ('8c9a7b6e-3f4a-4d2e-5e1c-9b8a7c0d6e5d', '5096a7f7-3c17-4762-9b4a-3420d56b2312', 1),
  ('8c9a7b6e-3f4a-4d2e-5e1c-9b8a7c0d6e5d', 'bcd5e30d-8357-4ca0-8328-37aa2d58a7de', 1),
  ('9b7c6a8f-5e9d-4c2b-1a3f-8e7d9c4b2a5b', '5096a7f7-3c17-4762-9b4a-3420d56b2312', 1),
  ('9b7c6a8f-5e9d-4c2b-1a3f-8e7d9c4b2a5b', '6026076b-dd4f-4aa4-a2e8-1a8ddd62fd2b', 5),
  ('be32d8e2-841d-4ec7-879c-95c398e22fc3', '5096a7f7-3c17-4762-9b4a-3420d56b2312', 1),
  ('be32d8e2-841d-4ec7-879c-95c398e22fc3', 'bcd5e30d-8357-4ca0-8328-37aa2d58a7de', 2),
  ('d1f2de35-6e78-4be5-8d45-711bd8b1c6f2', '6026076b-dd4f-4aa4-a2e8-1a8ddd62fd2b', 1),
  ('6d9a7c2e-4f5b-1e3a-9c8b-7a5d3e1f2c4a', 'a86c905b-01b0-44c2-932d-7f0bd7ba1391', 5),
  ('d1f2de35-6e78-4be5-8d45-711bd8b1c6f2', 'a86c905b-01b0-44c2-932d-7f0bd7ba1391', 2),
  ('5e1c4a7d-9b8f-3a2c-6e5d-4b1a7d5f9c8b', 'b3b920a4-a222-4f2b-8183-f04e5d580492', 3),
  ('5e1c4a7d-9b8f-3a2c-6e5d-4b1a7d5f9c8b', 'fa36db30-18a5-4b73-b4e3-41819f32e1d5', 3),
  ('f7e2bfec-6f3c-4ab2-8c71-e8c8b3cb47d9', 'b3b920a4-a222-4f2b-8183-f04e5d580492', 3),
  ('f7e2bfec-6f3c-4ab2-8c71-e8c8b3cb47d9', 'fa36db30-18a5-4b73-b4e3-41819f32e1d5', 2);

----------------------------------------
-- * Inserts para "BatchBuy"
----------------------------------------
INSERT INTO "BatchBuy" ("quantity", "date", "taxes", "date_production", "due_date", "purchase_price", "supplier", "branch", "product") VALUES
  (100, '2022-01-05', 50.00, '2021-12-15', '2022-06-15', 5000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos de Limpieza CleanMax'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '123 Main Street'), (SELECT "id" FROM "Product" WHERE "name" = 'Cereal Integral')),
  (50, '2022-02-10', 30.00, '2022-01-20', '2022-07-20', 3000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Juguetes Divertidos S.A.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '123 Main Street'), (SELECT "id" FROM "Product" WHERE "name" = 'Camiseta de Algodón')),
  (80, '2022-03-15', 40.00, '2022-02-25', '2022-08-25', 8000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Bebidas Refrescantes Co.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '123 Main Street'), (SELECT "id" FROM "Product" WHERE "name" = 'Sofá de Cuero')),
  (150, '2022-04-20', 75.00, '2022-03-30', '2022-09-30', 10000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Electrodomésticos HogarTech'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '123 Main Street'), (SELECT "id" FROM "Product" WHERE "name" = 'Refrigerador de Doble Puerta')),
  (200, '2022-05-25', 100.00, '2022-05-05', '2022-11-05', 15000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Herramientas Pro'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '123 Main Street'), (SELECT "id" FROM "Product" WHERE "name" = 'Zapatillas Deportivas')),
  (120, '2022-06-30', 60.00, '2022-06-10', '2022-12-10', 12000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Mascotas Felices'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '123 Main Street'), (SELECT "id" FROM "Product" WHERE "name" = 'Juego de Sartenes Antiadherentes')),
  (90, '2022-07-05', 45.00, '2022-07-15', '2023-01-15', 9000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Automoción Parts'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '123 Main Street'), (SELECT "id" FROM "Product" WHERE "name" = 'Secadora de Ropa')),
  (110, '2022-08-10', 55.00, '2022-08-20', '2023-02-20', 11000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos Orgánicos Verdes'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '123 Main Street'), (SELECT "id" FROM "Product" WHERE "name" = 'Aceite de Oliva Extra Virgen')),
  (60, '2022-09-15', 30.00, '2022-09-25', '2023-03-25', 6000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Electrónica Avanzada'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '123 Main Street'), (SELECT "id" FROM "Product" WHERE "name" = 'Chaqueta de Invierno')),
  (80, '2022-10-20', 40.00, '2022-10-30', '2023-04-30', 8000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos Farmacéuticos SaludTotal'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '123 Main Street'), (SELECT "id" FROM "Product" WHERE "name" = 'Mesa de Centro de Vidrio')),
  (75, '2022-12-30', 37.50, '2022-12-10', '2023-06-10', 7500.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Juguetes Divertidos S.A.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '123 Main Street'), (SELECT "id" FROM "Product" WHERE "name" = 'Televisor LED 50 pulgadas')),
  (90, '2023-01-10', 45.00, '2023-01-20', '2023-07-20', 9000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos de Limpieza CleanMax'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '123 Main Street'), (SELECT "id" FROM "Product" WHERE "name" = 'Refrigerador de Doble Puerta')),
  (60, '2023-02-15', 30.00, '2023-02-25', '2023-08-25', 6000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Bebidas Refrescantes Co.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '123 Main Street'), (SELECT "id" FROM "Product" WHERE "name" = 'Zapatillas Deportivas')),
  (110, '2023-03-20', 55.00, '2023-03-30', '2023-09-30', 11000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Electrodomésticos HogarTech'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '123 Main Street'), (SELECT "id" FROM "Product" WHERE "name" = 'Camiseta de Algodón')),

-- ! 2
  (100, '2022-01-05', 50.00, '2021-12-15', '2022-06-15', 5000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos de Limpieza CleanMax'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '456 Elm Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Cereal Integral')),
  (50, '2022-02-10', 30.00, '2022-01-20', '2022-07-20', 3000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Juguetes Divertidos S.A.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '456 Elm Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Camiseta de Algodón')),
  (80, '2022-03-15', 40.00, '2022-02-25', '2022-08-25', 8000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Bebidas Refrescantes Co.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '456 Elm Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Sofá de Cuero')),
  (150, '2022-04-20', 75.00, '2022-03-30', '2022-09-30', 10000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Electrodomésticos HogarTech'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '456 Elm Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Refrigerador de Doble Puerta')),
  (200, '2022-05-25', 100.00, '2022-05-05', '2022-11-05', 15000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Herramientas Pro'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '456 Elm Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Zapatillas Deportivas')),
  (120, '2022-06-30', 60.00, '2022-06-10', '2022-12-10', 12000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Mascotas Felices'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '456 Elm Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Juego de Sartenes Antiadherentes')),
  (90, '2022-07-05', 45.00, '2022-07-15', '2023-01-15', 9000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Automoción Parts'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '456 Elm Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Secadora de Ropa')),
  (110, '2022-08-10', 55.00, '2022-08-20', '2023-02-20', 11000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos Orgánicos Verdes'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '456 Elm Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Aceite de Oliva Extra Virgen')),
  (60, '2022-09-15', 30.00, '2022-09-25', '2023-03-25', 6000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Electrónica Avanzada'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '456 Elm Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Chaqueta de Invierno')),
  (80, '2022-10-20', 40.00, '2022-10-30', '2023-04-30', 8000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos Farmacéuticos SaludTotal'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '456 Elm Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Mesa de Centro de Vidrio')),
  (75, '2022-12-30', 37.50, '2022-12-10', '2023-06-10', 7500.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Juguetes Divertidos S.A.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '456 Elm Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Televisor LED 50 pulgadas')),
  (90, '2023-01-10', 45.00, '2023-01-20', '2023-07-20', 9000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos de Limpieza CleanMax'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '456 Elm Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Refrigerador de Doble Puerta')),
  (60, '2023-02-15', 30.00, '2023-02-25', '2023-08-25', 6000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Bebidas Refrescantes Co.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '456 Elm Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Zapatillas Deportivas')),
  (110, '2023-03-20', 55.00, '2023-03-30', '2023-09-30', 11000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Electrodomésticos HogarTech'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '456 Elm Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Camiseta de Algodón')),

-- ! 3
  (100, '2022-01-05', 50.00, '2021-12-15', '2022-06-15', 5000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos de Limpieza CleanMax'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '789 Oak Lane'), (SELECT "id" FROM "Product" WHERE "name" = 'Cereal Integral')),
  (50, '2022-02-10', 30.00, '2022-01-20', '2022-07-20', 3000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Juguetes Divertidos S.A.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '789 Oak Lane'), (SELECT "id" FROM "Product" WHERE "name" = 'Camiseta de Algodón')),
  (80, '2022-03-15', 40.00, '2022-02-25', '2022-08-25', 8000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Bebidas Refrescantes Co.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '789 Oak Lane'), (SELECT "id" FROM "Product" WHERE "name" = 'Sofá de Cuero')),
  (150, '2022-04-20', 75.00, '2022-03-30', '2022-09-30', 10000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Electrodomésticos HogarTech'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '789 Oak Lane'), (SELECT "id" FROM "Product" WHERE "name" = 'Refrigerador de Doble Puerta')),
  (200, '2022-05-25', 100.00, '2022-05-05', '2022-11-05', 15000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Herramientas Pro'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '789 Oak Lane'), (SELECT "id" FROM "Product" WHERE "name" = 'Zapatillas Deportivas')),
  (120, '2022-06-30', 60.00, '2022-06-10', '2022-12-10', 12000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Mascotas Felices'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '789 Oak Lane'), (SELECT "id" FROM "Product" WHERE "name" = 'Juego de Sartenes Antiadherentes')),
  (90, '2022-07-05', 45.00, '2022-07-15', '2023-01-15', 9000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Automoción Parts'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '789 Oak Lane'), (SELECT "id" FROM "Product" WHERE "name" = 'Secadora de Ropa')),
  (110, '2022-08-10', 55.00, '2022-08-20', '2023-02-20', 11000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos Orgánicos Verdes'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '789 Oak Lane'), (SELECT "id" FROM "Product" WHERE "name" = 'Aceite de Oliva Extra Virgen')),
  (60, '2022-09-15', 30.00, '2022-09-25', '2023-03-25', 6000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Electrónica Avanzada'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '789 Oak Lane'), (SELECT "id" FROM "Product" WHERE "name" = 'Chaqueta de Invierno')),
  (80, '2022-10-20', 40.00, '2022-10-30', '2023-04-30', 8000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos Farmacéuticos SaludTotal'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '789 Oak Lane'), (SELECT "id" FROM "Product" WHERE "name" = 'Mesa de Centro de Vidrio')),
  (75, '2022-12-30', 37.50, '2022-12-10', '2023-06-10', 7500.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Juguetes Divertidos S.A.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '789 Oak Lane'), (SELECT "id" FROM "Product" WHERE "name" = 'Televisor LED 50 pulgadas')),
  (90, '2023-01-10', 45.00, '2023-01-20', '2023-07-20', 9000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos de Limpieza CleanMax'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '789 Oak Lane'), (SELECT "id" FROM "Product" WHERE "name" = 'Refrigerador de Doble Puerta')),
  (60, '2023-02-15', 30.00, '2023-02-25', '2023-08-25', 6000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Bebidas Refrescantes Co.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '789 Oak Lane'), (SELECT "id" FROM "Product" WHERE "name" = 'Zapatillas Deportivas')),
  (110, '2023-03-20', 55.00, '2023-03-30', '2023-09-30', 11000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Electrodomésticos HogarTech'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '789 Oak Lane'), (SELECT "id" FROM "Product" WHERE "name" = 'Camiseta de Algodón')),

-- ! 4
  (100, '2022-01-05', 50.00, '2021-12-15', '2022-06-15', 5000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos de Limpieza CleanMax'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '1010 Pine Road'), (SELECT "id" FROM "Product" WHERE "name" = 'Cereal Integral')),
  (50, '2022-02-10', 30.00, '2022-01-20', '2022-07-20', 3000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Juguetes Divertidos S.A.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '1010 Pine Road'), (SELECT "id" FROM "Product" WHERE "name" = 'Camiseta de Algodón')),
  (80, '2022-03-15', 40.00, '2022-02-25', '2022-08-25', 8000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Bebidas Refrescantes Co.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '1010 Pine Road'), (SELECT "id" FROM "Product" WHERE "name" = 'Sofá de Cuero')),
  (150, '2022-04-20', 75.00, '2022-03-30', '2022-09-30', 10000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Electrodomésticos HogarTech'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '1010 Pine Road'), (SELECT "id" FROM "Product" WHERE "name" = 'Refrigerador de Doble Puerta')),
  (200, '2022-05-25', 100.00, '2022-05-05', '2022-11-05', 15000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Herramientas Pro'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '1010 Pine Road'), (SELECT "id" FROM "Product" WHERE "name" = 'Zapatillas Deportivas')),
  (120, '2022-06-30', 60.00, '2022-06-10', '2022-12-10', 12000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Mascotas Felices'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '1010 Pine Road'), (SELECT "id" FROM "Product" WHERE "name" = 'Juego de Sartenes Antiadherentes')),
  (90, '2022-07-05', 45.00, '2022-07-15', '2023-01-15', 9000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Automoción Parts'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '1010 Pine Road'), (SELECT "id" FROM "Product" WHERE "name" = 'Secadora de Ropa')),
  (110, '2022-08-10', 55.00, '2022-08-20', '2023-02-20', 11000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos Orgánicos Verdes'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '1010 Pine Road'), (SELECT "id" FROM "Product" WHERE "name" = 'Aceite de Oliva Extra Virgen')),
  (60, '2022-09-15', 30.00, '2022-09-25', '2023-03-25', 6000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Electrónica Avanzada'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '1010 Pine Road'), (SELECT "id" FROM "Product" WHERE "name" = 'Chaqueta de Invierno')),
  (80, '2022-10-20', 40.00, '2022-10-30', '2023-04-30', 8000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos Farmacéuticos SaludTotal'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '1010 Pine Road'), (SELECT "id" FROM "Product" WHERE "name" = 'Mesa de Centro de Vidrio')),
  (75, '2022-12-30', 37.50, '2022-12-10', '2023-06-10', 7500.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Juguetes Divertidos S.A.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '1010 Pine Road'), (SELECT "id" FROM "Product" WHERE "name" = 'Televisor LED 50 pulgadas')),
  (90, '2023-01-10', 45.00, '2023-01-20', '2023-07-20', 9000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos de Limpieza CleanMax'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '1010 Pine Road'), (SELECT "id" FROM "Product" WHERE "name" = 'Refrigerador de Doble Puerta')),
  (60, '2023-02-15', 30.00, '2023-02-25', '2023-08-25', 6000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Bebidas Refrescantes Co.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '1010 Pine Road'), (SELECT "id" FROM "Product" WHERE "name" = 'Zapatillas Deportivas')),
  (110, '2023-03-20', 55.00, '2023-03-30', '2023-09-30', 11000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Electrodomésticos HogarTech'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '1010 Pine Road'), (SELECT "id" FROM "Product" WHERE "name" = 'Camiseta de Algodón')),

-- ! 5
  (100, '2022-01-05', 50.00, '2021-12-15', '2022-06-15', 5000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos de Limpieza CleanMax'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '222 Spruce Drive'), (SELECT "id" FROM "Product" WHERE "name" = 'Cereal Integral')),
  (50, '2022-02-10', 30.00, '2022-01-20', '2022-07-20', 3000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Juguetes Divertidos S.A.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '222 Spruce Drive'), (SELECT "id" FROM "Product" WHERE "name" = 'Camiseta de Algodón')),
  (80, '2022-03-15', 40.00, '2022-02-25', '2022-08-25', 8000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Bebidas Refrescantes Co.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '222 Spruce Drive'), (SELECT "id" FROM "Product" WHERE "name" = 'Sofá de Cuero')),
  (150, '2022-04-20', 75.00, '2022-03-30', '2022-09-30', 10000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Electrodomésticos HogarTech'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '222 Spruce Drive'), (SELECT "id" FROM "Product" WHERE "name" = 'Refrigerador de Doble Puerta')),
  (200, '2022-05-25', 100.00, '2022-05-05', '2022-11-05', 15000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Herramientas Pro'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '222 Spruce Drive'), (SELECT "id" FROM "Product" WHERE "name" = 'Zapatillas Deportivas')),
  (120, '2022-06-30', 60.00, '2022-06-10', '2022-12-10', 12000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Mascotas Felices'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '222 Spruce Drive'), (SELECT "id" FROM "Product" WHERE "name" = 'Juego de Sartenes Antiadherentes')),
  (90, '2022-07-05', 45.00, '2022-07-15', '2023-01-15', 9000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Automoción Parts'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '222 Spruce Drive'), (SELECT "id" FROM "Product" WHERE "name" = 'Secadora de Ropa')),
  (110, '2022-08-10', 55.00, '2022-08-20', '2023-02-20', 11000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos Orgánicos Verdes'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '222 Spruce Drive'), (SELECT "id" FROM "Product" WHERE "name" = 'Aceite de Oliva Extra Virgen')),
  (60, '2022-09-15', 30.00, '2022-09-25', '2023-03-25', 6000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Electrónica Avanzada'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '222 Spruce Drive'), (SELECT "id" FROM "Product" WHERE "name" = 'Chaqueta de Invierno')),
  (80, '2022-10-20', 40.00, '2022-10-30', '2023-04-30', 8000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos Farmacéuticos SaludTotal'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '222 Spruce Drive'), (SELECT "id" FROM "Product" WHERE "name" = 'Mesa de Centro de Vidrio')),
  (75, '2022-12-30', 37.50, '2022-12-10', '2023-06-10', 7500.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Juguetes Divertidos S.A.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '222 Spruce Drive'), (SELECT "id" FROM "Product" WHERE "name" = 'Televisor LED 50 pulgadas')),
  (90, '2023-01-10', 45.00, '2023-01-20', '2023-07-20', 9000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos de Limpieza CleanMax'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '222 Spruce Drive'), (SELECT "id" FROM "Product" WHERE "name" = 'Refrigerador de Doble Puerta')),
  (60, '2023-02-15', 30.00, '2023-02-25', '2023-08-25', 6000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Bebidas Refrescantes Co.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '222 Spruce Drive'), (SELECT "id" FROM "Product" WHERE "name" = 'Zapatillas Deportivas')),
  (110, '2023-03-20', 55.00, '2023-03-30', '2023-09-30', 11000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Electrodomésticos HogarTech'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '222 Spruce Drive'), (SELECT "id" FROM "Product" WHERE "name" = 'Camiseta de Algodón')),

-- ! 6
  (100, '2022-01-05', 50.00, '2021-12-15', '2022-06-15', 5000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos de Limpieza CleanMax'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '333 Cedar Lane'), (SELECT "id" FROM "Product" WHERE "name" = 'Cereal Integral')),
  (50, '2022-02-10', 30.00, '2022-01-20', '2022-07-20', 3000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Juguetes Divertidos S.A.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '333 Cedar Lane'), (SELECT "id" FROM "Product" WHERE "name" = 'Camiseta de Algodón')),
  (80, '2022-03-15', 40.00, '2022-02-25', '2022-08-25', 8000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Bebidas Refrescantes Co.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '333 Cedar Lane'), (SELECT "id" FROM "Product" WHERE "name" = 'Sofá de Cuero')),
  (150, '2022-04-20', 75.00, '2022-03-30', '2022-09-30', 10000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Electrodomésticos HogarTech'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '333 Cedar Lane'), (SELECT "id" FROM "Product" WHERE "name" = 'Refrigerador de Doble Puerta')),
  (200, '2022-05-25', 100.00, '2022-05-05', '2022-11-05', 15000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Herramientas Pro'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '333 Cedar Lane'), (SELECT "id" FROM "Product" WHERE "name" = 'Zapatillas Deportivas')),
  (120, '2022-06-30', 60.00, '2022-06-10', '2022-12-10', 12000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Mascotas Felices'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '333 Cedar Lane'), (SELECT "id" FROM "Product" WHERE "name" = 'Juego de Sartenes Antiadherentes')),
  (90, '2022-07-05', 45.00, '2022-07-15', '2023-01-15', 9000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Automoción Parts'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '333 Cedar Lane'), (SELECT "id" FROM "Product" WHERE "name" = 'Secadora de Ropa')),
  (110, '2022-08-10', 55.00, '2022-08-20', '2023-02-20', 11000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos Orgánicos Verdes'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '333 Cedar Lane'), (SELECT "id" FROM "Product" WHERE "name" = 'Aceite de Oliva Extra Virgen')),
  (60, '2022-09-15', 30.00, '2022-09-25', '2023-03-25', 6000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Electrónica Avanzada'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '333 Cedar Lane'), (SELECT "id" FROM "Product" WHERE "name" = 'Chaqueta de Invierno')),
  (80, '2022-10-20', 40.00, '2022-10-30', '2023-04-30', 8000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos Farmacéuticos SaludTotal'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '333 Cedar Lane'), (SELECT "id" FROM "Product" WHERE "name" = 'Mesa de Centro de Vidrio')),
  (75, '2022-12-30', 37.50, '2022-12-10', '2023-06-10', 7500.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Juguetes Divertidos S.A.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '333 Cedar Lane'), (SELECT "id" FROM "Product" WHERE "name" = 'Televisor LED 50 pulgadas')),
  (90, '2023-01-10', 45.00, '2023-01-20', '2023-07-20', 9000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos de Limpieza CleanMax'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '333 Cedar Lane'), (SELECT "id" FROM "Product" WHERE "name" = 'Refrigerador de Doble Puerta')),
  (60, '2023-02-15', 30.00, '2023-02-25', '2023-08-25', 6000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Bebidas Refrescantes Co.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '333 Cedar Lane'), (SELECT "id" FROM "Product" WHERE "name" = 'Zapatillas Deportivas')),
  (110, '2023-03-20', 55.00, '2023-03-30', '2023-09-30', 11000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Electrodomésticos HogarTech'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '333 Cedar Lane'), (SELECT "id" FROM "Product" WHERE "name" = 'Camiseta de Algodón')),

-- ! 7
  (100, '2022-01-05', 50.00, '2021-12-15', '2022-06-15', 5000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos de Limpieza CleanMax'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '444 Birch Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Cereal Integral')),
  (50, '2022-02-10', 30.00, '2022-01-20', '2022-07-20', 3000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Juguetes Divertidos S.A.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '444 Birch Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Camiseta de Algodón')),
  (80, '2022-03-15', 40.00, '2022-02-25', '2022-08-25', 8000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Bebidas Refrescantes Co.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '444 Birch Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Sofá de Cuero')),
  (150, '2022-04-20', 75.00, '2022-03-30', '2022-09-30', 10000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Electrodomésticos HogarTech'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '444 Birch Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Refrigerador de Doble Puerta')),
  (200, '2022-05-25', 100.00, '2022-05-05', '2022-11-05', 15000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Herramientas Pro'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '444 Birch Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Zapatillas Deportivas')),
  (120, '2022-06-30', 60.00, '2022-06-10', '2022-12-10', 12000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Mascotas Felices'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '444 Birch Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Juego de Sartenes Antiadherentes')),
  (90, '2022-07-05', 45.00, '2022-07-15', '2023-01-15', 9000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Automoción Parts'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '444 Birch Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Secadora de Ropa')),
  (110, '2022-08-10', 55.00, '2022-08-20', '2023-02-20', 11000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos Orgánicos Verdes'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '444 Birch Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Aceite de Oliva Extra Virgen')),
  (60, '2022-09-15', 30.00, '2022-09-25', '2023-03-25', 6000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Electrónica Avanzada'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '444 Birch Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Chaqueta de Invierno')),
  (80, '2022-10-20', 40.00, '2022-10-30', '2023-04-30', 8000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos Farmacéuticos SaludTotal'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '444 Birch Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Mesa de Centro de Vidrio')),
  (75, '2022-12-30', 37.50, '2022-12-10', '2023-06-10', 7500.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Juguetes Divertidos S.A.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '444 Birch Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Televisor LED 50 pulgadas')),
  (90, '2023-01-10', 45.00, '2023-01-20', '2023-07-20', 9000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos de Limpieza CleanMax'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '444 Birch Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Refrigerador de Doble Puerta')),
  (60, '2023-02-15', 30.00, '2023-02-25', '2023-08-25', 6000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Bebidas Refrescantes Co.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '444 Birch Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Zapatillas Deportivas')),
  (110, '2023-03-20', 55.00, '2023-03-30', '2023-09-30', 11000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Electrodomésticos HogarTech'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '444 Birch Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Camiseta de Algodón')),

-- ! 8
  (100, '2022-01-05', 50.00, '2021-12-15', '2022-06-15', 5000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos de Limpieza CleanMax'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '555 Maple Street'), (SELECT "id" FROM "Product" WHERE "name" = 'Cereal Integral')),
  (50, '2022-02-10', 30.00, '2022-01-20', '2022-07-20', 3000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Juguetes Divertidos S.A.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '555 Maple Street'), (SELECT "id" FROM "Product" WHERE "name" = 'Camiseta de Algodón')),
  (80, '2022-03-15', 40.00, '2022-02-25', '2022-08-25', 8000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Bebidas Refrescantes Co.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '555 Maple Street'), (SELECT "id" FROM "Product" WHERE "name" = 'Sofá de Cuero')),
  (150, '2022-04-20', 75.00, '2022-03-30', '2022-09-30', 10000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Electrodomésticos HogarTech'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '555 Maple Street'), (SELECT "id" FROM "Product" WHERE "name" = 'Refrigerador de Doble Puerta')),
  (200, '2022-05-25', 100.00, '2022-05-05', '2022-11-05', 15000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Herramientas Pro'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '555 Maple Street'), (SELECT "id" FROM "Product" WHERE "name" = 'Zapatillas Deportivas')),
  (120, '2022-06-30', 60.00, '2022-06-10', '2022-12-10', 12000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Mascotas Felices'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '555 Maple Street'), (SELECT "id" FROM "Product" WHERE "name" = 'Juego de Sartenes Antiadherentes')),
  (90, '2022-07-05', 45.00, '2022-07-15', '2023-01-15', 9000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Automoción Parts'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '555 Maple Street'), (SELECT "id" FROM "Product" WHERE "name" = 'Secadora de Ropa')),
  (110, '2022-08-10', 55.00, '2022-08-20', '2023-02-20', 11000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos Orgánicos Verdes'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '555 Maple Street'), (SELECT "id" FROM "Product" WHERE "name" = 'Aceite de Oliva Extra Virgen')),
  (60, '2022-09-15', 30.00, '2022-09-25', '2023-03-25', 6000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Electrónica Avanzada'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '555 Maple Street'), (SELECT "id" FROM "Product" WHERE "name" = 'Chaqueta de Invierno')),
  (80, '2022-10-20', 40.00, '2022-10-30', '2023-04-30', 8000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos Farmacéuticos SaludTotal'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '555 Maple Street'), (SELECT "id" FROM "Product" WHERE "name" = 'Mesa de Centro de Vidrio')),
  (75, '2022-12-30', 37.50, '2022-12-10', '2023-06-10', 7500.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Juguetes Divertidos S.A.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '555 Maple Street'), (SELECT "id" FROM "Product" WHERE "name" = 'Televisor LED 50 pulgadas')),
  (90, '2023-01-10', 45.00, '2023-01-20', '2023-07-20', 9000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos de Limpieza CleanMax'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '555 Maple Street'), (SELECT "id" FROM "Product" WHERE "name" = 'Refrigerador de Doble Puerta')),
  (60, '2023-02-15', 30.00, '2023-02-25', '2023-08-25', 6000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Bebidas Refrescantes Co.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '555 Maple Street'), (SELECT "id" FROM "Product" WHERE "name" = 'Zapatillas Deportivas')),
  (110, '2023-03-20', 55.00, '2023-03-30', '2023-09-30', 11000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Electrodomésticos HogarTech'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '555 Maple Street'), (SELECT "id" FROM "Product" WHERE "name" = 'Camiseta de Algodón')),

-- ! 8
  (100, '2022-01-05', 50.00, '2021-12-15', '2022-06-15', 5000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos de Limpieza CleanMax'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '666 Oak Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Cereal Integral')),
  (50, '2022-02-10', 30.00, '2022-01-20', '2022-07-20', 3000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Juguetes Divertidos S.A.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '666 Oak Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Camiseta de Algodón')),
  (80, '2022-03-15', 40.00, '2022-02-25', '2022-08-25', 8000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Bebidas Refrescantes Co.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '666 Oak Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Sofá de Cuero')),
  (150, '2022-04-20', 75.00, '2022-03-30', '2022-09-30', 10000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Electrodomésticos HogarTech'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '666 Oak Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Refrigerador de Doble Puerta')),
  (200, '2022-05-25', 100.00, '2022-05-05', '2022-11-05', 15000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Herramientas Pro'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '666 Oak Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Zapatillas Deportivas')),
  (120, '2022-06-30', 60.00, '2022-06-10', '2022-12-10', 12000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Mascotas Felices'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '666 Oak Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Juego de Sartenes Antiadherentes')),
  (90, '2022-07-05', 45.00, '2022-07-15', '2023-01-15', 9000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Automoción Parts'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '666 Oak Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Secadora de Ropa')),
  (110, '2022-08-10', 55.00, '2022-08-20', '2023-02-20', 11000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos Orgánicos Verdes'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '666 Oak Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Aceite de Oliva Extra Virgen')),
  (60, '2022-09-15', 30.00, '2022-09-25', '2023-03-25', 6000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Electrónica Avanzada'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '666 Oak Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Chaqueta de Invierno')),
  (80, '2022-10-20', 40.00, '2022-10-30', '2023-04-30', 8000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos Farmacéuticos SaludTotal'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '666 Oak Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Mesa de Centro de Vidrio')),
  (75, '2022-12-30', 37.50, '2022-12-10', '2023-06-10', 7500.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Juguetes Divertidos S.A.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '666 Oak Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Televisor LED 50 pulgadas')),
  (90, '2023-01-10', 45.00, '2023-01-20', '2023-07-20', 9000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos de Limpieza CleanMax'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '666 Oak Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Refrigerador de Doble Puerta')),
  (60, '2023-02-15', 30.00, '2023-02-25', '2023-08-25', 6000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Bebidas Refrescantes Co.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '666 Oak Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Zapatillas Deportivas')),
  (110, '2023-03-20', 55.00, '2023-03-30', '2023-09-30', 11000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Electrodomésticos HogarTech'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '666 Oak Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Camiseta de Algodón')),

-- ! 9
  (100, '2022-01-05', 50.00, '2021-12-15', '2022-06-15', 5000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos de Limpieza CleanMax'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '777 Palm Road'), (SELECT "id" FROM "Product" WHERE "name" = 'Cereal Integral')),
  (50, '2022-02-10', 30.00, '2022-01-20', '2022-07-20', 3000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Juguetes Divertidos S.A.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '777 Palm Road'), (SELECT "id" FROM "Product" WHERE "name" = 'Camiseta de Algodón')),
  (80, '2022-03-15', 40.00, '2022-02-25', '2022-08-25', 8000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Bebidas Refrescantes Co.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '777 Palm Road'), (SELECT "id" FROM "Product" WHERE "name" = 'Sofá de Cuero')),
  (150, '2022-04-20', 75.00, '2022-03-30', '2022-09-30', 10000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Electrodomésticos HogarTech'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '777 Palm Road'), (SELECT "id" FROM "Product" WHERE "name" = 'Refrigerador de Doble Puerta')),
  (200, '2022-05-25', 100.00, '2022-05-05', '2022-11-05', 15000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Herramientas Pro'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '777 Palm Road'), (SELECT "id" FROM "Product" WHERE "name" = 'Zapatillas Deportivas')),
  (120, '2022-06-30', 60.00, '2022-06-10', '2022-12-10', 12000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Mascotas Felices'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '777 Palm Road'), (SELECT "id" FROM "Product" WHERE "name" = 'Juego de Sartenes Antiadherentes')),
  (90, '2022-07-05', 45.00, '2022-07-15', '2023-01-15', 9000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Automoción Parts'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '777 Palm Road'), (SELECT "id" FROM "Product" WHERE "name" = 'Secadora de Ropa')),
  (110, '2022-08-10', 55.00, '2022-08-20', '2023-02-20', 11000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos Orgánicos Verdes'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '777 Palm Road'), (SELECT "id" FROM "Product" WHERE "name" = 'Aceite de Oliva Extra Virgen')),
  (60, '2022-09-15', 30.00, '2022-09-25', '2023-03-25', 6000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Electrónica Avanzada'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '777 Palm Road'), (SELECT "id" FROM "Product" WHERE "name" = 'Chaqueta de Invierno')),
  (80, '2022-10-20', 40.00, '2022-10-30', '2023-04-30', 8000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos Farmacéuticos SaludTotal'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '777 Palm Road'), (SELECT "id" FROM "Product" WHERE "name" = 'Mesa de Centro de Vidrio')),
  (75, '2022-12-30', 37.50, '2022-12-10', '2023-06-10', 7500.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Juguetes Divertidos S.A.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '777 Palm Road'), (SELECT "id" FROM "Product" WHERE "name" = 'Televisor LED 50 pulgadas')),
  (90, '2023-01-10', 45.00, '2023-01-20', '2023-07-20', 9000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos de Limpieza CleanMax'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '777 Palm Road'), (SELECT "id" FROM "Product" WHERE "name" = 'Refrigerador de Doble Puerta')),
  (60, '2023-02-15', 30.00, '2023-02-25', '2023-08-25', 6000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Bebidas Refrescantes Co.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '777 Palm Road'), (SELECT "id" FROM "Product" WHERE "name" = 'Zapatillas Deportivas')),
  (110, '2023-03-20', 55.00, '2023-03-30', '2023-09-30', 11000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Electrodomésticos HogarTech'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '777 Palm Road'), (SELECT "id" FROM "Product" WHERE "name" = 'Camiseta de Algodón')),

-- ! 10
  (100, '2022-01-05', 50.00, '2021-12-15', '2022-06-15', 5000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos de Limpieza CleanMax'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '999 Willow Road'), (SELECT "id" FROM "Product" WHERE "name" = 'Cereal Integral')),
  (50, '2022-02-10', 30.00, '2022-01-20', '2022-07-20', 3000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Juguetes Divertidos S.A.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '999 Willow Road'), (SELECT "id" FROM "Product" WHERE "name" = 'Camiseta de Algodón')),
  (80, '2022-03-15', 40.00, '2022-02-25', '2022-08-25', 8000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Bebidas Refrescantes Co.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '999 Willow Road'), (SELECT "id" FROM "Product" WHERE "name" = 'Sofá de Cuero')),
  (150, '2022-04-20', 75.00, '2022-03-30', '2022-09-30', 10000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Electrodomésticos HogarTech'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '999 Willow Road'), (SELECT "id" FROM "Product" WHERE "name" = 'Refrigerador de Doble Puerta')),
  (200, '2022-05-25', 100.00, '2022-05-05', '2022-11-05', 15000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Herramientas Pro'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '999 Willow Road'), (SELECT "id" FROM "Product" WHERE "name" = 'Zapatillas Deportivas')),
  (120, '2022-06-30', 60.00, '2022-06-10', '2022-12-10', 12000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Mascotas Felices'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '999 Willow Road'), (SELECT "id" FROM "Product" WHERE "name" = 'Juego de Sartenes Antiadherentes')),
  (90, '2022-07-05', 45.00, '2022-07-15', '2023-01-15', 9000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Automoción Parts'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '999 Willow Road'), (SELECT "id" FROM "Product" WHERE "name" = 'Secadora de Ropa')),
  (110, '2022-08-10', 55.00, '2022-08-20', '2023-02-20', 11000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos Orgánicos Verdes'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '999 Willow Road'), (SELECT "id" FROM "Product" WHERE "name" = 'Aceite de Oliva Extra Virgen')),
  (60, '2022-09-15', 30.00, '2022-09-25', '2023-03-25', 6000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Electrónica Avanzada'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '999 Willow Road'), (SELECT "id" FROM "Product" WHERE "name" = 'Chaqueta de Invierno')),
  (80, '2022-10-20', 40.00, '2022-10-30', '2023-04-30', 8000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos Farmacéuticos SaludTotal'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '999 Willow Road'), (SELECT "id" FROM "Product" WHERE "name" = 'Mesa de Centro de Vidrio')),
  (75, '2022-12-30', 37.50, '2022-12-10', '2023-06-10', 7500.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Juguetes Divertidos S.A.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '999 Willow Road'), (SELECT "id" FROM "Product" WHERE "name" = 'Televisor LED 50 pulgadas')),
  (90, '2023-01-10', 45.00, '2023-01-20', '2023-07-20', 9000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos de Limpieza CleanMax'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '999 Willow Road'), (SELECT "id" FROM "Product" WHERE "name" = 'Refrigerador de Doble Puerta')),
  (60, '2023-02-15', 30.00, '2023-02-25', '2023-08-25', 6000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Bebidas Refrescantes Co.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '999 Willow Road'), (SELECT "id" FROM "Product" WHERE "name" = 'Zapatillas Deportivas')),
  (110, '2023-03-20', 55.00, '2023-03-30', '2023-09-30', 11000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Electrodomésticos HogarTech'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '999 Willow Road'), (SELECT "id" FROM "Product" WHERE "name" = 'Camiseta de Algodón')),

  (100, '2022-01-05', 50.00, '2021-12-15', '2022-06-15', 5000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos de Limpieza CleanMax'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '1233 Cypress Lane'), (SELECT "id" FROM "Product" WHERE "name" = 'Cereal Integral')),
  (50, '2022-02-10', 30.00, '2022-01-20', '2022-07-20', 3000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Juguetes Divertidos S.A.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '1233 Cypress Lane'), (SELECT "id" FROM "Product" WHERE "name" = 'Camiseta de Algodón')),
  (80, '2022-03-15', 40.00, '2022-02-25', '2022-08-25', 8000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Bebidas Refrescantes Co.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '1233 Cypress Lane'), (SELECT "id" FROM "Product" WHERE "name" = 'Sofá de Cuero')),
  (150, '2022-04-20', 75.00, '2022-03-30', '2022-09-30', 10000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Electrodomésticos HogarTech'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '1233 Cypress Lane'), (SELECT "id" FROM "Product" WHERE "name" = 'Refrigerador de Doble Puerta')),
  (200, '2022-05-25', 100.00, '2022-05-05', '2022-11-05', 15000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Herramientas Pro'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '1233 Cypress Lane'), (SELECT "id" FROM "Product" WHERE "name" = 'Zapatillas Deportivas')),
  (120, '2022-06-30', 60.00, '2022-06-10', '2022-12-10', 12000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Mascotas Felices'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '1233 Cypress Lane'), (SELECT "id" FROM "Product" WHERE "name" = 'Juego de Sartenes Antiadherentes')),
  (90, '2022-07-05', 45.00, '2022-07-15', '2023-01-15', 9000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Automoción Parts'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '1233 Cypress Lane'), (SELECT "id" FROM "Product" WHERE "name" = 'Secadora de Ropa')),
  (110, '2022-08-10', 55.00, '2022-08-20', '2023-02-20', 11000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos Orgánicos Verdes'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '1233 Cypress Lane'), (SELECT "id" FROM "Product" WHERE "name" = 'Aceite de Oliva Extra Virgen')),
  (60, '2022-09-15', 30.00, '2022-09-25', '2023-03-25', 6000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Electrónica Avanzada'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '1233 Cypress Lane'), (SELECT "id" FROM "Product" WHERE "name" = 'Chaqueta de Invierno')),
  (80, '2022-10-20', 40.00, '2022-10-30', '2023-04-30', 8000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos Farmacéuticos SaludTotal'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '1233 Cypress Lane'), (SELECT "id" FROM "Product" WHERE "name" = 'Mesa de Centro de Vidrio')),
  (75, '2022-12-30', 37.50, '2022-12-10', '2023-06-10', 7500.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Juguetes Divertidos S.A.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '1233 Cypress Lane'), (SELECT "id" FROM "Product" WHERE "name" = 'Televisor LED 50 pulgadas')),
  (90, '2023-01-10', 45.00, '2023-01-20', '2023-07-20', 9000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos de Limpieza CleanMax'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '1233 Cypress Lane'), (SELECT "id" FROM "Product" WHERE "name" = 'Refrigerador de Doble Puerta')),
  (60, '2023-02-15', 30.00, '2023-02-25', '2023-08-25', 6000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Bebidas Refrescantes Co.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '1233 Cypress Lane'), (SELECT "id" FROM "Product" WHERE "name" = 'Zapatillas Deportivas')),
  (110, '2023-03-20', 55.00, '2023-03-30', '2023-09-30', 11000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Electrodomésticos HogarTech'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '1233 Cypress Lane'), (SELECT "id" FROM "Product" WHERE "name" = 'Camiseta de Algodón')),

-- !12
  (100, '2022-01-05', 50.00, '2021-12-15', '2022-06-15', 5000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos de Limpieza CleanMax'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '2344 Pine Street'), (SELECT "id" FROM "Product" WHERE "name" = 'Cereal Integral')),
  (50, '2022-02-10', 30.00, '2022-01-20', '2022-07-20', 3000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Juguetes Divertidos S.A.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '2344 Pine Street'), (SELECT "id" FROM "Product" WHERE "name" = 'Camiseta de Algodón')),
  (80, '2022-03-15', 40.00, '2022-02-25', '2022-08-25', 8000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Bebidas Refrescantes Co.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '2344 Pine Street'), (SELECT "id" FROM "Product" WHERE "name" = 'Sofá de Cuero')),
  (150, '2022-04-20', 75.00, '2022-03-30', '2022-09-30', 10000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Electrodomésticos HogarTech'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '2344 Pine Street'), (SELECT "id" FROM "Product" WHERE "name" = 'Refrigerador de Doble Puerta')),
  (200, '2022-05-25', 100.00, '2022-05-05', '2022-11-05', 15000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Herramientas Pro'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '2344 Pine Street'), (SELECT "id" FROM "Product" WHERE "name" = 'Zapatillas Deportivas')),
  (120, '2022-06-30', 60.00, '2022-06-10', '2022-12-10', 12000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Mascotas Felices'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '2344 Pine Street'), (SELECT "id" FROM "Product" WHERE "name" = 'Juego de Sartenes Antiadherentes')),
  (90, '2022-07-05', 45.00, '2022-07-15', '2023-01-15', 9000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Automoción Parts'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '2344 Pine Street'), (SELECT "id" FROM "Product" WHERE "name" = 'Secadora de Ropa')),
  (110, '2022-08-10', 55.00, '2022-08-20', '2023-02-20', 11000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos Orgánicos Verdes'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '2344 Pine Street'), (SELECT "id" FROM "Product" WHERE "name" = 'Aceite de Oliva Extra Virgen')),
  (60, '2022-09-15', 30.00, '2022-09-25', '2023-03-25', 6000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Electrónica Avanzada'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '2344 Pine Street'), (SELECT "id" FROM "Product" WHERE "name" = 'Chaqueta de Invierno')),
  (80, '2022-10-20', 40.00, '2022-10-30', '2023-04-30', 8000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos Farmacéuticos SaludTotal'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '2344 Pine Street'), (SELECT "id" FROM "Product" WHERE "name" = 'Mesa de Centro de Vidrio')),
  (75, '2022-12-30', 37.50, '2022-12-10', '2023-06-10', 7500.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Juguetes Divertidos S.A.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '2344 Pine Street'), (SELECT "id" FROM "Product" WHERE "name" = 'Televisor LED 50 pulgadas')),
  (90, '2023-01-10', 45.00, '2023-01-20', '2023-07-20', 9000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos de Limpieza CleanMax'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '2344 Pine Street'), (SELECT "id" FROM "Product" WHERE "name" = 'Refrigerador de Doble Puerta')),
  (60, '2023-02-15', 30.00, '2023-02-25', '2023-08-25', 6000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Bebidas Refrescantes Co.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '2344 Pine Street'), (SELECT "id" FROM "Product" WHERE "name" = 'Zapatillas Deportivas')),
  (110, '2023-03-20', 55.00, '2023-03-30', '2023-09-30', 11000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Electrodomésticos HogarTech'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '2344 Pine Street'), (SELECT "id" FROM "Product" WHERE "name" = 'Camiseta de Algodón')),

-- !13
  (100, '2022-01-05', 50.00, '2021-12-15', '2022-06-15', 5000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos de Limpieza CleanMax'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '3455 Cedar Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Cereal Integral')),
  (50, '2022-02-10', 30.00, '2022-01-20', '2022-07-20', 3000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Juguetes Divertidos S.A.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '3455 Cedar Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Camiseta de Algodón')),
  (80, '2022-03-15', 40.00, '2022-02-25', '2022-08-25', 8000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Bebidas Refrescantes Co.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '3455 Cedar Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Sofá de Cuero')),
  (150, '2022-04-20', 75.00, '2022-03-30', '2022-09-30', 10000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Electrodomésticos HogarTech'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '3455 Cedar Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Refrigerador de Doble Puerta')),
  (200, '2022-05-25', 100.00, '2022-05-05', '2022-11-05', 15000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Herramientas Pro'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '3455 Cedar Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Zapatillas Deportivas')),
  (120, '2022-06-30', 60.00, '2022-06-10', '2022-12-10', 12000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Mascotas Felices'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '3455 Cedar Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Juego de Sartenes Antiadherentes')),
  (90, '2022-07-05', 45.00, '2022-07-15', '2023-01-15', 9000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Automoción Parts'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '3455 Cedar Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Secadora de Ropa')),
  (110, '2022-08-10', 55.00, '2022-08-20', '2023-02-20', 11000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos Orgánicos Verdes'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '3455 Cedar Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Aceite de Oliva Extra Virgen')),
  (60, '2022-09-15', 30.00, '2022-09-25', '2023-03-25', 6000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Electrónica Avanzada'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '3455 Cedar Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Chaqueta de Invierno')),
  (80, '2022-10-20', 40.00, '2022-10-30', '2023-04-30', 8000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos Farmacéuticos SaludTotal'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '3455 Cedar Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Mesa de Centro de Vidrio')),
  (75, '2022-12-30', 37.50, '2022-12-10', '2023-06-10', 7500.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Juguetes Divertidos S.A.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '3455 Cedar Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Televisor LED 50 pulgadas')),
  (90, '2023-01-10', 45.00, '2023-01-20', '2023-07-20', 9000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Productos de Limpieza CleanMax'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '3455 Cedar Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Refrigerador de Doble Puerta')),
  (60, '2023-02-15', 30.00, '2023-02-25', '2023-08-25', 6000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Bebidas Refrescantes Co.'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '3455 Cedar Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Zapatillas Deportivas')),
  (110, '2023-03-20', 55.00, '2023-03-30', '2023-09-30', 11000.00, (SELECT "id" FROM "Supplier" WHERE "name" = 'Electrodomésticos HogarTech'), (SELECT "id" FROM "Branch" WHERE "address_line_1" = '3455 Cedar Avenue'), (SELECT "id" FROM "Product" WHERE "name" = 'Camiseta de Algodón'));

COMMIT;