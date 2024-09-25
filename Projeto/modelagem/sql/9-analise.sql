/*leads para contato*/
SELECT
	tbl2.pagina,
	tbl1.data_formulario,
    tbl1.nome,
    tbl1.email,
    tbl1.telefone,
    tbl1.mensagem
FROM cliente tbl1
LEFT JOIN pagina tbl2 ON tbl1.fk_id_pagina = tbl2.id_pagina
ORDER BY tbl2.pagina, tbl1.data_formulario;
COMMIT;

/*frequência de acesso*/
SELECT
	EXTRACT(YEAR FROM tbl1.data_formulario) AS ano,
    EXTRACT(MONTH FROM tbl1.data_formulario) AS mes,
    EXTRACT(DAY FROM tbl1.data_formulario) AS dia,
    tbl2.pagina,
    COUNT(*) as contagem_intencao
FROM cliente tbl1
LEFT JOIN pagina tbl2 ON tbl1.fk_id_pagina = tbl2.id_pagina
GROUP BY ano, mes, dia, tbl2.pagina
ORDER BY ano, mes, dia, tbl2.pagina, contagem_intencao DESC;
COMMIT;

/*frequência de acesso por página e produto*/
WITH tbl_aereo AS (
  	SELECT 
		tbl2.pagina, 
    	tbl1.nome_destino AS produto,
    	COUNT(*) contagem_intencao
  	FROM aereo tbl1
	LEFT JOIN pagina tbl2 ON tbl1.fk_id_pagina = tbl2.id_pagina
	GROUP BY tbl2.pagina, produto
),
tbl_hotel As (
  	SELECT 
		tbl2.pagina, 
    	tbl1.nome_destino AS produto,
    	COUNT(*) contagem_intencao
  	FROM hotel tbl1
	LEFT JOIN pagina tbl2 ON tbl1.fk_id_pagina = tbl2.id_pagina
	GROUP BY tbl2.pagina, produto
),
tbl_servico AS (
  	SELECT 
		tbl2.pagina, 
    	tbl1.nome_servico AS produto,
    	COUNT(*) contagem_intencao
  	FROM servico tbl1
	LEFT JOIN pagina tbl2 ON tbl1.fk_id_pagina = tbl2.id_pagina
	GROUP BY tbl2.pagina, produto
),
tbl_veiculo AS (
  	SELECT 
		tbl2.pagina, 
    	tbl1.nome_categoria AS produto,
    	COUNT(*) contagem_intencao
  	FROM veiculo tbl1
	LEFT JOIN pagina tbl2 ON tbl1.fk_id_pagina = tbl2.id_pagina
	GROUP BY tbl2.pagina, produto
),
tabelas As (
  SELECT * FROM tbl_aereo
  UNION ALL
  SELECT * FROM tbl_hotel
  UNION ALL
  SELECT * FROM tbl_servico
  UNION ALL
  SELECT * FROM tbl_veiculo
)
SELECT
	*
FROM tabelas
ORDER BY contagem_intencao DESC, produto;
COMMIT;