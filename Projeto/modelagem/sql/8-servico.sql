INSERT INTO servico (nome_servico, fk_id_pagina)
SELECT
    arrays.nome_servico[s.a % ARRAY_LENGTH(arrays.nome_servico,1) + 1] AS nome_servico,
    arrays.fk_id_pagina[s.a % ARRAY_LENGTH(arrays.fk_id_pagina,1) + 1] AS fk_id_pagina
FROM generate_series(1,generate_data()) AS s(a) -- number of records to generate
CROSS JOIN(
    SELECT ARRAY[
      random_servico(),
      random_servico(),
      random_servico(),
      random_servico(),
      random_servico(),
      random_servico(),
      random_servico()
    ] AS nome_servico,
  ARRAY[
    5
    ] AS fk_id_pagina
) AS arrays