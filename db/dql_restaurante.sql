SELECT 
    c.nome_completo AS cliente,
    c.numero_telefone AS telefone,
    c.email AS email,
    r.data_reserva AS data_reserva,
    r.hora_reserva AS hora_reserva,
    r.qtd_pessoa AS quantidade_pessoas,
    sr.descricao_status_reserva AS status_reserva,
    m.id_mesa AS mesa,
    m.valor_total AS valor_total_mesa,
    fp.descricao_forma_pagamento AS forma_pagamento,
    sp.descricao_status_pagamento AS status_pagamento,
    p.id_pedido AS pedido,
    p.data_pedido AS data_pedido,
    p.hora_pedido AS hora_pedido,
    spd.descricao_status_pedido AS status_pedido
FROM tb_cliente c
JOIN tb_reserva r ON c.id_cliente = r.id_cliente
JOIN tb_mesa m ON r.id_mesa = m.id_mesa
JOIN tb_pedido p ON m.id_pedido = p.id_pedido
-- JOINs para trazer as descrições
JOIN tb_status_reserva sr ON r.id_status_reserva = sr.id_status_reserva
JOIN tb_status_pagamento sp ON m.id_status_pagamento = sp.id_status_pagamento
JOIN tb_forma_pagamento fp ON m.id_forma_pagamento = fp.id_forma_pagamento
JOIN tb_status_pedido spd ON p.id_status_pedido = spd.id_status_pedido;



select * from tb_item_pedido;

