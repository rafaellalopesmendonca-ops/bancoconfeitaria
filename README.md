# Sweet Thuty — Modelo Conceitual (DER)

Modelagem de um sistema de gestão de informações para uma confeitaria de pequeno porte.

## Metadados

**Integrantes do grupo**

| Nome | RGM |
|------|-----|
| David Mota Marques | 47753251 |
| Lucas Ronaldo Gasparotto Machado | 47297166 |
| Luiz Paulo Alves Souza Coelho Freitas | 47779829 |
| Rafaella Lopes Mendonça Tolentino | 48033863 |

---

## 1. Caracterização da Organização

**Nome e natureza:** Sweet Thuty, estabelecimento comercial com fins lucrativos, focado em confeitaria.

**Contexto e porte:** A Sweet Thuty é um estabelecimento de pequeno porte voltado ao atendimento e à venda de produtos alimentícios. Conta com três funcionárias, cada uma com uma função definida:

- **Sthefany:** atendimento no balcão e contato direto com os clientes.
- **Tuany:** caixa e recebimento dos pagamentos.
- **Maria:** cozinha e preparação dos produtos.

Como a equipe é reduzida, as atividades se distribuem entre as três, e o volume de trabalho acompanha o fluxo diário de clientes. Por isso é importante manter os processos bem organizados.

**Problemas e necessidades identificados:**

- **Dependência de sistemas externos.** A organização usava o aplicativo Anota.ai e relatou dificuldades com o atendimento e o suporte da plataforma. Hoje usa o sistema Consumer, principalmente pelo acesso remoto.
- **Armazenamento inseguro.** Parte dos dados ficava no disco de um único computador. Quando o equipamento falhou, as informações ficaram indisponíveis. Surgiu a necessidade de um servidor em nuvem.
- **Atendimento ao cliente.** A responsável prefere conversar diretamente com os clientes, em vez de depender só de atendimento automatizado. Também quer um sistema simples, sem excesso de cadastros para pedidos básicos, como a encomenda de um bolo.
- **Controle financeiro.** Falta uma visão clara das entradas, das saídas e da margem do negócio.
- **Controle de estoque.** É preciso saber o que existe, onde está guardado e quanto resta de cada item, com alerta quando um insumo estiver acabando.
- **Notificações.** A responsável quer avisos simples, preferencialmente pelo WhatsApp, sobre estoque baixo, necessidade de reposição e proximidade da data de entrega de pedidos.
- **Ferramentas separadas.** Há interesse em reunir no mesmo sistema as funcionalidades que hoje dependem do Anota.ai.

**Síntese:** falta uma solução centralizada, simples e segura para gerenciar pedidos, clientes, estoque, financeiro e entregas.

**Justificativa da escolha:** A organização existe de fato e o grupo tem acesso à responsável, o que permitiu levantar os requisitos por meio de conversa direta. Os problemas são reais e concretos e podem ser transformados em requisitos. O porte é adequado: tem processos suficientes para gerar um modelo relevante, sem ser complexo demais para esta etapa. A responsável tem clareza sobre suas necessidades e está aberta a uma solução tecnológica prática.

---

## 2. Processos de Negócio

**Principais processos mapeados:**

1. **Atendimento e cadastro de clientes:** a atendente recebe o cliente (balcão ou contato direto) e registra apenas os dados essenciais (nome e telefone).
2. **Registro de pedidos e encomendas:** o pedido é registrado com itens, data e hora de entrega, observações de personalização e, quando houver, foto de referência.
3. **Produção:** a cozinha consulta o pedido e a receita do produto e prepara a encomenda.
4. **Pagamento:** o caixa registra o pagamento do pedido (valor, forma e data).
5. **Controle financeiro:** entradas e saídas são registradas para acompanhar o caixa e a margem.
6. **Controle de estoque:** insumos são cadastrados, e entradas (compras) e saídas (uso em produção, perdas) são registradas. O sistema alerta quando o estoque chega ao mínimo.
7. **Compra de insumos:** a reposição é feita junto aos fornecedores cadastrados.
8. **Notificações:** avisos pelo WhatsApp sobre estoque baixo e proximidade de entregas.

