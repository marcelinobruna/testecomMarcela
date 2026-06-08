create database desenvolvimento;

use desenvolvimento;

CREATE TABLE usuario(
idUsuario INT PRIMARY KEY auto_increment, -- ADD pk OK
nome VARCHAR(60) NOT NULL,
cpf CHAR(11) NOT NULL UNIQUE,
email VARCHAR(40) NOT NULL,
senha VARCHAR(30) NOT NULL,
telefone CHAR(11) NOT NULL,
fkEmpresa INT,
CONSTRAINT fkUsuarioEmpresa 
	FOREIGN KEY (fkEmpresa) 	
		REFERENCES empresa(id)
);

drop table usuario;


select * from usuario;

desc usuario;

CREATE TABLE empresa (
	id INT PRIMARY KEY AUTO_INCREMENT,
	razao_social VARCHAR(50),
	cnpj CHAR(14),
	codigo_ativacao VARCHAR(50)
);

insert into empresa (razao_social, codigo_ativacao) values ('Empresa 1', 'ED145B');
insert into empresa (razao_social, codigo_ativacao) values ('Empresa 2', 'A1B2C3');

-- mediana da umidade
SELECT 
    c.fkSensor AS idSensor,
    s.codigoRastreio,
    MAX(c.umidade) AS maior_umidade
FROM captura c
JOIN sensor s ON c.fkSensor = s.idSensor
WHERE c.umidade IS NOT NULL
GROUP BY c.fkSensor, s.codigoRastreio
ORDER BY maior_umidade DESC;

SELECT 
    DATE(dtCaptura) AS dia,
    MAX(umidade) AS umidade_maxima,
    MIN(umidade) AS umidade_minima,
    ROUND(AVG(umidade), 2) AS umidade_mediana_aprox -- Média aritmética simulando a mediana para o gráfico
FROM captura
WHERE fkSensor = 1 -- Filtro para o Sensor 1 selecionado na tela
  AND umidade IS NOT NULL
GROUP BY DATE(dtCaptura)
ORDER BY dia ASC;