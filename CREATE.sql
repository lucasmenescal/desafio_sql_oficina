CREATE TABLE cliente (
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(200) NOT NULL,
    telefone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE veiculo (
    id_veiculo SERIAL PRIMARY KEY,
    id_cliente INTEGER,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    ano INTEGER,
    placa VARCHAR(10) NOT NULL,
    quilometragem INTEGER,
    CONSTRAINT fk_veiculo_cliente FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)
);

CREATE TABLE funcionario (
    id_funcionario SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    telefone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE ordem_servico (
    id_ordem_servico SERIAL PRIMARY KEY,
    id_funcionario INTEGER,
    id_veiculo INTEGER,
    descricao_problema TEXT NOT NULL,
    data_abertura DATE NOT NULL,
    data_conclusao DATE,
    status VARCHAR(20) NOT NULL,
    CONSTRAINT fk_ordemServico_veiculo FOREIGN KEY (id_veiculo) REFERENCES veiculo(id_veiculo),
    CONSTRAINT fk_odemServico_funcionario FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario)
);

CREATE TABLE peca (
    id_peca SERIAL PRIMARY KEY,
    nome_peca VARCHAR(100) NOT NULL,
    preco_unitario NUMERIC(10, 2) NOT NULL
);

CREATE TABLE item_ordem_servico (
    id_item SERIAL PRIMARY KEY,
    id_ordem_servico INTEGER,
    id_peca INTEGER REFERENCES peca(id_peca),
    quantidade_utilizada INTEGER NOT NULL,
    CONSTRAINT fk_itemOrdemServico_ordemServico FOREIGN KEY (id_ordem_servico) REFERENCES ordem_servico (id_ordem_servico)
);