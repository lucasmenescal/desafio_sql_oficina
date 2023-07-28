-- Verificando sequencia de valores do serial da primary key da tabela orders
--SELECT column_name, column_default
--FROM information_schema.columns
--WHERE table_name = 'item_ordem_servico' AND column_name = 'id_item';
-- Resposta: orders_idorders_seq -- Setando sequencia da tabela orders em 1 novamente.
--SELECT pg_catalog.setval('item_ordem_servico_id_item_seq', 1, false);


INSERT INTO cliente (nome, endereco, telefone, email)
VALUES
    ('João da Silva', 'Rua A, 123', '(11) 9999-8888', 'joao.silva@email.com'),
    ('Maria Santos', 'Avenida B, 456', '(21) 9876-5432', 'maria.santos@email.com');
 
INSERT INTO veiculo (id_cliente, marca, modelo, ano, placa, quilometragem)
VALUES
    (1, 'Chevrolet', 'Onix', 2019, 'ABC-1234', 50000),
    (1, 'Volkswagen', 'Gol', 2018, 'DEF-5678', 60000),
    (2, 'Ford', 'Ka', 2020, 'GHI-9012', 40000);

INSERT INTO peca (nome_peca, preco_unitario)
VALUES
    ('Óleo do motor', 50.00),
    ('Filtro de óleo', 20.00),
    ('Bateria', 200.00);

   
INSERT INTO ordem_servico (id_veiculo, descricao_problema, data_abertura, data_conclusao, status)
VALUES
    (1, 'Troca de óleo e filtro', '2023-07-20', NULL, 'Em andamento'),
    (1, 'Reparo no motor', '2023-07-22', NULL, 'Pendente'),
    (2, 'Revisão completa', '2023-07-25', NULL, 'Pendente');

   
INSERT INTO item_ordem_servico (id_ordem_servico, id_peca, quantidade_utilizada)
VALUES
    (1, 1, 5),
    (1, 2, 1),
    (2, 3, 1),
    (3, 1, 4),
    (3, 2, 2),
    (3, 3, 1);
