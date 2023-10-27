-------------------------------------------
-- * Creación de métodos para la validación del TDA
-------------------------------------------

-- * Validación de cédula de identidad
CREATE OR REPLACE FUNCTION validate_ci(ci varchar(256)) RETURNS varchar(256) AS $$
BEGIN
    IF ci ~ '^[VE]-' THEN
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
