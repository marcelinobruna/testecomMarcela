	CREATE DATABASE safeControl;
	USE safeControl;

	CREATE TABLE empresa( 
	idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
	razaoSocial VARCHAR(100),
	nomeFantasia VARCHAR(100),
	apelido VARCHAR(60),
	cnpj CHAR(14) NOT NULL UNIQUE,
	codigo_ativacao VARCHAR(50)
	);

	CREATE TABLE usuario(
	idUsuario INT PRIMARY KEY AUTO_INCREMENT, 
	nome VARCHAR(60) NOT NULL,
	cpf CHAR(11) NOT NULL UNIQUE,
	email VARCHAR(40) NOT NULL UNIQUE,
	senha VARCHAR(30) NOT NULL,
	telefone CHAR(11) NOT NULL,
	fkEmpresa INT,
	CONSTRAINT fkUsuarioEmpresa 
		FOREIGN KEY (fkEmpresa) 	
			REFERENCES empresa(idEmpresa)
	);

	CREATE TABLE statusSensor(
	idStatus INT PRIMARY KEY AUTO_INCREMENT,
	descricao varchar(100)
	);

	CREATE TABLE sensor(
	idSensor INT PRIMARY KEY AUTO_INCREMENT,
	codigoRastreio VARCHAR(20) NOT NULL UNIQUE,
	fkStatus INT, 
	CONSTRAINT fkSensorStatus
		FOREIGN KEY (fkStatus) 
			REFERENCES statusSensor(idStatus)
	);

	CREATE TABLE unidadeMedida(
	idUnidade INT PRIMARY KEY,
	simbolo CHAR (2) 
	);

	CREATE TABLE captura(
	idCaptura INT AUTO_INCREMENT,
	temperatura DECIMAL(5,2),
	umidade DECIMAL(5,2),
	fkSensor INT NOT NULL,
	fkUnidadeTemp INT,
	fkUnidadeUmi INT,
	PRIMARY KEY  (idCaptura, fkSensor),
	CONSTRAINT fkCapturaSensor
		FOREIGN KEY (fkSensor) 
			REFERENCES sensor(idSensor),
	CONSTRAINT fkCapturaUnidadeTemp 
		FOREIGN KEY (fkUnidadeTemp)
			REFERENCES unidadeMedida(idUnidade),
	CONSTRAINT fkCapturaUnidadeUmi
		FOREIGN KEY (fkUnidadeUmi)
			REFERENCES unidadeMedida(idUnidade)
	);

	CREATE TABLE endereco(
	idEndereco INT,
	cep CHAR(8) NOT NULL,
	endereco VARCHAR(100) NOT NULL,
	numero INT NOT NULL,
	complemento VARCHAR(20), 
	cidade VARCHAR (30) NOT NULL, 
	UF CHAR (2) NOT NULL,
	fkEmpresa INT UNIQUE,
	CONSTRAINT fkEnderecoEmpresa
		FOREIGN KEY (fkEmpresa) 
			REFERENCES empresa(idEmpresa),
	PRIMARY KEY (fkEmpresa,idEndereco)
	);

	CREATE TABLE transporte(
	idTransporte INT,
	placa VARCHAR(10),
	motorista VARCHAR(60),
	origem VARCHAR(60),
	destino VARCHAR(60),
	dtSaida DATETIME,
	dtChegada DATETIME,
	fkEmpresa INT,
	CONSTRAINT fkTransporteEmpresa
		FOREIGN KEY (fkEmpresa)
			REFERENCES empresa(idEmpresa),
	PRIMARY KEY (idTransporte, fkEmpresa),
	fkSensor INT, 
	CONSTRAINT fkTransporteSensor
		FOREIGN KEY (fkSensor)
			REFERENCES sensor(idSensor)
	);

	INSERT INTO empresa (razaoSocial, nomeFantasia, apelido, cnpj, codigo_ativacao) VALUES
	('JBS S.A.', 'JBS', 'JBS', '12345678000101', 'KW52Q'),
	('Seara Alimentos Ltda', 'Seara', 'Seara', '12345678000102', 'ACY22'),
	('Marfrig Global Foods S.A.', 'Marfrig', 'Marfrig', '12345678000103', 'QW269B'),
	('Minerva S.A.', 'Minerva Foods', 'Minerva', '12345678000104', 'T36NS'),
	('BRF S.A.', 'BRF', 'BRF', '12345678000105', 'R5T3Z'),
	('Frigol S.A.', 'Frigol', 'Frigol', '12345678000106', '4WG63'),
	('Frisa Frigorífico Rio Doce S.A.', 'Frisa', 'Frisa', '12345678000107', 'SE8WE');

	INSERT INTO usuario (idUsuario, nome, cpf, email, senha, telefone, fkEmpresa) VALUES
	(1, 'Arthur Balduino', '11111111101', 'arthur@email.com', '123', '11911111111', 2),
	(2, 'Bruna Martins', '11111111102', 'bruna@email.com', '123', '11922222222', 2),
	(3, 'Gabryel Moura', '11111111103', 'gabryel@email.com', '123', '11933333333',  3),
	(4, 'Leonardo Galfaro', '11111111104', 'leonardo@email.com', '123', '11944444444', 4),
	(5, 'Luiz Neto', '11111111105', 'luiz@email.com', '123', '11955555555', 5),
	(6, 'Marcela Fachim', '11111111106', 'marcela@email.com', '123', '11966666666',6),
	(7, 'Pedro Henrique', '11111111107', 'pedro@email.com', '123', '11977777777', 7);

	INSERT INTO statusSensor (descricao) VALUES
	('Inoperante'),
	('Operante'),
	('Manutenção');

	INSERT INTO sensor (codigoRastreio, fkStatus) VALUES
	('SEN001', 1),
	('SEN002', 2),
	('SEN003', 3),
	('SEN004', 1),
	('SEN005', 2),
	('SEN006', 2),
	('SEN007', 1);

	INSERT INTO unidadeMedida (idUnidade, simbolo) VALUES
	(1, '°C'),
	(2, '%');

	INSERT INTO captura (idCaptura, temperatura, fkUnidadeTemp, umidade, fkUnidadeUmi, fkSensor) VALUES
	(1, null, 1, null, 2, 1),
	(2, -16.50, 1, 55.00, 2, 2),
	(3, 0.00, 1, 65.00, 2, 3),
	(4, 4.50, 1, 70.00, 2, 4),
	(5, null, 1, null, 2, 5),
	(6, -18.00, 1, 50.00, 2, 6),
	(7, 2.00, 1, 45.00, 2, 7);


	INSERT INTO endereco (idEndereco, cep, endereco, numero, complemento, cidade, UF, fkEmpresa) VALUES
	(1, '12000000', 'Rua B', 200, 'Sala 2', 'São Paulo', 'SP', 2),
	(1, '13000000', 'Rua C', 300, NULL, 'Campinas', 'SP', 3),
	(1, '14000000', 'Rua D', 400, 'Bloco A', 'Sorocaba', 'SP', 4),
	(1, '15000000', 'Rua E', 500, NULL, 'Ribeirão Preto', 'SP', 5),
	(1, '16000000', 'Rua F', 600, NULL, 'Bauru', 'SP', 6),
	(1, '17000000', 'Rua G', 700, 'Casa', 'São José', 'SP', 7);

	INSERT INTO transporte (idTransporte, placa, motorista, origem, destino, dtSaida, dtChegada, fkEmpresa, fkSensor) VALUES
	(1, 'AAA1A11', 'Motorista 1', 'Santos', 'SP', '2026-04-17 08:00:00', '2026-04-17 10:00:00', 2, 1),
	(2, 'BBB2B22', 'Motorista 2', 'SP', 'Campinas', '2026-04-17 09:00:00', '2026-04-17 11:00:00', 2, 2),
	(3, 'CCC3C33', 'Motorista 3', 'Campinas', 'Santos', '2026-04-17 10:00:00', '2026-04-17 12:00:00', 3, 3),
	(4, 'DDD4D44', 'Motorista 4', 'RJ', 'SP', '2026-04-17 11:00:00', '2026-04-17 15:00:00', 4, 4),
	(5, 'EEE5E55', 'Motorista 5', 'MG', 'SP', '2026-04-17 12:00:00', '2026-04-17 16:00:00', 5, 5),
	(6, 'FFF6F66', 'Motorista 6', 'PR', 'SP', '2026-04-17 13:00:00', '2026-04-17 17:00:00', 6, 6),
	(7, 'GGG7G77', 'Motorista 7', 'SC', 'SP', '2026-04-17 14:00:00', '2026-04-17 18:00:00', 7, 7);
    
	ALTER TABLE captura ADD COLUMN dtCaptura DATETIME DEFAULT NOW();

	UPDATE captura SET dtCaptura = '2026-04-17 08:00:00' WHERE idCaptura = 1;
	UPDATE captura SET dtCaptura = '2026-04-17 09:00:00' WHERE idCaptura = 2;
	UPDATE captura SET dtCaptura = '2026-04-18 08:00:00' WHERE idCaptura = 3;
	UPDATE captura SET dtCaptura = '2026-04-18 09:00:00' WHERE idCaptura = 4;
	UPDATE captura SET dtCaptura = '2026-04-19 08:00:00' WHERE idCaptura = 5;
	UPDATE captura SET dtCaptura = '2026-04-19 09:00:00' WHERE idCaptura = 6;
	UPDATE captura SET dtCaptura = '2026-04-20 08:00:00' WHERE idCaptura = 7;


	-- kpi Sensores Totais + Ativos
	CREATE VIEW sensoresTotaisAtivos AS SELECT 
		COUNT(DISTINCT s.idSensor) AS totalSensores,
		SUM(CASE WHEN ss.descricao = 'Operante' THEN 1 ELSE 0 END) AS sensoresAtivos
	FROM transporte t
	INNER JOIN sensor s ON s.idSensor = t.fkSensor
	INNER JOIN statusSensor ss ON ss.idStatus = s.fkStatus
	WHERE t.fkEmpresa = (
		SELECT idEmpresa FROM empresa WHERE codigo_ativacao = 'ACY22'
	);

	SELECT * FROM sensoresTotaisAtivos;

	-- kpi Alertas Críticos 
	CREATE VIEW alertasCriticos AS
	SELECT 
		s.codigoRastreio AS sensorAlerta,
		CASE 
			WHEN c.temperatura > 5 OR c.temperatura < -4 THEN 'Temperatura'
			WHEN c.umidade > 95 OR c.umidade < 60 THEN 'Umidade'
		END AS tipoAlerta,
		COUNT(*) AS totalAlertas
	FROM captura c
	INNER JOIN sensor s ON s.idSensor = c.fkSensor
	INNER JOIN transporte t ON t.fkSensor = s.idSensor
	WHERE t.fkEmpresa = (
		SELECT idEmpresa FROM empresa WHERE codigo_ativacao = 'ACY22'
	)
	AND (
		c.temperatura > 5 OR c.temperatura < -4
		OR c.umidade > 95 OR c.umidade < 60
	)
	GROUP BY 
		s.codigoRastreio,
		CASE 
			WHEN c.temperatura > 5 OR c.temperatura < -4 THEN 'Temperatura'
			WHEN c.umidade > 95 OR c.umidade < 60 THEN 'Umidade'
		END;

	SELECT * FROM alertasCriticos;

	-- kpi Maior Mediana de Temperatura
	CREATE VIEW maiorTempMediana as SELECT 
		ROUND(AVG(c.temperatura), 2) AS medianaTemp,
		DATE(c.dtCaptura) AS Data_Captura 
	FROM captura c
	INNER JOIN transporte t ON t.fkSensor = c.fkSensor
	WHERE t.fkEmpresa = (
		SELECT idEmpresa FROM empresa WHERE codigo_ativacao = 'ACY22'
	)
	AND c.temperatura IS NOT NULL
	GROUP BY DATE(c.dtCaptura)
	ORDER BY medianaTemp DESC;

	SELECT * FROM maiorTempMediana;

