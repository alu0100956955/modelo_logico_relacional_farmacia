CREATE FUNCTION stock() RETURNS trigger AS $stock$
	BEGIN
		-- Comprobar que las unidades en stock son mayor que 5
		IF NEW.unidades_en_stock < 5 THEN
			RAISE EXCEPTION '% hay mandar a pedir mas del medicamento' , NEW.nombreM;
		END IF;
	END;
$stock$ LANGUAGE plpgsql;

CREATE TRIGGER stock BEFORE INSERT OR UPDATE ON mydb.medicamentos
	FOR EACH ROW EXECUTE PROCEDURE stock();
