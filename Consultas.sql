DESC ALUNO
SELECT * FROM ALUNO

/* Renomeando Elementos - ALIAS */

SELECT  nome AS "NOME COMPLETO", 
        sexo,
        datanascimento NASC,
        cidade        
FROM ALUNO

/* Valores Distintos - DISTINCT */

SELECT DISTINCT bairro            
FROM ALUNO

/* Concatenando Linhas - ||  */

SELECT nome,
       cep || ' ' || 
       cidade || ' ' || 
       bairro || ' ' ||       
       endereco "Endereço Completo"
FROM ALUNO

/* Usando Operadores Aristméticas */

DESC FREQUENTA
SELECT * FROM FREQUENTA

SELECT  matricula, 
        codTurma AS "Codigo da turma", 
        nota "Nota anterior",
        nota + 0.5 "Nota com acrescimo"
FROM FREQUENTA

/* Valores Nulos - NULL */

INSERT INTO ALUNO 
VALUES('UC12005210','Carla Moraes','F', '74990185048',429434321,'22/10/1991',NULL, NULL,NULL ,NULL);
INSERT INTO ALUNO 
VALUES ('UC12013217','Claudio Manuel','M', '13071759029',955871329,'05/07/1987',NULL, NULL,NULL ,NULL);

INSERT INTO 
FREQUENTA VALUES ('UC12005210','T01',7.0,0,1,2012); 

SELECT * FROM ALUNO

/* 

EXERCÍCIOS 

1 - O gestor da universidade deseja ter uma visão geral de todos os alunos matriculados.

Por isso contratou você para montar uma consulta, que traga todos os alunos matriculados.

Verifique a tabela chamada 'ALUNO' do esquema.

*/ 

SELECT * FROM ALUNO

/*

2 - É necessário criar uma consulta que traga para cada aluno: matrícula, código da turma

em que ele está matriculado, nota, quantidade de faltas e semestre. Para ficar mais clara

a informação, no cabeçalho da tabela deve aparecer 'código da turma' para codTurma e

'Qtde de faltas' para faltas. Dica: use ALIAS e consulte a tabela 'FREQUENTA'

*/

SELECT * FROM FREQUENTA

SELECT matricula,
       codTurma "Código da turma",
       nota,
       falta "Qtde de faltas",
       semestre
FROM FREQUENTA

/*

3 - Crie um relatório na forma de consulta que traga os seguintes dados: nome, sexo,

cidade, bairro, CEP e endereço de cada aluno. Os campos cidade, bairro, CEP e endereço

devem ser exibidos como uma única coluna no resultado, separados por * e espaco para cada informação.

Dica: Use a tabela 'ALUNO' e operadores de CONCATENAÇÃO.

Ex: Carlos 'M' Brasilia * TagSul * 72025650 * QSF 15 CASA 109.

*/

SELECT * FROM ALUNO

SELECT nome,
       sexo,
       cidade || ' * ' ||
       bairro || ' * ' ||
       cep || ' * ' ||
       endereco "Endereço Completo"
FROM ALUNO

/*

4 - Exiba todos os registros da tabela turma excluindo a repetição do turno.

*/

SELECT * FROM TURMA

SELECT DISTINCT turno
FROM TURMA

/*

5 - Crie um consulta que traga uma nova nota para os alunos: isso é, subtraindo o valor de 1.0 ponto.

Dica: use a tabela FREQUENTA. Exiba tanto a nova antiga como a nova nota.

*/

SELECT * FROM FREQUENTA

SELECT matricula,
       nota "Nota antiga",
       nota - 1.0 "Nova nota"
FROM FREQUENTA

/* WHERE */

SELECT * 
FROM ALUNO
WHERE sexo = 'M'

SELECT * 
FROM FREQUENTA
WHERE nota >= 8.0

SELECT * 
FROM FREQUENTA -- 78 linhas
WHERE falta != 0 -- 26 linhas