**Fluxo geral (resumo):** Cliente → Atendimento → Pedido → Produção (receita + insumos) → Baixa no estoque → Pagamento → Lançamento financeiro → Entrega.

---

## 3. Requisitos do Sistema

### 3.1 Requisitos Funcionais

- **RF01:** cadastrar, consultar e editar clientes com o mínimo de informações necessárias.
- **RF02:** registrar pedidos com itens, data e hora de entrega, observações e foto de referência.
- **RF03:** acompanhar o status do pedido (pendente, em produção, entregue, cancelado).
- **RF04:** cadastrar produtos, categorias e receitas.
- **RF05:** cadastrar insumos e fornecedores.
- **RF06:** registrar movimentações de estoque (entrada e saída) e consultar a quantidade disponível.
- **RF07:** alertar quando um insumo atingir o estoque mínimo.
- **RF08:** registrar pagamentos de pedidos.
- **RF09:** registrar entradas e saídas financeiras e apresentar o resumo financeiro.
- **RF10:** enviar notificações pelo WhatsApp (estoque baixo, reposição e proximidade de entrega).
- **RF11:** controlar o acesso ao sistema por usuário, login e nível de acesso.

### 3.2 Requisitos Não Funcionais

- **RNF01 – Disponibilidade:** os dados devem ficar em servidor em nuvem, acessíveis remotamente.
- **RNF02 – Segurança:** os dados não podem depender de um único computador, e as senhas devem ser armazenadas criptografadas (hash).
- **RNF03 – Usabilidade:** a interface deve ser simples e intuitiva, exigindo poucos cadastros para operações básicas.
- **RNF04 – Integração:** deve ser possível integrar o sistema ao WhatsApp para notificações.
- **RNF05 – Desempenho:** consultas e registros do dia a dia devem responder rapidamente.

---

## 4. Regras de Negócio

**Regras operacionais:**

- **RN01:** todo pedido deve estar vinculado a um cliente e conter data de entrega.
- **RN02:** um pedido deve ter pelo menos um item.
- **RN03:** o valor total do pedido corresponde à soma dos subtotais dos seus itens.
- **RN04:** um pedido possui um status, que muda ao longo do atendimento.
- **RN05:** todo produto pertence a uma categoria.
- **RN06:** toda receita está associada a um produto.
- **RN07:** toda movimentação de estoque deve informar o insumo, o tipo (entrada ou saída), a quantidade e a data.
- **RN08:** quando a quantidade de um insumo ficar igual ou abaixo do estoque mínimo, o sistema deve gerar um alerta.
- **RN09:** todo pagamento deve estar vinculado a um pedido.
- **RN10:** o login do usuário deve ser único, e o acesso às funções depende do nível de acesso.

**Restrições organizacionais:**

- **Equipe reduzida:** com apenas três funcionárias, o sistema deve ser simples e evitar cadastros extensos. Isso influencia a quantidade de campos obrigatórios.
- **Atendimento humano:** a responsável quer manter o contato direto com o cliente, então o sistema apoia o atendimento sem substituí-lo.
- **Armazenamento seguro:** os dados não podem ficar apenas em um computador local, o que justifica a hospedagem em nuvem.
- **Canal de comunicação:** os avisos devem usar o WhatsApp, canal já usado na rotina da empresa.

---

## 5. Dicionário de Dados Conceitual (Preliminar)

### USUÁRIO

| Atributo | Descrição | Regra de negócio associada |
|----------|-----------|----------------------------|
| id_usuario | Identificador do usuário | Chave primária (PK), gerada automaticamente |
| nome | Nome completo do usuário | Obrigatório |
| login | Nome de acesso ao sistema | Obrigatório e único |
| senha | Senha de acesso | Obrigatória, armazenada em hash |
| nivel_acesso | Perfil de permissão (ex.: administrador, atendente) | Obrigatório |
| ativo | Indica se o usuário está ativo | Obrigatório (sim/não) |

### CLIENTE

| Atributo | Descrição | Regra de negócio associada |
|----------|-----------|----------------------------|
| id_cliente | Identificador do cliente | PK, gerada automaticamente |
| nome | Nome do cliente | Obrigatório |
| telefone | Telefone/WhatsApp para contato | Obrigatório, usado nas notificações |
| endereço | Endereço de contato ou entrega | Opcional |

