DELIMITER $$   
CREATE TRIGGER povoar_trabalha_em_CHEF AFTER INSERT ON restaurante FOR EACH ROW 
	BEGIN
    INSERT Into trabalha_em (id_restaurante, id_funcionario)
	VALUES (new.id_restaurante, new.id_chefe);
END $$

DELIMITER $$   
CREATE TRIGGER testando AFTER INSERT ON licenca_sanitaria FOR EACH ROW 
	BEGIN
		INSERT INTO conexao (ordem, num_lic)
		VALUES((select COUNT(num_licenca) from licenca_sanitaria), new.num_licenca);
        /*(CAST(lic AS CHAR));*/
END $$
