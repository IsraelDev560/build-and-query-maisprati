CREATE SCHEMA IF NOT EXISTS `exercicio03` DEFAULT CHARACTER SET utf8;
USE `exercicio03`;

CREATE TABLE IF NOT EXISTS `exercicio03`.`alunos`(
`aluno_id` INT NOT NULL AUTO_INCREMENT,
`codigo_matricula` INT NOT NULL,
`data_matricula` DATE NOT NULL,
`nome` VARCHAR(255) NOT NULL,
`endereco` VARCHAR(100) NOT NULL,
`telefone`VARCHAR(15) NOT NULL,
`data_nasc` DATE NOT NULL,
`altura` DECIMAL(3,2) NOT NULL,
`peso` DECIMAL(5,2) NOT NULL,
`turma` VARCHAR(255) NOT NULL,
`curso` VARCHAR(150) NOT NULL,
PRIMARY KEY(`aluno_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `exercicio03`.`turma` (
  `turma_id` INT NOT NULL AUTO_INCREMENT,
  `nome_turma` VARCHAR(255) NOT NULL,
  `quantidade_aluno` INT NOT NULL,
  `horario` VARCHAR(40) NOT NULL,
  `duracao_aula` VARCHAR(20) NOT NULL,
  `data_inicial` DATE NOT NULL,
  `data_final` DATE NOT NULL,
  `tipo_curso` VARCHAR(150) NOT NULL,
  `aluno_monitor` INT,
  FOREIGN KEY(`aluno_monitor`) REFERENCES `exercicio03`.`alunos`(`aluno_id`),
  PRIMARY KEY (`turma_id`),
  UNIQUE (`aluno_monitor`)
)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `exercicio03`.`professor` (
  `professor_id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `cpf` VARCHAR(14) NOT NULL UNIQUE,
  `turma_id` INT NOT NULL,
  `data_nasc` DATE NOT NULL,
  `titulacao` VARCHAR(20) NOT NULL,
  `aluno_monitor` INT,
  FOREIGN KEY (`aluno_monitor`) REFERENCES `exercicio03`.`alunos`(`aluno_id`),
  FOREIGN KEY (`turma_id`) REFERENCES `exercicio03`.`turma`(`turma_id`),
  PRIMARY KEY (`professor_id`)
)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `exercicio03`.`telefone_professor`(
  `telefone_id` INT NOT NULL AUTO_INCREMENT,
  `professor_id` INT NOT NULL,
  `telefone` VARCHAR(15) NOT NULL,
  FOREIGN KEY(`professor_id`) REFERENCES `exercicio03`.`professor`(`professor_id`),
  PRIMARY KEY(`telefone_id`)
)
ENGINE = InnoDB;
