CREATE SCHEMA IF NOT EXISTS `exercicio02` DEFAULT CHARACTER SET utf8 ;
USE `exercicio02` ;

CREATE TABLE IF NOT EXISTS `exercicio02`.`cardapio` (
	cardapio_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome_cafe VARCHAR(100) UNIQUE NOT NULL,
    descricao VARCHAR(255),
    preco_unitario DECIMAL(5,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS `exercicio02`.`comanda` (
	comanda_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    data_comanda DATE NOT NULL,
    mesa INT NOT NULL,
    nome_cliente VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS `exercicio02`.`itens_comanda` (
	item_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    comanda_id INT NOT NULL,
    cardapio_id INT NOT NULL,
    quantidade INT NOT NULL,
    preco_total DECIMAL(5, 2) NOT NULL,
    FOREIGN KEY (comanda_id) REFERENCES `exercicio02`.`comanda` (comanda_id),
    FOREIGN KEY (cardapio_id) REFERENCES `exercicio02`.`cardapio` (cardapio_id),
    UNIQUE (comanda_id, cardapio_id)
);


INSERT INTO `cardapio`(
    nome_cafe, descricao, preco_unitario 
) VALUES (
    "Café com açúcar", "Café preto com açúcar.", 2.50 
);
INSERT INTO `cardapio`(
    nome_cafe, descricao, preco_unitario 
) VALUES (
    "Pão de sal", "Pão de sal", 0.50 
);
INSERT INTO `cardapio`(
    nome_cafe, descricao, preco_unitario 
) VALUES (
    "Bauru de Frango", "Bauru de frango com catupiry", 3.20 
);

INSERT INTO `comanda`(
    data_comanda, mesa, nome_cliente
) VALUES (
    "2024-11-06", 1, "Israel"
);
INSERT INTO `comanda`(
    data_comanda, mesa, nome_cliente
) VALUES (
    "2024-12-06", 3, "Dênis"
);
INSERT INTO `comanda`(
    data_comanda, mesa, nome_cliente
) VALUES (
    "2024-11-20", 2, "Ajaques"
);

INSERT INTO `itens_comanda`(
    comanda_id, cardapio_id, quantidade, preco_total
) VALUES (
    1, 1, 1, 2.50
);

INSERT INTO `itens_comanda`(
    comanda_id, cardapio_id, quantidade, preco_total
) VALUES (
    2, 3, 2, 6.40
);

INSERT INTO `itens_comanda`(
    comanda_id, cardapio_id, quantidade, preco_total
) VALUES (
    3, 2, 3, 1.50
);

-- 1: Faça uma listagem do cardápio ordenada por nome;
SELECT nome_cafe FROM `cardapio`;

-- 2: Apresente todas as comandas (código, data, mesa e nome do cliente)
-- e os itens da comanda (código comanda, nome do café, descricão, quantidade,
-- preço unitário e preço total do café) destas ordenados data e código da comanda e,
-- também o nome do café;

SELECT c.data_comanda, i.comanda_id, ca.nome_cafe 
FROM `comanda` c 
INNER JOIN `itens_comanda` i ON i.comanda_id = c.comanda_id 
INNER JOIN `cardapio` ca ON i.cardapio_id = ca.cardapio_id;

SELECT * FROM comanda, itens_comanda;
