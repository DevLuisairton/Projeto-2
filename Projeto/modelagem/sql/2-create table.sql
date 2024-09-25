CREATE TABLE IF NOT EXISTS pagina (
  id_pagina SERIAL PRIMARY KEY,
  pagina VARCHAR(24) NOT NULL
);
COMMIT;

/* popular as páginas*/
INSERT INTO pagina (pagina) VALUES
  ('home'),
  ('veiculo'),
  ('hotel'),
  ('aereo'),
  ('servico');
COMMIT;

CREATE TABLE IF NOT EXISTS cliente (
  id_cliente SERIAL PRIMARY KEY,
  nome VARCHAR(48) NOT NULL,
  email VARCHAR(48) NOT NULL,
  telefone VARCHAR(48) NOT NULL,
  mensagem VARCHAR(255) NOT NULL,
  data_formulario TIMESTAMP NOT NULL,
  fk_id_pagina INT NOT NULL,
  CONSTRAINT fk_pagina FOREIGN KEY (fk_id_pagina) REFERENCES pagina(id_pagina)
);
COMMIT;

CREATE TABLE IF NOT EXISTS veiculo (
  id_veiculo SERIAL PRIMARY KEY,
  nome_categoria VARCHAR(48) NOT NULL,
  fk_id_pagina INT NOT NULL,
  CONSTRAINT fk_pagina FOREIGN KEY (fk_id_pagina) REFERENCES pagina(id_pagina)
);
COMMIT;

CREATE TABLE IF NOT EXISTS hotel (
  id_hotel SERIAL PRIMARY KEY,
  nome_destino VARCHAR(48) NOT NULL,
  fk_id_pagina INT NOT NULL,
  CONSTRAINT fk_pagina FOREIGN KEY (fk_id_pagina) REFERENCES pagina(id_pagina)
);
COMMIT;

CREATE TABLE IF NOT EXISTS aereo (
  id_aereo SERIAL PRIMARY KEY,
  nome_destino VARCHAR(48) NOT NULL,
  fk_id_pagina INT NOT NULL,
  CONSTRAINT fk_pagina FOREIGN KEY (fk_id_pagina) REFERENCES pagina(id_pagina)
);
COMMIT;

CREATE TABLE IF NOT EXISTS servico (
  id_servico SERIAL PRIMARY KEY,
  nome_servico VARCHAR(48) NOT NULL,
  fk_id_pagina INT NOT NULL,
  CONSTRAINT fk_pagina FOREIGN KEY (fk_id_pagina) REFERENCES pagina(id_pagina)
);
COMMIT;

