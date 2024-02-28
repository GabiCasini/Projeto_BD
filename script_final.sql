create schema escola;

use escola;

#criando as tabelas
CREATE TABLE cidade (
CodCidade char(10) NOT NULL,
NomeCidade varchar(50) ,
PRIMARY KEY (CodCidade)
);

CREATE TABLE disciplina (
CodDis char(10) NOT NULL,
NomeDis varchar(50),
PRIMARY KEY (CodDis)
);

CREATE TABLE pessoa (
CodPessoa char(10) NOT NULL,
NomePessoa varchar(50),
TelPessoa numeric(11),
CodCidade char(10) NOT NULL,
PRIMARY KEY (CodPessoa),
FOREIGN KEY (CodCidade) REFERENCES cidade (CodCidade)
);

CREATE TABLE professor (
CodPessoa char(10) NOT NULL,
RG char(9) NOT NULL,
CPF char(11) NOT NULL,
Titulacao varchar(50),
PRIMARY KEY (CodPessoa),
FOREIGN KEY (CodPessoa) REFERENCES pessoa(CodPessoa),
UNIQUE KEY (RG),
UNIQUE KEY (CPF)
);

CREATE TABLE escola (
CodEscola char(10) NOT NULL,
NomeEsc varchar(50),
CodCidade char(10),
CodPessoa char(10) NOT NULL,
PRIMARY KEY (CodEscola),
FOREIGN KEY (CodPessoa) REFERENCES professor(CodPessoa),
FOREIGN KEY (CodCidade) REFERENCES cidade(CodCidade)
);

CREATE TABLE ministra(
CodPessoa char(10) NOT NULL,
CodDis char(10) NOT NULL,
PRIMARY KEY (CodPessoa, CodDis),
FOREIGN KEY (CodPessoa) REFERENCES professor(CodPessoa),
FOREIGN KEY (CodDis) REFERENCES disciplina(CodDis)
);

CREATE TABLE turma (
CodTurma char(10) NOT NULL,
NomeTurma varchar(50),
CodEscola char(10) NOT NULL,
PRIMARY KEY (CodTurma),
FOREIGN KEY (CodEscola) REFERENCES escola(CodEscola)
);

CREATE TABLE ministraturma (
CodTurma char(10) NOT NULL,
CodPessoa char(10) NOT NULL,
CodDis char(10) NOT NULL,
PRIMARY KEY (CodTurma, CodPessoa, CodDis),
FOREIGN KEY (CodTurma) REFERENCES turma(CodTurma),
FOREIGN KEY (CodPessoa, CodDis) REFERENCES ministra(CodPessoa, CodDis)
);

CREATE TABLE aluno (
CodPessoa char(10) NOT NULL,
MatAluno char(9) NOT NULL,
DataNas date,
CodTurma char(10),
PRIMARY KEY (CodPessoa),
FOREIGN KEY (CodPessoa) REFERENCES pessoa(CodPessoa),
FOREIGN KEY (CodTurma) REFERENCES turma(CodTurma),
UNIQUE KEY (MatAluno)
);

CREATE TABLE Contato (
NomeCont varchar(50) NOT NULL,
TelCont numeric(11),
CodPessoa char(10) NOT NULL,
PRIMARY KEY (NomeCont, CodPessoa),
FOREIGN KEY (CodPessoa) REFERENCES aluno(CodPessoa)
);

#populando as tabelas
INSERT INTO cidade(CodCidade, NomeCidade) VALUES ('01', 'Niteroi'), ('02', 'Rio de Janeiro'), ('03', 'São Paulo'),
('04', 'Campinas'), ('05', 'Curitiba'), ('06', 'Porto Alegre'), ('07', 'Salvador'), ('08', 'João Pessoa'), ('09', 'Brasilia'), ('10', 'Goiania');

INSERT INTO disciplina(CodDis, NomeDis) VALUES ('01', 'Lógica'), ('02', 'Estrutura de Dados'), ('03', 'POO'), ('04', 'Cálculo'), ('05', 'Geometria'), 
('06', 'Engenharia de Software'), ('07', 'Matlab'), ('08', 'Inteligêcia Artificial'), ('09', 'Dev Web'), ('10', 'Compiladores');

INSERT INTO pessoa(CodPessoa, NomePessoa, TelPessoa, CodCidade) VALUES 
('01', 'João da Silva', 32989671511, '01'), ('02', 'Maria Santos', 89975610467, '01'), ('03', 'Luiz Oliveira', 44989589099, '01'),
('04', 'Ana Pereira', 88979576434, '01'), ('05', 'Pedro Souza', 71976715313, '10'), 

