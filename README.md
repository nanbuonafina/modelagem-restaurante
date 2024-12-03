# Documentação do Banco de Dados - Sistema de Reservas e Pedidos

Este banco de dados foi modelado para gerenciar um sistema de reservas e pedidos em um restaurante. A estrutura inclui tabelas relacionadas a clientes, reservas, pedidos, mesas, itens do cardápio, formas de pagamento e status de diferentes processos.

Você pode visualizar o modelo conceitual clicando no link a seguir: https://app.brmodeloweb.com/#!/publicview/67170297ac9ce12e5d36e0a3

Para importar o banco de dados faça o download do arquivo ```db_restaurante.sql``` e execute o seguinte comando no MySQL:
```bash
mysql -u root -p mydb < db_restaurante.sql
```

## Tabelas e Relacionamentos

### 1. **Tabela: `tb_cliente`**
Tabela que armazena as informações dos clientes.

- **Colunas:**
  - `id_cliente` (INT, PRIMARY KEY): Identificador único do cliente.
  - `nome_completo` (VARCHAR(100)): Nome completo do cliente.
  - `numero_telefone` (VARCHAR(11)): Número de telefone do cliente.
  - `email` (VARCHAR(100)): E-mail do cliente.

### 2. **Tabela: `tb_reserva`**
Tabela que armazena as reservas realizadas pelos clientes.

- **Colunas:**
  - `id_reserva` (INT, PRIMARY KEY): Identificador único da reserva.
  - `data_reserva` (DATE): Data da reserva.
  - `hora_reserva` (TIME): Hora da reserva.
  - `qtd_pessoa` (INT): Quantidade de pessoas na reserva.
  - `id_status_reserva` (INT, FOREIGN KEY): Chave estrangeira para a tabela `tb_status_reserva`, indicando o status da reserva.
  - `id_cliente` (INT, FOREIGN KEY): Chave estrangeira para a tabela `tb_cliente`, indicando o cliente que fez a reserva.
  - `id_mesa` (INT, FOREIGN KEY): Chave estrangeira para a tabela `tb_mesa`, indicando a mesa reservada.

### 3. **Tabela: `tb_status_reserva`**
Tabela que armazena os diferentes status de uma reserva.

- **Colunas:**
  - `id_status_reserva` (INT, PRIMARY KEY): Identificador único do status da reserva.
  - `descricao_status_reserva` (VARCHAR(15)): Descrição do status (e.g., "Pendente", "Confirmada", "Cancelada").

### 4. **Tabela: `tb_pedido`**
Tabela que armazena os pedidos realizados pelos clientes.

- **Colunas:**
  - `id_pedido` (INT, PRIMARY KEY): Identificador único do pedido.
  - `data_pedido` (DATE): Data do pedido.
  - `hora_pedido` (TIME): Hora do pedido.
  - `id_status_pedido` (INT, FOREIGN KEY): Chave estrangeira para a tabela `tb_status_pedido`, indicando o status do pedido.

### 5. **Tabela: `tb_status_pedido`**
Tabela que armazena os diferentes status de um pedido.

- **Colunas:**
  - `id_status_pedido` (INT, PRIMARY KEY): Identificador único do status do pedido.
  - `descricao_status_pedido` (VARCHAR(15)): Descrição do status do pedido (e.g., "Em preparo", "Entregue").

### 6. **Tabela: `tb_mesa`**
Tabela que armazena as informações das mesas no restaurante.

- **Colunas:**
  - `id_mesa` (INT, PRIMARY KEY): Identificador único da mesa.
  - `valor_total` (DECIMAL(10,2)): Valor total de pedidos realizados na mesa.
  - `id_forma_pagamento` (INT, FOREIGN KEY): Chave estrangeira para a tabela `tb_forma_pagamento`, indicando a forma de pagamento utilizada.
  - `id_status_pagamento` (INT, FOREIGN KEY): Chave estrangeira para a tabela `tb_status_pagamento`, indicando o status do pagamento.
  - `id_pedido` (INT, FOREIGN KEY): Chave estrangeira para a tabela `tb_pedido`, associando o pedido à mesa.

### 7. **Tabela: `tb_item_pedido`**
Tabela que armazena os itens de um pedido específico.

- **Colunas:**
  - `id_item_pedido` (INT, PRIMARY KEY): Identificador único do item no pedido.
  - `quantidade` (INT): Quantidade de unidades do item no pedido.
  - `preco_unitario` (DECIMAL(10,2)): Preço unitário do item.
  - `id_pedido` (INT, FOREIGN KEY): Chave estrangeira para a tabela `tb_pedido`, associando o item ao pedido.
  - `id_item` (INT, FOREIGN KEY): Chave estrangeira para a tabela `tb_cardapio`, indicando o item do cardápio.

### 8. **Tabela: `tb_cardapio`**
Tabela que armazena os itens disponíveis no cardápio.

- **Colunas:**
  - `id_item` (INT, PRIMARY KEY): Identificador único do item no cardápio.
  - `nome_prato` (VARCHAR(45)): Nome do prato ou item do cardápio.
  - `descricao_prato` (TINYTEXT): Descrição do prato.
  - `preco_prato` (DECIMAL(10,2)): Preço do prato.
  - `categoria_prato` (ENUM): Categoria do prato (e.g., "Entrada", "Prato Principal", "Sobremesa").

### 9. **Tabela: `tb_forma_pagamento`**
Tabela que armazena as diferentes formas de pagamento aceitas.

- **Colunas:**
  - `id_forma_pagamento` (INT, PRIMARY KEY): Identificador único da forma de pagamento.
  - `descricao_forma_pagamento` (VARCHAR(15)): Descrição da forma de pagamento (e.g., "Cartão de Crédito", "Dinheiro").

### 10. **Tabela: `tb_status_pagamento`**
Tabela que armazena os diferentes status de um pagamento.

- **Colunas:**
  - `id_status_pagamento` (INT, PRIMARY KEY): Identificador único do status do pagamento.
  - `descricao_status_pagamento` (VARCHAR(15)): Descrição do status do pagamento (e.g., "Pendente", "Pago").

## Relacionamentos

- **Cliente - Reserva**: Um cliente pode fazer várias reservas. (1:N)
- **Reserva - Status da Reserva**: Cada reserva tem um status associado. (N:1)
- **Reserva - Mesa**: Cada reserva pode estar associada a uma mesa específica. (N:1)
- **Mesa - Pedido**: Uma mesa pode ter vários pedidos associados. (1:N)
- **Pedido - Status do Pedido**: Cada pedido possui um status associado. (N:1)
- **Pedido - Itens do Pedido**: Um pedido pode conter vários itens. (1:N)
- **Itens do Pedido - Cardápio**: Cada item de um pedido está relacionado a um item do cardápio. (N:1)
- **Mesa - Forma de Pagamento**: Uma mesa pode ter uma forma de pagamento associada. (N:1)
- **Mesa - Status do Pagamento**: Cada mesa tem um status de pagamento associado. (N:1)

## Considerações Finais

Este modelo foi construído para garantir a integridade e consistência das informações de clientes, reservas e pedidos no restaurante. Os relacionamentos entre as tabelas são essenciais para garantir que os dados estejam corretamente associados, permitindo o controle de status em diversas etapas do processo.

## Diagrama ER

O diagrama ER reflete essas tabelas e seus relacionamentos e pode ser visualizado utilizando o MySQL Workbench.

## Autoria

Desenvolvido por Fernanda Buonafina, Livia Janine, Fernanda Gabrielli, Maryana Ferreira Temporal, Clara Heloísa.
