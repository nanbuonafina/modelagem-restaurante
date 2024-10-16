# Documentação do Banco de Dados - Sistema de Pedidos e Reservas

## Descrição Geral
Este banco de dados foi projetado para gerenciar um sistema de pedidos e reservas de clientes. Ele inclui informações sobre clientes, pedidos, itens de pedidos, cardápio, reservas e pagamentos.

## Tabelas

### 1. **cadastro_cliente**
Armazena as informações dos clientes cadastrados no sistema.

| Coluna          | Tipo             | Descrição                       |
|-----------------|------------------|---------------------------------|
| `id_cliente`    | INT              | Identificador único do cliente. |
| `nome_completo` | VARCHAR(100)      | Nome completo do cliente.       |
| `telefone`      | VARCHAR(15)       | Telefone de contato do cliente. |
| `email`         | VARCHAR(100)      | Endereço de email do cliente.   |

### 2. **reserva**
Armazena os detalhes das reservas feitas pelos clientes.

| Coluna           | Tipo             | Descrição                         |
|------------------|------------------|-----------------------------------|
| `id_reserva`     | INT              | Identificador único da reserva.   |
| `data_reserva`   | DATE             | Data da reserva.                  |
| `hora_reserva`   | TIME             | Hora da reserva.                  |
| `qtd_pessoa`     | INT              | Quantidade de pessoas na reserva. |
| `status_reserva` | ENUM('pendente', 'confirmada', 'cancelada') | Status da reserva.               |
| `id_cliente`     | INT              | Identificador do cliente que fez a reserva (chave estrangeira). |

### 3. **pedido**
Armazena os dados dos pedidos realizados pelos clientes.

| Coluna           | Tipo             | Descrição                         |
|------------------|------------------|-----------------------------------|
| `id_pedido`      | INT              | Identificador único do pedido.    |
| `data_pedido`    | DATE             | Data em que o pedido foi feito.   |
| `hora_pedido`    | TIME             | Hora em que o pedido foi feito.   |
| `status_pedido`  | ENUM('em preparação', 'pronto', 'entregue') | Status do pedido.              |
| `id_cliente`     | INT              | Identificador do cliente que fez o pedido (chave estrangeira). |

### 4. **item_pedido**
Armazena os itens individuais que compõem um pedido.

| Coluna            | Tipo              | Descrição                           |
|-------------------|-------------------|-------------------------------------|
| `id_item_pedido`  | INT               | Identificador único do item do pedido. |
| `quantidade`      | INT               | Quantidade do item no pedido.       |
| `preco_unitario`  | DECIMAL(10,2)     | Preço unitário do item.             |
| `id_pedido`       | INT               | Identificador do pedido (chave estrangeira). |
| `id_prato`        | INT               | Identificador do prato (chave estrangeira). |

### 5. **cardapio**
Armazena os itens do cardápio disponíveis para pedidos.

| Coluna            | Tipo              | Descrição                           |
|-------------------|-------------------|-------------------------------------|
| `id_prato`        | INT               | Identificador único do prato.       |
| `nome_prato`      | VARCHAR(45)       | Nome do prato.                      |
| `descricao_prato` | TINYTEXT          | Descrição do prato.                 |
| `preco_prato`     | DECIMAL(10,2)     | Preço do prato.                     |
| `categoria_prato` | ENUM('entrada', 'prato principal', 'sobremesa') | Categoria do prato. |

### 6. **pagamento**
Armazena os dados dos pagamentos realizados para os pedidos.

| Coluna              | Tipo              | Descrição                           |
|---------------------|-------------------|-------------------------------------|
| `id_pagamento`      | INT               | Identificador único do pagamento.   |
| `valor_total`       | DECIMAL(10,2)     | Valor total do pagamento.           |
| `forma_pagamento`   | ENUM('dinheiro', 'cartão', 'pix') | Forma de pagamento.     |
| `status_pagamento`  | ENUM('pendente', 'pago') | Status do pagamento.      |
| `id_pedido`         | INT               | Identificador do pedido associado (chave estrangeira). |

## Relacionamentos

- **cadastro_cliente** tem um relacionamento de 1:N com **pedido**, ou seja, um cliente pode fazer vários pedidos.
- **cadastro_cliente** tem um relacionamento de 1:N com **reserva**, ou seja, um cliente pode fazer várias reservas.
- **pedido** tem um relacionamento de 1:N com **item_pedido**, ou seja, um pedido pode conter vários itens de pedido.
- **item_pedido** tem um relacionamento de N:1 com **cardapio**, ou seja, um item de pedido corresponde a um prato do cardápio.
- **pedido** tem um relacionamento de 1:1 com **pagamento**, ou seja, cada pedido possui um único pagamento.
- **reserva** tem um relacionamento de N:1 com **cadastro_cliente**, onde um cliente pode ter várias reservas.

## Diagrama ER

O diagrama ER reflete essas tabelas e seus relacionamentos e pode ser visualizado utilizando o MySQL Workbench.

## Autor

Desenvolvido por Fernanda Buonafina, Livia, Fernanda Gabrielli, Mariana Temporal, Clara.

---

Documentação gerada para descrever o modelo lógico de banco de dados do sistema de pedidos e reservas.