('06', 'Carla Santos', 93989712277, '02'), ('07', 'Fernando Lima', 66974615726, '02'), ('08', 'Gabriela Ferreira', 87979545284, '02'), 
('09', 'Marcelo Barbosa', 96984128174 , '05'), ('10', 'Renata Alves', 28998595514, '02'), 

('11', 'Ana Pereira', NULL, '03'), ('12', 'Luiz Oliveira', 96979822540, '03'), ('13', 'Patrícia Santos', NULL, '03'), 
('14', 'Ricardo Santosa', NULL , '03'), ('15', 'Renata Alves', 82976298374 , '03'), 

('16', 'Fernando Lima', 85994287908 , '04'), ('17', 'Pedro Souza', NULL, '04'), ('18', 'Lúcia Oliveira', 69998812585, '04'), 
('19', 'Adriana Pereira', NULL, '04'), ('20', 'Marcela Costa', 32974329853, '04'), 

('21', 'Felipe Rodrigues', 55979619326, '05'), ('22', 'Mariana Costa', 64971437564, '10'), ('23', 'André Fernandes', NULL, '05'), 
('24', 'Isabela Almeida', 61985772366, '05'), ('25', 'Gustavo Moreira', 99997645574, '05'), 

('26', 'Carlos Torres', NULL, '06'), ('27', 'Isabela Costa', NULL, '06'), ('28', 'Marcela Oliveira', NULL, '06'), 
('29', 'Rafael Souza', 69988788389, '06'), ('30', 'Fernanda Martins', 66986496089, '06'), 

('31', 'Patrícia Santos', NULL, '07'), ('32', 'Marcos Silva', 92985802435, '10'), ('33', 'Jéssica Oliveira', 64991677756, '07'), 
('34', 'Anderson Ferreira', NULL, '07'), ('35', 'Fernanda Costa', NULL, '07'), 

('36', 'Ana Luiza Costa', 27973149365 , '08'), ('37', 'Rafael Pereira', 47996936138, '08'), ('38', 'Juliana Oliveira', NULL, '08'), 
('39', 'Marcelo Silva', 85969678523, '08'), ('40', 'Camila Santos', 65996299880, '08'), 

('41', 'Rafaela Oliveira', NULL, '10'), ('42', 'Marcos Santos', 48981945645, '09'), ('43', 'Juliana Pereira', NULL, '09'), 
('44', 'Felipe Lima', NULL, '09'), ('45', 'Isabela Souza', 83999927382, '09'), 

('46', 'Mariana Silva', 63991267848, '10'), ('47', 'Fernanda Oliveira', 83996721311, '10'), ('48', 'Rodrigo Santos', 97987722566, '10'), 
('49', 'Rafaela Pereira', NULL, '10'), ('50', 'Anderson Souza', NULL, '10');

INSERT INTO professor(CodPessoa, RG, CPF, Titulacao) VALUES 
('42','424715548','68163113960','Doutor'), ('31','228288510','78645470950','Mestre'), ('29','184254548','46814815303','Mestre'),
('24','335218145','15743356505','Doutor'), ('39','106825557','71382643640','Doutor'), ('10','487656266','61501757318','Mestre'),
('09','266981224','42768286192','Doutor'),('17','123717209','40718383613','Doutor'),('25','383304235','20253379300','Mestre'),
('23','153266747','20747233420','Doutor');

INSERT INTO escola(CodEscola, NomeEsc, CodCidade, CodPessoa) VALUES
('1','Escola Primavera','07','31'),('2','Colégio Aurora','02','39'),('3','Instituto da Felicidade','05','09'),('4','Escola Monte Verde','10','17'); 

INSERT INTO ministra(CodPessoa, CodDis) VALUES
('31','04'), ('31','05'), ('39','05'), ('09','03'),('09','02'), ('17','08'), ('24','09'),
('42','01'), ('29','07'), ('29','03'), ('10','02'), ('23','06'), ('23','09'), ('25','10'), ('25','02');

INSERT INTO turma(CodTurma, NomeTurma, CodEscola) VALUES
('1','TurmaA','1'), ('2','TurmaB','1'),('3','TurmaC','1'), ('4','TurmaAA','2'), ('5','TurmaBB','2'), ('6','Turma200','3'),('7','TurmaA1','4');

