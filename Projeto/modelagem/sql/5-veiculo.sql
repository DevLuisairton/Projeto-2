INSERT INTO veiculo (nome_categoria, fk_id_pagina)
SELECT
    arrays.nome_categoria[s.a % ARRAY_LENGTH(arrays.nome_categoria,1) + 1] AS nome_categoria,
    arrays.fk_id_pagina[s.a % ARRAY_LENGTH(arrays.fk_id_pagina,1) + 1] AS fk_id_pagina
FROM generate_series(1, generate_data()) AS s(a) -- number of records to generate
CROSS JOIN(
    SELECT ARRAY[
      random_veiculo(),
      random_veiculo(),
      random_veiculo(),
      random_veiculo(),
      random_veiculo(),
      random_veiculo(),
      random_veiculo()
    ] AS nome_categoria,
  ARRAY[
    2
    ] AS fk_id_pagina
) AS arrays