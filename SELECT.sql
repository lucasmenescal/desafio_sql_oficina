SELECT p.preco_unitario FROM peca p, item_ordem_servico ios, ordem_servico os, veiculo v, cliente c, funcionario f WHERE 
	p.id_peca = ios.id_peca;
	
SELECT * FROM ordem_servico os;
SELECT * FROM item_ordem_servico ios;

--Qual o custo total das peças ordem de serviço 3? 
SELECT
	sum(p.preco_unitario * ios.quantidade_utilizada) AS total
FROM
	ordem_servico os
LEFT OUTER JOIN item_ordem_servico ios ON
	ios.id_ordem_servico = os.id_ordem_servico
LEFT OUTER JOIN peca p ON
	p.id_peca = ios.id_peca
WHERE
	os.id_ordem_servico = 3;
	
-- Ordenação
SELECT * FROM item_ordem_servico ios ORDER BY ios.id_peca;

-- Clientes que possuem mais de uma ordem de serviço 
SELECT c.id_cliente, c.nome AS nome_cliente, COUNT(os.id_ordem_servico) AS quantidade_ordens_servico
FROM cliente c
LEFT JOIN veiculo v ON c.id_cliente = v.id_cliente
LEFT JOIN ordem_servico os ON v.id_veiculo = os.id_veiculo
GROUP BY c.id_cliente, c.nome
HAVING COUNT(os.id_ordem_servico) > 1;