INSERT INTO ministraturma(CodTurma, CodPessoa, CodDis) VALUES
('1','29','07'),('2','29','07'),('3','29','07'),('1','09','03'),('1','09','02'),('4','42','01'),
('4','31','05'),('4','17','08'),('5','10','02'),('5','39','05'),('6','23','06'),('6','31','04'),('4','23','09'),('5','23','09'),('7','25','10');

INSERT INTO aluno(CodPessoa, MatAluno, DataNas, CodTurma) VALUES
('43','605874231', '2008-06-14', '1'),('36','392148670', '2007-09-23', '1'),('12','817962304', '2007-07-04', '1'),('27','503186729', '2008-02-12', '1'),
('01','948507216', '2008-05-30', '1'),('04','726014983', '2007-12-18', '1'),('46','139245860', '2007-10-07', '2'),('38','684395702', '2008-01-29', '2'),
('30','270836415', '2008-03-17', '2'),('06','547019283', '2008-04-21', '2'),('34','396245870', '2007-08-09', '2'),('50','820467139', '2007-11-26', '2'),
('33','194768520', '2008-02-01', '3'),('18','637982041', '2007-10-12', '3'),('19','572160394', '2008-04-09', '3'),('21','218456709', '2008-06-27', '3'),
('26','937051682', '2007-08-26', '3'),('28','486213597', '2008-02-05', '3'),('35','365084912', '2007-06-29', '4'),('13','793621480', '2008-05-18', '4'),
('02','412970835', '2007-11-11', '4'),('14','058123976', '2007-07-17', '4'),('07','672459013', '2007-09-04', '4'),('37','803746129', '2008-01-07', '4'),
('15','259134608', '2008-03-05', '5'),('08','691287045', '2008-03-27', '5'),('44','041932876', '2007-12-05', '5'),('45','530769124', '2007-06-07', '5'),
('16','719248305', '2008-01-15', '5'),('20','467850132', '2008-05-03', '5'),('47','936074218', '2007-10-23', '6'),('49','174620389', '2008-04-02', '6'),
('03','320819647', '2008-06-06', '6'),('11','845063791', '2007-08-20', '6'),('40','286510734', '2007-08-02', '6'),('48','109472658', '2008-04-30', '6'),
('22','674391205', '2007-07-30', '7'),('05','593702148', '2008-02-18', '7'),('32','427586913', '2008-02-23', '7'),('41','685093274', '2007-09-10', '7');
 
INSERT INTO contato(NomeCont, TelCont, CodPessoa) VALUES
('Marcelo da Silva',96969967774,'05'),('Ana Souza',61974328324,'07'),('Felipe Santos',48996562373,'14'),('Raquel Pereira',71986276403,'32'),
('Gustavo Oliveira',27994588057,'11'),('Juliana Costa',64989216230,'46'),('André Barbosa',27984181774,'02'),('Bruna Almeida',68981055581,'19'),
('Lucas Rodrigues',63991265530,'06'),('Camila Fernandes',55984132691,'12'),('Thiago Gomes',81991308412,'36'),('Amanda Lima',51994871418,'33'),
('Rafael Menezes',85967760126,'16'),('Larissa Cardoso',71971160105,'35'),('Eduardo Nunes',82998581424,'04'),('Renata Ferreira',95973124865,'13'),
('Marcos Rocha',55981481318,'30'),('Jéssica Ribeiro',96980648189,'28'),('Leandro Barbosa',47968983294,'03'),('Isabela Carvalho',87983089471,'08');

#consultas
#Q1
SELECT NomeEsc, NomeCidade
FROM ESCOLA e, CIDADE c
WHERE e.CodCidade = c.CodCidade and not exists(
	SELECT *
    FROM Aluno a
    JOIN PESSOA p ON a.CodPessoa = p.CodPessoa
    WHERE e.CodCidade != p.CodCidade and a.CodTurma in (Select t.Codturma From turma t Where e.CodEscola = t.CodEscola) 
    #Escola e pessoa fiquem em lugares diferentes e aluno pertença a uma turma dessa escola
    );
    
#Q2
SELECT NomePessoa, MatAluno 
FROM aluno a, pessoa p
WHERE p.CodPessoa = a.CodPessoa AND NOT EXISTS (SELECT * FROM contato c WHERE a.CodPessoa = c.CodPessoa);