### PEDIDO

| Atributo | Descrição | Regra de negócio associada |
|----------|-----------|----------------------------|
| id_pedidos | Identificador do pedido | PK, gerada automaticamente |
| id_clientes | Cliente que fez o pedido | Chave estrangeira (FK) para CLIENTE, obrigatória |
| data_pedidos | Data em que o pedido foi feito | Obrigatória |
| data_entrega | Data prevista de entrega | Obrigatória, não pode ser anterior à data do pedido |
| hora_entrega | Horário previsto de entrega | Opcional |
| status | Situação do pedido | Obrigatório (pendente, em produção, entregue, cancelado) |
| valor_total | Valor total do pedido | Obrigatório, soma dos subtotais dos itens |
| observações | Detalhes e personalizações | Opcional |
| foto_referências | Foto de referência do produto desejado | Opcional |

### ITEM_PEDIDOS

| Atributo | Descrição | Regra de negócio associada |
|----------|-----------|----------------------------|
| id_item | Identificador do item | PK, gerada automaticamente |
| id_pedido | Pedido ao qual o item pertence | FK para PEDIDO, obrigatória |
| id_produto | Produto solicitado | FK para PRODUTO, obrigatória |
| quantidade | Quantidade solicitada | Obrigatória, maior que zero |
| preço_unitário | Preço do produto no momento do pedido | Obrigatório |
| subtotal | Quantidade multiplicada pelo preço unitário | Calculado |

### CATEGORIA_PRODUTO

| Atributo | Descrição | Regra de negócio associada |
|----------|-----------|----------------------------|
| id_categoria | Identificador da categoria | PK, gerada automaticamente |
| nome | Nome da categoria (ex.: bolos, doces, tortas) | Obrigatório |
| descrição | Descrição da categoria | Opcional |
| ativo | Indica se a categoria está ativa | Obrigatório (sim/não) |

### PRODUTO

| Atributo | Descrição | Regra de negócio associada |
|----------|-----------|----------------------------|
| id_produto | Identificador do produto | PK, gerada automaticamente |
| nome | Nome do produto | Obrigatório |
| descrição | Descrição do produto | Opcional |
| categoria | Categoria do produto | FK para CATEGORIA_PRODUTO, obrigatória |
| tamanho | Tamanho do produto (ex.: P, M, G) | Opcional |
| quantidade_pessoas | Quantas pessoas o produto serve | Opcional |
| preço_base | Preço base de venda | Obrigatório, maior que zero |
| ativo | Indica se o produto está disponível | Obrigatório (sim/não) |

### RECEITA

| Atributo | Descrição | Regra de negócio associada |
|----------|-----------|----------------------------|
| id_receitas | Identificador da receita | PK, gerada automaticamente |
| id_produtos | Produto ao qual a receita pertence | FK para PRODUTO, obrigatória |
| nome | Nome da receita | Obrigatório |
| descrições | Modo de preparo e observações | Opcional |

### INSUMO

| Atributo | Descrição | Regra de negócio associada |
|----------|-----------|----------------------------|
| id_insumo | Identificador do insumo | PK, gerada automaticamente |
| nome | Nome do insumo (ex.: farinha, chocolate) | Obrigatório |
| categoria | Categoria do insumo | Opcional |
| unidade_medida | Unidade de medida (kg, g, L, un) | Obrigatória |
| tipo | Tipo do insumo (ex.: ingrediente, embalagem) | Opcional |
| estoque_minimo | Quantidade mínima antes do alerta | Opcional, base para o alerta de estoque baixo |
| ativo | Indica se o insumo está ativo | Obrigatório (sim/não) |

### FORNECEDOR

| Atributo | Descrição | Regra de negócio associada |
|----------|-----------|----------------------------|
| id_fornecedor | Identificador do fornecedor | PK, gerada automaticamente |
| nome | Nome do fornecedor | Obrigatório |
| telefone | Telefone de contato | Opcional |
| endereço | Endereço do fornecedor | Opcional |

### ESTOQUE

