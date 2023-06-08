/* Povoamento da tabela funcionario */
DELIMITER $$
CREATE PROCEDURE
povoar_funcionario(in func_id int)
BEGIN
    DECLARE sex char(1);
    DECLARE dat int;
    DECLARE func varchar(35);
    DECLARE alet int;
    DECLARE telef int;
    
    WHILE func_id > 0 DO
		SET alet = (RAND() * 10);
		SET dat = (RAND() *1000000);
		SET telef = (RAND() *100000000);

		/* Genero */
		IF alet % 2 <=> 0 THEN
			SET sex = 'M';
		ELSEIF alet % 2 <=> 1 THEN
			SET sex = 'F';
		END IF;
		/*Data de contratação*/
		WHILE dat > 231231 && dat < 170101 DO
			SET dat = (CAST((RAND() *1000000) AS date));
		END WHILE;
		/*Funcao*/
		IF alet <=> 1 THEN
			SET func = 'Sou-chefe';
		ELSEIF alet <=> 2 THEN
			SET func = 'Gerente';
		ELSEIF alet <=> 3 THEN
			SET func = 'Maître';
		ELSEIF alet <=> 4 THEN
			SET func = 'Garçom';
		ELSEIF alet <=> 5 THEN
			SET func = 'Commins';
		ELSEIF alet <=> 6 THEN
			SET func = 'Chef';
		ELSEIF alet <=> 7 THEN
			SET func = 'Cozinheiro';
		ELSEIF alet <=> 8 THEN
			SET func = 'Barman/bartender';
		ELSEIF alet <=> 9 THEN
			SET func = 'Auxiliar de limpeza';
		ELSEIF alet <=> 10 THEN
			SET func = 'Sommelier';
		END IF;
    
		INSERT INTO funcionario (nome, sexo, 
						data_contratacao, funcao, telefone)
		VALUES ((CONCAT('Funcionario - ',CAST(func_id AS CHAR))), sex,
				191203,  func, CONCAT('XX-', telef));
		/*INCREMENTO*/
        SET func_id = func_id - 1;
	END WHILE; 
END $$
DELIMITER ;
CALL povoar_funcionario(100); /* Chamada do povoamento da tabela funcionario */


/*Povoamento da tabela licenca_sanitaria*/
CREATE table conexao(
		ordem int not null,
        num_lic char(3) not null
    );
    
DELIMITER $$   
CREATE TRIGGER testando AFTER INSERT ON licenca_sanitaria FOR EACH ROW 
	BEGIN
		INSERT INTO conexao (ordem, num_lic)
		VALUES((select COUNT(num_licenca) from licenca_sanitaria), new.num_licenca);
        /*(CAST(lic AS CHAR));*/
END $$
    
DELIMITER $$ 
CREATE PROCEDURE
criando_alvaraSanitaria(IN quantidade_licenca int)
BEGIN
    DECLARE no_licenca int;
    DECLARE id bigint;
    DECLARE num int;
    DECLARE incremento int;
    DECLARE ordenacao int ;
    SET incremento = 0;
    SET ordenacao = 1;
    
	WHILE incremento < quantidade_licenca DO
		SET no_licenca = (RAND() * 1000); /*Sorteia a licenca*/
		SET id = (RAND() * 100000000000000);  /*Sorteia o CNPJ*/
        SET num = (select COUNT(num_lic) from conexao);
        
		WHILE no_licenca < 100 DO
			SET no_licenca = (RAND() * 1000); 
		END WHILE;
	
		 WHILE id < 10000000000000 DO
			SET id = (RAND() * 100000000000000); 
		END WHILE;

		SET ordenacao = 1;
		WHILE ordenacao != 0 DO
			SET ordenacao = (select COUNT(num_lic) from conexao where num_lic = no_licenca);
			IF ordenacao <=> 0 THEN
				INSERT INTO licenca_sanitaria (num_licenca, data_emissao, validade, cnpj)
				VALUES ((CAST(no_licenca AS CHAR)), 191203, 201203, (CAST(id AS CHAR)));
			ELSE 
				WHILE ordenacao != 0 DO
					WHILE no_licenca < 100 DO
						SET no_licenca = (RAND() * 1000); 
					END WHILE;
					SET ordenacao = (select COUNT(num_lic) from conexao where num_lic = no_licenca);
				END WHILE;
			END IF;
         END WHILE;       
		
        SET incremento = incremento + 1;    
	END WHILE;
END $$
DELIMITER ;
CALL criando_alvaraSanitaria(100);