CREATE VIEW graficoTempGeral AS
    SELECT 
        c.temperatura AS temperatura_atual,
        ROUND(MAX(ca.temperatura), 2) AS temperatura_maxima,
        ROUND(MIN(ca.temperatura), 2) AS temperatura_minima,
        DATE(c.dtCaptura) AS data_captura
    FROM
        captura c
            INNER JOIN
        captura ca ON DATE(ca.dtCaptura) = DATE(c.dtCaptura)
            AND ca.fkSensor = c.fkSensor
            INNER JOIN
        transporte t ON t.fkSensor = c.fkSensor
    WHERE
        t.fkEmpresa = (SELECT 
                idEmpresa
            FROM
                empresa
            WHERE
                codigo_ativacao = 'ACY22')
            AND c.temperatura IS NOT NULL
            AND c.dtCaptura = (SELECT 
                MAX(ce.dtCaptura)
            FROM
                captura ce
            WHERE
                DATE(ce.dtCaptura) = DATE(c.dtCaptura)
                    AND ce.fkSensor = c.fkSensor)
    GROUP BY DATE(c.dtCaptura) , c.temperatura
    ORDER BY data_captura;

	SELECT * FROM graficoTempGeral;



	/* Gráfico temperatura sensor 1 (sensores) */ 
