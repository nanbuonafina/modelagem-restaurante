-- Index, Triggers e Procedures 

-- criando indice na tb_cliente: otimizam o tempo de busca
CREATE INDEX idx_nome_completo ON tb_cliente(nome_completo); 
CREATE UNIQUE INDEX idx_email ON tb_cliente(email);
CREATE INDEX idx_nome_email ON tb_cliente(nome_completo, email);

-- testando indice em uma consulta
SELECT * FROM tb_cliente 
WHERE nome_completo = 'Fernanda Alves Costa' AND email = 'fernanda.costa@gmail.com';

-- criando a tabela de historico que ira receber os dados caso o trigger seja ativado 
CREATE TABLE tb_pagamento_mesa_log (
id int auto_increment primary key,
mesa_id int,
anterior_status_pagamento_id int, 
novo_status_pagamento_id int,
data_alteracao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (mesa_id) REFERENCES tb_mesa(id_mesa), -- referência à tabela tb_mesa
FOREIGN KEY (anterior_status_pagamento_id) REFERENCES tb_status_pagamento(id_status_pagamento), -- referência à tabela tb_status_pagamento
FOREIGN KEY (novo_status_pagamento_id) REFERENCES tb_status_pagamento(id_status_pagamento) -- referência à tabela de tb_status_pagamento
)

-- criando o trigger
DELIMITER $$
CREATE TRIGGER trg_pagamento_mesa_update
AFTER UPDATE ON tb_mesa
FOR EACH ROW
BEGIN
    -- verifica se houve alteração no status do pagamento
    IF OLD.id_status_pagamento <> NEW.id_status_pagamento THEN
        -- insere o registro de histórico na tabela tb_pagamento_mesa_log
        INSERT INTO tb_pagamento_mesa_log (mesa_id, anterior_status_pagamento_id, novo_status_pagamento_id)
        VALUES (OLD.id_mesa, OLD.id_status_pagamento, NEW.id_status_pagamento);
    END IF;
END$$
DELIMITER ;

-- testando o trigger
UPDATE tb_mesa SET id_status_pagamento = 1 WHERE id_mesa = 6;
select * from tb_pagamento_mesa_log;

-- procedure que atualiza o telefone do cliente se e somente se o novo num. de telefone nao esteja em uso
DELIMITER $$
CREATE PROCEDURE atualizar_telefone (
    IN p_cliente_id INT,
    IN p_novo_telefone VARCHAR(11),
    OUT p_sucesso BOOLEAN
)
BEGIN
    DECLARE telefone_existe INT;
    
    SELECT COUNT(*) INTO telefone_existe FROM tb_cliente WHERE numero_telefone = p_novo_telefone;
    
    IF telefone_existe = 0 THEN
        UPDATE tb_cliente SET numero_telefone = p_novo_telefone WHERE id_cliente = p_cliente_id;
        SET p_sucesso = TRUE;
    ELSE
        SET p_sucesso = FALSE;
    END IF;
END$$
DELIMITER ;

-- testando a procedure acima
SET @sucesso = FALSE;
CALL atualizar_telefone(1, '52170974000', @sucesso); 
SELECT @sucesso;