SELECT * 
FROM FREQUENTA -- 78 linhas
WHERE nota 
BETWEEN 7 AND 9 -- 49 linhas

SELECT * 
FROM FREQUENTA -- 78 linhas
WHERE nota 
IN (7,8,9) -- 15 linhas

SELECT * 
FROM ALUNO
WHERE cpf LIKE '%6'

SELECT * 
FROM ALUNO
WHERE nome LIKE 'A%'

SELECT * 
FROM ALUNO
WHERE nome LIKE '____Sampaio'

SELECT * 
FROM ALUNO
WHERE cidade IS NULL

SELECT * 
FROM ALUNO
WHERE cidade IS NOT NULL

SELECT * 
FROM ALUNO
WHERE sexo = 'M'
AND bairro = 'Asa Norte'

SELECT * 
FROM ALUNO
WHERE bairro = 'Asa Norte'
OR bairro = 'Aguas Claras'

SELECT * 
FROM ALUNO
WHERE NOT (bairro = 'Asa Norte'
OR bairro = 'Aguas Claras')

/* Exercício 1

- Consulte todos os alunos que sejam do sexo masculino e que moram na Asa Norte

- Na tabela como resultado nomeie o atributo 'nome' para 'Nome Completo' e 'bairro' para 'Onde Mora'

*/

SELECT nome "Nome Completo",
       bairro "Onde Mora"
FROM ALUNO
WHERE sexo = 'M'
AND bairro = 'Asa Norte'

/* Exercício 2

Usando a tabela FREQUENTA traga todas as notas no intervalo de 8 e 9

e que o número de faltas seja superior ou igual a 2

*/

SELECT * 
FROM FREQUENTA
WHERE nota
BETWEEN 8 AND 9
AND falta >= 2

/*

Exercício 3

Traga todos os alunos que a primeira letra do nome começa com a letra 'C'

e que a cidade seja existente (diferente do valor NULL).

Ordene o resultado em ordem crescente. Dica: pesquise o comando ORDER BY.

*/


SELECT *
FROM ALUNO
WHERE nome LIKE 'C%'
AND cidade IS NOT NULL
ORDER BY nome ASC

/*

Exercício 4

Traga todos os alunos que não estão reprovados (nota >= 7, E faltas não superior ou igual a 4)

Use a tabela FREQUENTA

*/

SELECT *
FROM FREQUENTA
WHERE nota >= 7
AND falta < 4

/*

Exercício 5

Traga todos os alunos que estão reprovados (nota < 7 ou faltas superior ou igual a 4)

Use a tabela FREQUENTA

*/

SELECT *
FROM FREQUENTA
WHERE NOT (nota >= 7
AND falta < 4)

SELECT *
FROM FREQUENTA
WHERE nota < 7
OR falta >= 4

/* ORDEM - ORDER BY  */

SELECT *
FROM ALUNO
ORDER BY nome ASC

SELECT *
FROM ALUNO
ORDER BY nome DESC

SELECT *
FROM ALUNO
ORDER BY nome, bairro ASC -- Caso o valor (Nome) seja igual, será considerado o valor do segundo parametro (bairro) para efetuar a ordernação

/* 

Exercício 1

- Consulte todos os professores que trabalham na universidade em que a especialidade seja 'Matematica',

'Literatura'. Ordene (na forma CRESCENTE) pelo nome do professor.

Use a tabela PROFESSOR.

*/

SELECT * 
FROM PROFESSOR
WHERE especialidade
IN ('Matematica', 'Literatura')
ORDER BY nome


/*

Exercício 2

- Consulta todas as notas dos alunos

Ordene o resultado pela nota na forma DECRESCENTE.

*/

SELECT nota 
FROM  FREQUENTA
ORDER BY nota DESC

/*

Exercício 3

- Traga todas as especialidades dos professores (não repita os resultados)

Dica: use o operador DISTINCT e a tabela PROFESSOR.

*/

