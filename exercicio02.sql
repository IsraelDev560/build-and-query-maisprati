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