| Atributo | Descrição | Regra de negócio associada |
|----------|-----------|----------------------------|
| id_estoque | Identificador do registro de estoque | PK, gerada automaticamente |
| id_insumo | Insumo armazenado | FK para INSUMO, obrigatória |
| id_fornecedor | Fornecedor do insumo | FK para FORNECEDOR, opcional |
| quantidade_atual | Quantidade disponível | Obrigatória, não pode ser negativa |
| local_armazenamento | Local onde o insumo está guardado | Opcional |

### MOVIMENTAÇÃO_ESTOQUE

| Atributo | Descrição | Regra de negócio associada |
|----------|-----------|----------------------------|
| id_movimentação | Identificador da movimentação | PK, gerada automaticamente |
| id_insumos | Insumo movimentado | FK para INSUMO, obrigatória |
| tipo_movimentação | Tipo da movimentação | Obrigatório (entrada ou saída) |
| quantidade | Quantidade movimentada | Obrigatória, maior que zero |
| data_movimentação | Data da movimentação | Obrigatória |
| motivos | Motivo (compra, uso em produção, perda) | Opcional |

### PAGAMENTO

| Atributo | Descrição | Regra de negócio associada |
|----------|-----------|----------------------------|
| id_pagamento | Identificador do pagamento | PK, gerada automaticamente |
| id_pedido | Pedido pago | FK para PEDIDO, obrigatória |
| valor | Valor pago | Obrigatório, maior que zero |
| forma_pagamento | Forma de pagamento (Pix, dinheiro, cartão) | Obrigatória |
| data_pagamento | Data do pagamento | Obrigatória |

### FINANCEIRO

| Atributo | Descrição | Regra de negócio associada |
|----------|-----------|----------------------------|
| id_financeiro | Identificador do lançamento | PK, gerada automaticamente |
| id_pedido | Pedido relacionado ao lançamento | FK para PEDIDO, opcional (saídas não têm pedido) |
| tipo | Tipo do lançamento | Obrigatório (entrada ou saída) |
| descrição | Descrição do lançamento | Opcional |
| valor | Valor da movimentação | Obrigatório, maior que zero |
| data_movimentação | Data da movimentação | Obrigatória |
| forma_pagamento | Forma de pagamento utilizada | Opcional |

*Os exemplos de valores citados são fictícios e não representam dados reais da organização.*

---

## 6. Modelagem Conceitual (Entidades, Atributos, Relacionamentos)

**Entidades reconhecidas:**

| Entidade | Justificativa |
|----------|---------------|
| USUÁRIO | Quem acessa o sistema e registra as operações |
| CLIENTE | Quem faz as encomendas e recebe as notificações |
| PEDIDO | Registra cada encomenda, com datas, status e valor |
| ITEM_PEDIDOS | Detalha os produtos e as quantidades de cada pedido |
| CATEGORIA_PRODUTO | Organiza os produtos (bolos, doces, tortas) |
| PRODUTO | Itens vendidos pela confeitaria |
| RECEITA | Define como cada produto é preparado |
| INSUMO | Ingredientes e materiais usados na produção |
| FORNECEDOR | Quem fornece os insumos |
| ESTOQUE | Controla a quantidade e a localização dos insumos |
| MOVIMENTAÇÃO_ESTOQUE | Histórico de entradas e saídas do estoque |
| PAGAMENTO | Pagamentos recebidos pelos pedidos |
| FINANCEIRO | Entradas e saídas financeiras da confeitaria |

**Atributos e classificações:** os atributos de cada entidade estão detalhados no Dicionário de Dados (Seção 5).

**Relacionamentos e cardinalidades:**

| Entidade A | Relacionamento | Entidade B | Cardinalidade |
|------------|----------------|------------|---------------|
| USUÁRIO | realiza | PEDIDO | 1:N |
| CLIENTE | faz | PEDIDO | 1:N |
| PEDIDO | possui | ITEM_PEDIDOS | 1:N |
| PRODUTO | aparece em | ITEM_PEDIDOS | 1:N |
| CATEGORIA_PRODUTO | classifica | PRODUTO | 1:N |
| PRODUTO | tem | RECEITA | 1:N |
| PEDIDO | recebe | PAGAMENTO | 1:N |
| USUÁRIO | registra | FINANCEIRO | 1:N |
| FINANCEIRO | tem | PAGAMENTO | 1:N |
| INSUMO | possui | ESTOQUE | 1:N |
| INSUMO | sofre | MOVIMENTAÇÃO_ESTOQUE | 1:N |
| FORNECEDOR | fornece | ESTOQUE | 1:N |