CREATE VIEW graficoTempSensor1 AS
SELECT
    c.temperatura AS temperatura_atual,
    ROUND(MAX(ca.temperatura), 2) AS temperatura_maxima,
    ROUND(MIN(ca.temperatura), 2) AS temperatura_minima,
    DATE(c.dtCaptura) AS data_captura
FROM captura c
INNER JOIN captura ca
    ON DATE(ca.dtCaptura) = DATE(c.dtCaptura)
    AND ca.fkSensor = c.fkSensor
INNER JOIN transporte t ON t.fkSensor = c.fkSensor
WHERE t.fkEmpresa = (
    SELECT idEmpresa FROM empresa WHERE codigo_ativacao = 'ACY22'
)
AND c.temperatura IS NOT NULL
AND c.fkSensor = 2
AND c.dtCaptura = (
    SELECT MAX(ce.dtCaptura)
    FROM captura ce
    WHERE DATE(ce.dtCaptura) = DATE(c.dtCaptura)
    AND ce.fkSensor = c.fkSensor
)
GROUP BY DATE(c.dtCaptura), c.temperatura
ORDER BY data_captura;

	SELECT * FROM graficoTemPSensor1;
	 
	/* maior mediana da umidade em %*/
	CREATE VIEW maiorMedianaUmidade AS SELECT 
	c.fkSensor AS idSensor,
	s.codigoRastreio,
	MAX(c.umidade) AS maior_umidade
	FROM captura c
	JOIN sensor s ON c.fkSensor = s.idSensor
	WHERE c.umidade IS NOT NULL
	GROUP BY c.fkSensor, s.codigoRastreio
	ORDER BY maior_umidade DESC;

	SELECT * FROM maiorMedianaUmidade;

	-- grafico temperatura visão geral 
	CREATE VIEW garficoTempVisaoGeral AS SELECT 
	DATE(dtCaptura) AS dia,
	MAX(umidade) AS umidade_maxima,
	MIN(umidade) AS umidade_minima,
	ROUND(AVG(umidade), 2) AS umidade_mediana_aprox -- Média aritmética simulando a mediana para o gráfico
	FROM captura
	WHERE fkSensor = 1 -- Filtro para o Sensor 1 selecionado na tela
	AND umidade IS NOT NULL
	GROUP BY DATE(dtCaptura)
	ORDER BY dia ASC;

	SELECT * FROM garficoTempVisaoGeral;

	-- view da pagina sensor , para as kpis de estado 
	CREATE VIEW  EstadoSensor AS
	SELECT 
		s.idSensor,
		s.codigoRastreio,
		ss.idStatus,
		ss.descricao AS statusSensor
	FROM sensor s
	JOIN statusSensor ss ON ss.idStatus = s.fkStatus
	JOIN transporte t ON t.fkSensor = s.idSensor
	WHERE t.fkEmpresa = 2
	GROUP BY s.idSensor, s.codigoRastreio, ss.idStatus, ss.descricao;


	SELECT * FROM EstadoSensor;


	-- Capturas de temperatura do sensor selecionado
	CREATE VIEW CapturaSensor AS
	SELECT 
		c.idCaptura,
		c.temperatura,
		um.simbolo AS unidadeTemperatura
	FROM captura c
	JOIN unidadeMedida um ON um.idUnidade = c.fkUnidadeTemp
	WHERE c.fkSensor = 2
	ORDER BY c.idCaptura ASC;

	SELECT * FROM CapturaSensor;


	-- Capturas de umidade do sensor selecionado(sensores)
	CREATE VIEW UmidadeSensorSelecionado AS
	SELECT 
		c.idCaptura,
		c.umidade,
		um.simbolo AS unidadeUmidade
	FROM captura c
	JOIN unidadeMedida um ON um.idUnidade = c.fkUnidadeUmi
	WHERE c.fkSensor = 2
	ORDER BY c.idCaptura ASC;

	SELECT * FROM garficoTempVisaoGeral;



		
		