SELECT DISTINCT especialidade 
FROM  PROFESSOR


/* Funções de Agrupamento */

SELECT MIN(nota, MAX(nota)
FROM FREQUENTA

SELECT MIN(datanascimento), MAX(datanascimento)
FROM ALUNO

SELECT MIN(nome), MAX(nome)
FROM ALUNO

SELECT COUNT(*)
FROM ALUNO

SELECT AVG(nota)
FROM FREQUENTA

SELECT SUM(nota)
FROM FREQUENTA

/* 

Exercício 1

- Traga numa consulta:

1. A nota máxima

2. A nota mínima

3. A quantidade de faltas de todos os alunos

4. A média aritmética das notas

5. O somatório das notas

*/

SELECT MAX(nota),
       MIN(nota),
       COUNT(falta),
       AVG(nota),
       SUM(nota)
FROM FREQUENTA

/*

Exercício 2

- Há um problema nesse comando abaixo. Encontre o erro e corrija.

SELECT falta, COUNT(falta) FROM FREQUENTA

*/

SELECT COUNT(falta) 
FROM FREQUENTA

/*

Exercício 3

- Descubra o professor mais velho e mais novo da universidade.

Use a tabela PROFESSOR.

*/

SELECT MAX(datanascimento), MIN(datanascimento)
FROM PROFESSOR


/* Agrupando Dados - GROUP BY */

SELECT codTurma "Codigo da Turma", 
       TO_CHAR(AVG(nota), '99.9') "Média da Nota"
FROM FREQUENTA
GROUP BY codTurma

SELECT cidade, bairro, 
       COUNT(nome)
FROM ALUNO
WHERE bairro IS NOT NULL
GROUP BY cidade, bairro
HAVING bairro LIKE '%Sul'
ORDER BY bairro DESC

/*

Exercício 1

- Traga numa consulta:

1. A quantidade de professores que estuda em cada faculdade - através de agrupamento.

2. Nomeie as colunas de resultado usando 'ALIAS' para: 'Faculdade de Formação' e 'Qtde professores'

3. Ordene em ORDEM CRESCENTE pelo nome da faculdade

Ex:

Faculdade de Formação       | Quantidade

Universidade de Brasilia      2

*/

SELECT nomeFaculdadeFormacao "Faculdade e Formação",
       COUNT(nome) "Qtde Professores"
FROM PROFESSOR
GROUP BY nomeFaculdadeFormacao
ORDER BY nomeFaculdadeFormacao

/*

Exercício 2

- Usando o exercício 1 como exemplo, agrupe também pelo sexo.

Ex:

Faculdade de Formação       | Sexo | Quantidade

Universidade de Brasilia      M       2

*/


SELECT nomeFaculdadeFormacao "Faculdade e Formação", 
       sexo,
       COUNT(nome) "Qtde Professores"
FROM PROFESSOR
GROUP BY nomeFaculdadeFormacao, sexo
ORDER BY nomeFaculdadeFormacao

/*

Exercício 3

- Descubra o erro no comando abaixo

SELECT especialidade,nomefaculdadeformacao

FROM PROFESSOR

GROUP BY especialidade

*/

SELECT especialidade, nomefaculdadeformacao
FROM PROFESSOR
GROUP BY especialidade, nomefaculdadeformacao


 /* Função de Conversão ---------------------------------------------------------------------------------------------------- */
 -- TO_CHAR: Converte dados para caracter

SELECT nome,
       datanascimento
FROM ALUNO
WHERE TO_CHAR(datanascimento, 'YYYY') = '1990' 

SELECT TO_CHAR(SYSDATE, 'DD-MM-YYYY HH24:MI MONTH DAY')
FROM DUAL

SELECT TO_CHAR(AVG(nota), '0.0') "Média da Nota"
FROM FREQUENTA

-- TO_DATE: Converte dados para Data

SELECT nome,
       datanascimento
FROM ALUNO
WHERE datanascimento >= TO_DATE('Jul 01, 1990', 'mon DD, YYYY')
ORDER BY datanascimento

-- NVL: Converte valores nulos. NVL(valorPadrao, NovoValor (Caso seja Nulo))

INSERT INTO frequenta VALUES ('UC12004127','T04',null,null,1,2012)
INSERT INTO frequenta VALUES ('UC12004127','T05',null,null,1,2012)

SELECT matricula,
        NVL(nota, 0),
        NVL(nota + 1, 0) 
FROM FREQUENTA

/*
Exercício 1

- Traga numa consulta:

1. Todos alunos que nasceram exatamente no ano de 1990.

2. Conte a quantidade de alunos: o sexo MASCULINO e do sexo FEMININO.

*/

SELECT nome,
       datanascimento
FROM ALUNO
WHERE TO_CHAR(datanascimento, 'YYYY') = '1990'
GROUP BY nome, datanascimento


SELECT sexo,
       COUNT(sexo)
FROM ALUNO
WHERE TO_CHAR(datanascimento, 'YYYY') = '1990'
GROUP BY sexo

/*

Exercício 2

-  Traga todos os professores que estudam na Universidade Catolica de Brasilia ou Universidade Caxias.

-  Ordene o resultado em ordem DECRESCENTE pelo nome do professor.

*/

SELECT *
FROM PROFESSOR
WHERE nomefaculdadeformacao
IN('Universidade Catolica de Brasilia', 'Universidade Caxias do Sul')
ORDER BY nome DESC


/* FUNÇÕES DE STRING */

-- UPPER: Converte as string em maiusculo

SELECT 'Meu nome é Douglas',
UPPER('Meu nome é Douglas')
FROM DUAL

-- LOWER: Converte as string em minusculo

SELECT 'Meu nome é Douglas',
LOWER('Meu nome é Douglas')
FROM DUAL

-- INITCAP: Converte a primeira letra string em maiusculo

SELECT 'meu nome é douglas',
INITCAP('meu nome é douglas')
FROM DUAL

-- LENGTH: Conta o numero de caracter tem em uma string

SELECT
LENGTH('meu nome é Douglas')
FROM DUAL


-- SUBSTR: Exibe a string após a posição definida como segundo parametro

SELECT 'meu nome é douglas',
SUBSTR('meu nome é douglas', 4)
FROM DUAL

-- TRIM: Remover todos os espaços no inicio e no final da string

SELECT '     meu nome é douglas     ',
TRIM('    meu nome é douglas    ')
FROM DUAL

-- TRIM: Exibe a posição que encontra-se a string definida como segundo parametro

SELECT 'meu nome é douglas',
INSTR('meu nome é douglas', 'u')
FROM DUAL

-- REPLACE: Substitui uma string por outra string

SELECT 'meu nome é douglas',
REPLACE('meu nome é douglas', 'e', '*')
FROM DUAL

-- LPAD: Função para completar string com qualquer caracter do lado esquerdo
-- RPAD: Função para completar string com qualquer caracter do lado Direito


SELECT 'meu nome é douglas',
LPAD('meu nome é douglas', 40, '*')
FROM DUAL

SELECT 'meu nome é douglas',
RPAD('meu nome é douglas', 40, '*')
FROM DUAL

/*
Exercício 1

- Traga numa consulta:

1. Quantidade de pessoas em cada bairro.

2. Os nomes dos bairros devem estar com todas letras MAIÚSCULAS.

3. Valores NULOS no bairro devem ser DESCONSIDERADOS.

4. Ordene (de forma CRESCENTE) pelo bairro.

*/

SELECT UPPER(bairro),
       count(nome)"Qtde Pessoas"
FROM ALUNO
WHERE bairro IS NOT NULL
GROUP BY bairro
ORDER BY bairro

/*

Exercício 2

- Calcule e traga a idade de todos os professores.

- No resultado deve ser tragos: nome, sexo e por idade do professor calculada.

- Use um ALIAS para a coluna idade calculada: 'idade'

- Substitua os espaços entre os nomes por *.

*/

SELECT REPLACE(nome, ' ', '*') "Nome",
       sexo,
       TO_CHAR(SYSDATE, 'YYYY') - TO_CHAR(datanascimento, 'YYYY') AS "Idade" 
FROM PROFESSOR


/* JOIN: União de duas ou mais tabelas -------------------------------------------------------------------------*/

SELECT A.matricula,
       A.nome,       
       F.codturma,
       F.nota,
       F.falta,
       F.semestre,
       F.ano
FROM ALUNO A
INNER JOIN FREQUENTA F
ON A.matricula = F.matricula

SELECT matricula,
       nome,       
       codturma
FROM ALUNO
NATURAL JOIN FREQUENTA

SELECT A.matricula,
       A.nome,       
       F.codturma
FROM ALUNO A
LEFT JOIN FREQUENTA F
ON A.matricula = F.matricula

SELECT A.matricula,
       A.nome,       
       F.codturma
FROM ALUNO A
CROSS JOIN FREQUENTA F


/*
Exercício 1

- Traga numa consulta:

1. A turma em que cada professor ensina. Para TURMA use: codTurma, nomeTurma, turno.

2. A disciplina de cada turma vinculada. Para DISCIPLINA use: codDisciplina, nomeDisciplina.

3. Para professor traga as seguintes informações: matrícula, nome, especialidade.

*/

SELECT P.matricula,
       P.nome,       
       P.especialidade,
       T.codturma,
       T.nometurma,
       T.turno,
       D.codDisciplina,
       D.nomeDisciplina       
FROM PROFESSOR P, ENSINA E, TURMA T, DISCIPLINA D
WHERE P.matricula = E.matricula
AND E.codTurma = T.codTurma
AND T.codDisciplina = D.codDisciplina

SELECT P.matricula,
       P.nome,       
       P.especialidade,
       T.codturma,
       T.nometurma,
       T.turno,
       D.codDisciplina,
       D.nomeDisciplina       
FROM PROFESSOR P
INNER JOIN ENSINA E
ON P.matricula = E.matricula
INNER JOIN TURMA T
ON E.codTurma = T.codTurma
INNER JOIN DISCIPLINA D
ON T.codDisciplina = D.codDisciplina



SELECT * FROM PROFESSOR
SELECT * FROM ENSINA
SELECT * FROM DISCIPLINA
SELECT * FROM TURMA
DESC XE
/*

Exercício 2

- Conte a quantidade de turmas em que cada professor leciona.

- Ex: professor x - total: 10 turmas

1. Para professor traga: nome

2. Para turma traga: quantidade.

3. Adicione o critério: a quantidade de turma na consulta deve ser maior que 1.

4. Ordene de forma CRESCENTE pela quantidade.

5. Use um ALIAS: Quantidade de Turmas

*/

SELECT P.nome,
       COUNT(T.codturma) "Quantidade de Turma"
FROM PROFESSOR P
INNER JOIN ENSINA E
ON P.matricula = E.matricula
INNER JOIN TURMA T
ON E.codturma = T.codturma
INNER JOIN DISCIPLINA D
ON T.coddisciplina = D.coddisciplina
GROUP BY P.nome
HAVING COUNT(T.codturma) > 1
ORDER BY COUNT(T.codturma)

/*

Exercício 3

- Monte um relatório que mostre:

1. Matricula do aluno, nome do aluno.

2. Todas as turmas que ele está matriculado. Para turma use: codTurma, nomeTurma.

3. O nome e a matrícula dos professores que lecionam essas turmas.

*/

SELECT A.matricula "Matr Aluno",
       A.nome "Auno",
       T.codTurma,
       T.nomeTurma,
       P.nome "Professor",
       P.matricula "Matr Professor"
FROM ALUNO A
INNER JOIN FREQUENTA F
ON A.matricula = F.matricula
INNER JOIN TURMA T
ON F.codTurma = T.codTurma
INNER JOIN ENSINA E
ON T.codTurma = E.codTurma
INNER JOIN PROFESSOR P
ON E.matricula = P.matricula


/*

Exercício 4

- Qual erro do comando abaixo?

SELECT matricula, nome, codTurma, matricula

FROM ALUNO, FREQUENTA

WHERE matricula = matricula

*/

SELECT A.matricula, A.nome, F.codTurma, F.matricula
FROM ALUNO A, FREQUENTA F
WHERE A.matricula = F.matricula

/*

Exercício 5

- Através de uma consulta responda: existe algum PROFESSOR que também é ALUNO?

Use o identificador 'matricula' para saber.

*/

SELECT A.matricula "Matr Aluno",
       A.nome "Auno",
       P.nome "Professor",
       P.matricula "Matr Professor"
FROM ALUNO A
INNER JOIN FREQUENTA F
ON A.matricula = F.matricula
INNER JOIN TURMA T
ON F.codTurma = T.codTurma
INNER JOIN ENSINA E
ON T.codTurma = E.codTurma
INNER JOIN PROFESSOR P
ON E.matricula = P.matricula
WHERE A.matricula = P.matricula

/*

Exercício 6

Encontre a média aritmética da turma T04 de matematica discreta.

Veja a TABELA 'DISCIPLINA'.

*/

SELECT AVG(nota)"Média"
FROM ALUNO A
INNER JOIN FREQUENTA F
ON A.matricula = F.matricula
INNER JOIN TURMA T
ON F.codTurma = T.codTurma
INNER JOIN DISCIPLINA D
ON T.codDisciplina = D.codDisciplina
WHERE T.codTurma = 'T04'



/*

Exercício 7

- Encontre quantos alunos cursam a matéria de 'logica matematica'

*/

SELECT D.nomeDisciplina,
       COUNT(A.nome) "Quantidade de Alunos"       
FROM ALUNO A
INNER JOIN FREQUENTA F
ON A.matricula = F.matricula
INNER JOIN TURMA T
ON F.codTurma = T.codTurma
INNER JOIN DISCIPLINA D
ON T.codDisciplina = D.codDisciplina
WHERE D.nomeDisciplina = 'Logica Matematica'
GROUP BY D.nomeDisciplina

/* COMANDO DELETE -----------------------------------------   */

DELETE
FROM ALUNO
WHERE matricula = 'UC12013258'

/* COMANDO UPDATE -----------------------------------------   */

UPDATE ALUNO
SET nome = 'Douglas Santiago'
WHERE matricula = 'UC12013217'

SELECT *
FROM ALUNO
WHERE matricula = 'UC12013217'

/*
Considerando o modelo que foi trabalhando no decorrer do curso, monte uma consulta que contemple o espelho de matérias de TODOS OS ALUNO DO SEXO MASCULINO.

1.  Matrícula, nome completo de aluno.

2. Nome da disciplina, código da turma e respectivo turno, nome do professor que ensina.

3. Ordene em ORDEM ALFABÉTICA (CRESCENTE) pelo nome do aluno.

4. Use um ALIAS para o nome do professor renomeando para: 'nome do professor' no cabeçalho de resultados.

*/
SELECT A.matricula,
       A.nome "Nome Completo",
       D.nomeDisciplina,
       T.codTurma,
       T.turno,
       P.nome "Nome do Professor"       
FROM ALUNO A
INNER JOIN FREQUENTA F
ON A.matricula = F.matricula
INNER JOIN TURMA T
ON F.codTurma = T.codTurma
INNER JOIN DISCIPLINA D
ON T.codDisciplina = D.codDisciplina
INNER JOIN ENSINA E
ON T.codTurma = E.codTurma
INNER JOIN PROFESSOR P
ON E.matricula = P.matricula
WHERE A.sexo = 'M'
ORDER BY A.nome
