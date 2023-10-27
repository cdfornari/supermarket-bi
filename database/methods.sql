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
CREATE OR REPLACE PROCEDURE create_persona(
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
CALL create_persona(
	'V-1000',
	'Juan',
	'Carlos',
	'Perez',
	'Gonzalez',
	'+58442857485',
	'uncorreo@gmail.com',
	'Chacaito, miranda',
	'M',
	'Employee'
)