**Restrições e políticas aplicadas ao modelo:** poucos campos obrigatórios (equipe reduzida), telefone do cliente obrigatório (necessário para as notificações pelo WhatsApp), estoque mínimo por insumo (alertas) e senha em hash (segurança).

---

## 7. Diagrama Entidade-Relacionamento (DER)

![DER da Sweet Thuty](DER_CONFEITARIA_drawio.png)

O diagrama representa as entidades, os atributos, os relacionamentos e as cardinalidades descritos nas seções anteriores.

---

## 8. Justificativa Técnica

- **Separação entre PEDIDO e ITEM_PEDIDOS:** um pedido pode ter vários produtos, e cada item guarda quantidade e preço no momento da venda. Assim, mudanças futuras de preço não alteram pedidos antigos.
- **CATEGORIA_PRODUTO como entidade própria:** evita repetir o nome da categoria em cada produto e facilita criar novas categorias.
- **RECEITA ligada ao PRODUTO:** cada produto tem seu modo de preparo, o que permite à cozinha consultá-lo e, nas próximas etapas, relacionar a receita aos insumos consumidos.
- **ESTOQUE e MOVIMENTAÇÃO_ESTOQUE separados:** o estoque guarda a quantidade atual e a localização, e a movimentação guarda o histórico. Isso permite o alerta de estoque mínimo e a rastreabilidade de entradas, saídas e perdas.
- **FORNECEDOR separado de INSUMO:** um fornecedor pode atender vários insumos, e registrá-lo à parte evita repetição de dados.
- **PAGAMENTO e FINANCEIRO separados:** o pagamento está ligado ao pedido, enquanto o financeiro cobre também as saídas (compras, despesas), que não têm pedido.
- **USUÁRIO como entidade:** controla o acesso por login e nível de permissão, necessário por haver mais de uma pessoa operando o sistema.
- **Cadastro enxuto de CLIENTE:** reflete o pedido da responsável por menos burocracia, mantendo o telefone para as notificações.
- **Escalabilidade e integração:** o modelo permite, nas próximas etapas, incluir a relação entre receita e insumos, mais formas de pagamento e a integração com o WhatsApp.

---

## 9. Uso de Inteligência Artificial

### ChatGPT

| Item | Registro |
|------|----------|
| **Ferramenta e etapa** | ChatGPT, nas funcionalidades e na decoração do site |
| **Motivação** | Dúvidas sobre as funcionalidades do site, principalmente a visualização |
| **Prompt(s) utilizados** | Perguntas sobre CSS e layout, como sombras, a frase decorativa e títulos com símbolo |
| **Fontes consultadas e verificadas** | A IA foi usada apenas para o site e a decoração |
| **Trechos rejeitados ou corrigidos** | DER gerado com letras e símbolos ilegíveis |
| **Reflexão crítica** | Limitação na geração de imagens e alucinação da IA, com palavras em inglês no DER onde deveria haver português |

### Claude (Anthropic)

| Item | Registro |
|------|----------|
| **Ferramenta e etapa** | Claude, na elaboração do dicionário de dados e na sua versão em HTML para o site |
| **Motivação** | Organizar o dicionário de dados a partir da imagem do DER e adaptá-lo ao site |
| **Prompt(s) utilizados** | "Faça um dicionário de dados" (com a imagem do DER anexada); "em HTML"; "faça apenas o código"; "preciso adicionar essa parte do dicionário no site"; "modelo README GitHub texto limpo" |
| **Fontes consultadas e verificadas** | O conteúdo foi baseado no DER do grupo e conferido com ele |
| **Trechos rejeitados ou corrigidos** | A IA apontou inconsistências no DER (ESTOQUE, FORNECEDORES, ITEM_PEDIDOS), tratadas pelo grupo |
| **Reflexão crítica** | Os tipos de dados são sugestões da IA e dependem da validação do grupo e da escolha do banco |
