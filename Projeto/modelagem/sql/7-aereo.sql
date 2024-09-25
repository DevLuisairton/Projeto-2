INSERT INTO aereo (nome_destino, fk_id_pagina)
SELECT
    arrays.nome_destino[s.a % ARRAY_LENGTH(arrays.nome_destino,1) + 1] AS nome_destino,
    arrays.fk_id_pagina[s.a % ARRAY_LENGTH(arrays.fk_id_pagina,1) + 1] AS fk_id_pagina
FROM generate_series(1,generate_data()) AS s(a) -- number of records to generate
CROSS JOIN(
    SELECT ARRAY[
      random_destino(),
      random_destino(),
      random_destino(),
      random_destino(),
      random_destino(),
      random_destino(),
      random_destino()
    ] AS nome_destino,
  ARRAY[
    4
    ] AS fk_id_pagina
) AS arrays