#Q3
SELECT NomeTurma, CodTurma
from turma
where Codturma in (select CodTurma FROM aluno group by CodTurma having count(CodPessoa)> 5); 

#Q4 
select NomePessoa, p.CodPessoa, Titulacao
from pessoa, professor p
where p.CodPessoa in (select p.CodPessoa 
					  from professor p, ministraturma m 
                      where p.CodPessoa = m.CodPessoa 
                      group by p.CodPessoa 
                      having count(m.CodTurma)>2)
and p.CodPessoa = pessoa.CodPessoa;

#Q5
SELECT d.CodDis, d.NomeDis, count(distinct m.CodPessoa) AS prof_disp, count(distinct mt.CodPessoa) AS prof_efetivo
FROM disciplina d
LEFT JOIN ministra m ON d.CodDis = m.CodDis
LEFT JOIN ministraturma mt ON m.CodPessoa = mt.CodPessoa AND m.CodDis=mt.CodDis
GROUP BY d.CodDis;

#Q6
SELECT e.NomeEsc, p.NomePessoa 
FROM escola e
JOIN cidade c1 ON e.CodCidade = c1.CodCidade
JOIN pessoa p ON e.CodPessoa = p.CodPessoa
JOIN cidade c2 ON p.CodCidade = c2.CodCidade
WHERE c1.CodCidade != c2.CodCidade;

#Q7
SELECT NomeEsc, count(distinct m.CodTurma) AS num_de_turmas, count(p.CodPessoa) AS num_de_profs
from escola e, turma t, professor p, ministraturma m 
where e.CodEscola = t.CodEscola and t.CodTurma = m.CodTurma and p.CodPessoa = m.CodPessoa 
group by NomeEsc
order by num_de_turmas ASC;

#Q8
select NomeEsc, /*count(distinct a.CodPessoa) AS num_de_alunos, count(distinct p.CodPessoa) AS num_de_profs,*/
 count(distinct a.CodPessoa)/count(distinct p.CodPessoa) AS "Razão aluno/professor"
from escola e, aluno a, turma t, professor p, ministraturma m 
where e.CodEscola = t.CodEscola and t.CodTurma = a.CodTurma and t.CodTurma = m.CodTurma and p.CodPessoa = m.CodPessoa
group by NomeEsc;

#Q9
SELECT a.MatAluno as Matricula, p.NomePessoa as Nome, c.NomeCont as "Nome do Contato", c.TelCont as Telefone
FROM Contato c, Aluno a, Pessoa p
WHERE c.CodPessoa = a.CodPessoa  and c.CodPessoa=p.CodPessoa
ORDER BY a.MatAluno, c.NomeCont;

#Q10
SELECT p.CodPessoa as Codigo, p.NomePessoa as Nome
FROM professor 
JOIN pessoa p ON professor.CodPessoa = p.CodPessoa 
JOIN ministraturma m ON m.CodPessoa = professor.CodPessoa
Group by p.NomePessoa, p.CodPessoa
having count(distinct m.Codturma) = 1
order by p.NomePessoa;

#alteracoes 
#Q1
update contato
set CodPessoa = 'codpessoaB' 
where CodPessoa = 'codpessoaA'; 
# transfere o contato da pessoa A para a pessoa B
SELECT * FROM contato ORDER BY CodPessoa;

#Q2
# deseja-se remover um professor A com codpessoaA
# por ordem de dependência
delete from ministraturma
where CodPessoa = 'codpessoaA';    
delete from ministra where CodPessoa = 'codpessoaA';
update escola
set CodPessoa = 'codpessoaB'
where CodPessoa = 'codpessoaA'; 
#caso pessoa A seja diretor, atualiza para pessoa B
delete from professor
where CodPessoa = 'codpessoaA';
delete from pessoa
where CodPessoa = 'codpessoaA'; 
# para remover completamente os dados de pessoa A do banco
select * from professor;

#Q3
# inserindo uma tupla em ministra caso o substituto não lecione todas as disciplinas do antigo
insert into ministra (CodPessoa, CodDis)
select 'codpessoa2', CodDis from ministra 
where CodPessoa = 'codpessoa' and CodDis not in (select CodDis from ministra
												 where CodPessoa = 'codpessoa2');
# aplica a alteração de professores
update ministraturma
set CodPessoa = 'codpessoa2' 
where CodPessoa = 'codpessoa';
# com codpessoa sendo o professor substituido e codpessoa2 o professor substituto
select * from ministraturma;