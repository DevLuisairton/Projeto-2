CREATE OR REPLACE FUNCTION random_int(min integer, max integer) RETURNS integer AS $BODY$
begin
	return (select FLOOR(random() * (max - min + 1)) + min);
end
$BODY$ LANGUAGE plpgsql;
COMMIT;

--SELECT random_int(1,5)

CREATE OR REPLACE FUNCTION random_date() RETURNS timestamp AS $BODY$
begin
	return (select NOW() - (random() * (interval '30 days')));
end
$BODY$ LANGUAGE plpgsql;
COMMIT;

--SELECT random_date();

CREATE OR REPLACE FUNCTION generate_data() RETURNS integer AS $BODY$
begin
	return (SELECT 300);
end
$BODY$ LANGUAGE plpgsql;
COMMIT;

--SELECT generate_data();

CREATE OR REPLACE FUNCTION random_veiculo() RETURNS TEXT AS $BODY$
begin
	return (
        SELECT 
			veiculo.nome_categoria
        FROM
  			(VALUES  ('Caminhonetes'), ('Populares'), ('Sedans'), ('SUVs')) AS veiculo (nome_categoria)
      	ORDER BY random()
        LIMIT 1)
  ;
end
$BODY$ LANGUAGE plpgsql;
COMMIT;

--SELECT random_veiculo();

CREATE OR REPLACE FUNCTION random_destino() RETURNS TEXT AS $BODY$
begin
	return (
        SELECT 
			destino.nome_destino
        FROM
  			(VALUES  ('Porto Alegre'), ('Ceará'), ('Rio de Janeiro'), ('São Paulo'), ('Goiânia'), ('Belém'), ('Cuiabá')) AS destino (nome_destino)
      	ORDER BY random()
        LIMIT 1)
  ;
end
$BODY$ LANGUAGE plpgsql;
COMMIT;

--SELECT random_destino();

CREATE OR REPLACE FUNCTION random_servico() RETURNS TEXT AS $BODY$
begin
	return (
        SELECT 
			servico.nome_servico
        FROM
  			(VALUES  ('Guia Turístico'), ('Aluguel de Malas'), ('Hospedagem para Pet'), ('Seguro Viagem')) AS servico (nome_servico)
      	ORDER BY random()
        LIMIT 1)
  ;
end
$BODY$ LANGUAGE plpgsql;
COMMIT;

--SELECT random_servico();