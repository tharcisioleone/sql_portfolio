-- 🔨 Construir e destruir: consultas introdutórias do SQL 🙂 --

-- Criando bancos de dados
-- Escreva a instrução SQL correta para criar um novo banco de dados chamado myNewDB.

CREATE DATABASE myNewDB; 

-- Grave a instrução SQL correta para visualizar todos os 
-- bancos de dados existentes em seu servidor de banco de dados.

SHOW DATABASES; 

-- Escreva a instrução SQL correta para selecionar o banco de dados
-- myNewDB, para executar consultas adicionais.

USE myNewDB; 

-- Excluindo bancos de dados
-- Grave a instrução SQL correta para excluir um banco de dados chamado myNewDB.

DROP DATABASE myNewDb;

-- Criando tabelas
-- Escreva a instrução SQL correta para criar uma nova tabela chamada
-- Users, com um campo int chamado UserID e os seguintes campos varchar de
-- tamanho 255: LastName, FirstName, Address, City

CREATE TABLE Users ( 
  UserID INT, 
  LastName VARCHAR(255), 
  FirstName VARCHAR(255), 
  Address VARCHAR(255), 
  City VARCHAR(255)
);

-- Excluindo tabelas
-- Escreva a instrução SQL correta para excluir uma tabela chamada Users.

DROP TABLE Users; 

-- Use a instrução TRUNCATE para excluir todos os dados da tabela Users.

TRUNCATE TABLE Users;

-- Alterando tabelas
-- Adicione uma coluna do tipo DATE chamada Aniversário à tabela Usuários.

ALTER TABLE Users
ADD COLUMN Birthday DATE;

-- Exclua a coluna Aniversário da tabela Usuários.

ALTER TABLE Users 
DROP COLUMN Birthday;

-- Adicione as colunas varchar 
-- MiddleName, NickName, Email, Suffix e BadgeID
-- à tabela Users, com tamanho 255, com exceção de Suffix
-- que tem tamanho 64, usando uma única instrução.

ALTER TABLE Users 
ADD COLUMN MiddleName VARCHAR(255),
ADD COLUMN FirstName VARCHAR(255),
ADD COLUMN Email VARCHAR(255),
ADD COLUMN Suffix VARCHAR(64), 
ADD COLUMN BadgeID VARCHAR(255);

-- Exclua as colunas NickName e Suffix da tabela Users, usando uma única instrução.

ALTER TABLE Users 
DROP COLUMN NickName, 
DROP COLUMN Suffix;

-- Renomeie a coluna MiddleName para Initial na tabela Users.

ALTER TABLE USERS 
RENAME COLUMN MiddleName TO Initial;

-- Renomeie a coluna FirstName para First_Name e LastName para
-- Last_Name na tabela Users, em uma instrução, mantendo suas configurações originais.

ALTER TABLE Users 
RENAME COLUMN FirstName TO First_Name, 
RENAME COLUMN LastName TO Last_Name;

-- Escreva uma consulta para exibir as colunas e configurações da tabela Usuários.

SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = N'Users';

-- Inserindo registros
-- Insira um novo registro na tabela Alunos.
--
-- Esquema:
-- Nome do aluno,
-- Endereço,
-- Cidade,
-- Código postal,
-- País
--
-- Informações do registro para inserir:
--
-- Jane Doe
-- 57 Union St
-- Glasgow, Escócia
-- G13RB

CREATE TABLE Students
( 
  StudentID INT,
  StudentName VARCHAR(255), 
  Address VARCHAR(255), 
  City VARCHAR(255), 
  PostalCode VARCHAR(255), 
  Country VARCHAR(255)
);

INSERT INTO Students(StudentID, StudentName, Address, City, PostalCode, Country)
VALUES(1, 'Jane Doe', '57 Union St', 'Glassgow, Scotland', 'G13RB');

-- Atualizando registros
-- Atualize a coluna Cidade de todos os registros na tabela Alunos e defina-a como "Edimburgo".

UPDATE Students
SET City = 'Edinburgh';

-- Defina o valor das colunas Cidade para "Edimburgo", mas apenas aquelas
-- em que a coluna País tem o valor "Escócia".

UPDATE Students 
SET City = 'Edinburgh'
WHERE Country = 'Scotland';

-- Atualize o valor da Cidade e o valor do País para "Edinburgh", "Scotland" 
-- na tabela Estudantes, para o Estudante cujo ID é 35.

UPDATE Students 
SET City = 'Edinburgh', Country = 'Scotland' 
WHERE StudentID = 35;

-- Excluindo registros
-- Exclua todos os registros da tabela Estudantes onde o valor do País é "Escócia".

DELETE FROM Students
WHERE Country = 'Scotland';

-- Exclua todos os registros da tabela Alunos.

DELETE FROM Students;
