# Sweet Thuty — Modelo Conceitual (DER)

Modelagem de um sistema de gestão de informações para uma confeitaria de pequeno porte.

**Versão:** 2.0 · 30/10/2026

## Arquivos do projeto

| Arquivo | Conteúdo |
|---|---|
| `README.md` | Este documento |
| `DER_CONFEITARIA_v2.png` | Diagrama Entidade-Relacionamento atualizado (com cardinalidades mín./máx.) |
| `DER_CONFEITARIA_v2.drawio` | Arquivo editável do DER (draw.io) |
| `dicionario.html` | Dicionário de dados completo (versão 2.0) |
| `fotos_confeitaria/` | Fotos do interior da loja, com o letreiro "Sweet Thuty Patisserie" |

## Metadados

**Integrantes do grupo**

| Nome | RGM |
|---|---|
| David Mota Marques | 47753251 |
| Lucas Ronaldo Gasparotto Machado | 47297166 |
| Luiz Paulo Alves Souza Coelho Freitas | 47779829 |
| Rafaella Lopes Mendonça Tolentino | 48033863 |

---

## 1. Caracterização da Organização

**Nome e natureza:** Sweet Thuty (letreiro "Sweet Thuty Patisserie"), estabelecimento comercial com fins lucrativos, focado em confeitaria. As fotos do interior da loja estão na pasta `fotos_confeitaria/` e comprovam a visita do grupo.

**Contexto e porte:** A Sweet Thuty é um estabelecimento de pequeno porte voltado ao atendimento e à venda de produtos alimentícios. Conta com três funcionárias, cada uma com uma função definida:

- **Sthefany:** atendimento no balcão e contato direto com os clientes.
- **Tuany:** caixa e recebimento dos pagamentos.
- **Maria:** cozinha e preparação dos produtos.

Como a equipe é reduzida, as atividades se distribuem entre as três, e o volume de trabalho acompanha o fluxo diário de clientes. Por isso é importante manter os processos bem organizados.

**Sistemas usados hoje:** a loja usava o aplicativo Anota.ai e atualmente usa o sistema Consumer.

**Como o levantamento foi feito:** o grupo conversou presencialmente com a responsável pela loja, com visita ao local (fotos em `fotos_confeitaria/`). Em uma segunda visita, o grupo fez perguntas complementares sobre pagamentos, estoque, preços e cadastro de clientes. As respostas estão incorporadas aos processos, às regras de negócio e ao modelo.

**Problemas e necessidades identificados:**

- **Dependência de sistemas externos.** A organização usava o Anota.ai e relatou dificuldades com o atendimento e o suporte da plataforma. Hoje usa o Consumer, principalmente pelo acesso remoto.
- **Armazenamento inseguro.** Parte dos dados ficava no disco de um único computador. Quando o equipamento falhou, as informações ficaram indisponíveis. Surgiu a necessidade de um servidor em nuvem.
- **Atendimento ao cliente.** A responsável prefere conversar diretamente com os clientes, em vez de depender só de atendimento automatizado. Também quer um sistema simples, sem excesso de cadastros para pedidos básicos.
- **Controle financeiro.** Falta uma visão clara das entradas, das saídas e da margem do negócio.
- **Controle de estoque.** É preciso saber o que existe, onde está guardado (cozinha ou depósito) e quanto resta de cada item, com alerta quando um insumo estiver acabando.
- **Notificações.** A responsável quer avisos simples, preferencialmente pelo WhatsApp, sobre estoque baixo, necessidade de reposição e proximidade da data de entrega de pedidos.
- **Ferramentas separadas.** Há interesse em reunir no mesmo sistema as funcionalidades que hoje dependem do Anota.ai.

**Síntese:** falta uma solução centralizada, simples e segura para gerenciar pedidos, clientes, estoque, financeiro e entregas.

**Justificativa da escolha:** a organização existe de fato e o grupo tem acesso à responsável. Os problemas são reais e concretos e podem ser transformados em requisitos. O porte é adequado: tem processos suficientes para gerar um modelo relevante, sem ser complexo demais para esta etapa.

---

## 2. Processos de Negócio

Os processos estão agrupados em Vendas, Apoio e Compras. Onde a função é conhecida, indica-se quem executa.

### 2.1 Vendas

**P01 — Atendimento e cadastro de clientes** (Sthefany)
1. O cliente chega ao balcão ou entra em contato direto.
2. Se for compra de pronta-entrega no balcão, não há cadastro.
3. Se for encomenda ou delivery, a atendente registra nome, sobrenome, telefone e endereço.
4. Se o cliente já existe, o cadastro é reaproveitado.

**P02 — Registro de encomendas** (Sthefany)
1. A atendente combina com o cliente os produtos, as quantidades e as personalizações.
2. Define data e hora de entrega ou retirada e anexa a foto de referência, se houver.
3. Define o preço de cada item, que varia conforme a personalização.
4. O pedido é salvo com status "pendente" e tipo "encomenda".

**P03 — Venda de pronta-entrega no balcão** (Sthefany e Tuany)
1. O cliente escolhe produtos prontos.
2. A atendente registra o pedido (tipo "pronta-entrega") sem cliente cadastrado.
3. O pagamento é feito na hora (P07) e o pedido fica "entregue".

**P04 — Sinal e confirmação da encomenda** (Tuany)
1. Após combinar a encomenda, o caixa registra o pagamento do sinal (tipo "sinal").
2. Com o sinal confirmado, a encomenda segue para a produção.
3. O restante é quitado depois, até a entrega (P07).

**P05 — Cancelamento ou alteração de encomenda** (Sthefany)
1. O cliente pede o cancelamento ou a alteração.
2. Na alteração, a atendente ajusta itens, data ou observações e recalcula o valor total.
3. No cancelamento, o status passa a "cancelado".
4. Se houver sinal pago, o caixa decide com a responsável o que fazer; o pagamento pode ser marcado como "estornado".

**P06 — Produção pela receita** (Maria)
1. A cozinha consulta os pedidos pendentes e a data de entrega.
2. Consulta a receita do produto e a ficha técnica de insumos.
3. Prepara o produto e muda o status para "em produção".
4. Os insumos usados são baixados do estoque (P11).

**P07 — Pagamento** (Tuany)
1. O caixa registra cada pagamento com valor, forma (débito, crédito, Pix, dinheiro ou VR) e tipo (sinal, parcial ou quitação).
2. Um pedido pode ter vários pagamentos, inclusive com formas diferentes.
3. O status do pagamento é "pendente", "confirmado" ou "estornado".
4. Cada pagamento confirmado gera um lançamento de entrada no financeiro (P10).

**P08 — Entrega ou retirada** (Sthefany)
1. Na data combinada, o pedido é conferido e verifica-se se está quitado.
2. Se faltar pagamento, o caixa registra a quitação.
3. O produto é entregue (delivery) ou retirado no balcão, e o status passa a "entregue".

**P09 — Gestão do catálogo de produtos** (responsável)
1. Cadastro de categorias (bolos, doces, tortas) e de produtos, com tamanho, quantidade de pessoas e preço base.
2. Cadastro da receita de cada produto e dos insumos que ela usa.
3. Produtos que saem de linha são desativados, sem apagar o histórico de pedidos.

### 2.2 Apoio

**P10 — Controle financeiro** (Tuany e responsável)
1. Pagamentos confirmados geram entradas automaticamente.
2. Compras de insumos geram saídas; despesas avulsas são lançadas à mão.
3. A responsável consulta o resumo de entradas, saídas e margem.

**P11 — Controle de estoque e alerta** (Maria e responsável)
1. Os insumos são cadastrados com unidade de medida e estoque mínimo.
2. A quantidade é controlada em cada local de armazenamento (cozinha e depósito).
3. Entradas (compras), saídas (uso em produção), perdas e ajustes são registrados como movimentações.
4. Quando a soma do insumo nos locais chega ao mínimo, o sistema gera um alerta (P12).

**P12 — Notificações pelo WhatsApp** (sistema)
1. O sistema avisa a responsável sobre estoque baixo e necessidade de reposição.
2. Avisa sobre entregas próximas.
3. As mensagens usam o telefone cadastrado.

### 2.3 Compras

**P13 — Compra de insumos** (responsável)
1. Ao receber o alerta, a responsável escolhe o fornecedor.
2. Registra a compra com os insumos, quantidades e preços, com status "pedida".
3. Quando a mercadoria chega, segue para o recebimento (P14).

**P14 — Recebimento e conferência de insumos** (Maria)
1. Confere a mercadoria com a compra (itens e quantidades).
2. Registra a data de recebimento e a validade dos itens.
3. A compra passa a "recebida" e cada item gera uma movimentação de entrada no local escolhido.
4. A compra gera um lançamento de saída no financeiro (P10).

**Fluxo geral (resumo):** Cliente → Atendimento → Pedido → (Sinal) → Produção (receita + insumos) → Baixa no estoque → Pagamento → Lançamento financeiro → Entrega. Em paralelo: Alerta de estoque → Compra → Recebimento → Entrada no estoque.

---

## 3. Requisitos do Sistema

### 3.1 Requisitos Funcionais

- **RF01:** cadastrar, consultar e editar clientes com nome, sobrenome, telefone e endereço.
- **RF02:** registrar pedidos dos tipos pronta-entrega, encomenda e delivery, com itens, data e hora de entrega, observações e foto de referência.
- **RF03:** acompanhar o status do pedido (pendente, em produção, entregue, cancelado).
- **RF04:** definir o preço de cada item do pedido, pois o preço de encomendas varia com a personalização.
- **RF05:** cadastrar produtos, categorias, receitas e a ficha técnica (insumos de cada receita).
- **RF06:** cadastrar insumos, fornecedores e locais de armazenamento.
- **RF07:** registrar movimentações de estoque por insumo e por local, e consultar a quantidade disponível.
- **RF08:** alertar quando a quantidade total de um insumo atingir o estoque mínimo.
- **RF09:** registrar compras de insumos e o recebimento com conferência e validade.
- **RF10:** registrar vários pagamentos por pedido, com forma, tipo (sinal, parcial, quitação) e status (pendente, confirmado, estornado).
- **RF11:** registrar entradas e saídas financeiras e apresentar o resumo financeiro.
- **RF12:** enviar notificações pelo WhatsApp (estoque baixo, reposição e proximidade de entrega).
- **RF13:** controlar o acesso ao sistema por usuário, login e nível de acesso.

### 3.2 Requisitos Não Funcionais

- **RNF01 — Disponibilidade:** os dados ficam em servidor em nuvem, acessíveis remotamente.
- **RNF02 — Segurança:** os dados não dependem de um único computador, e as senhas são armazenadas com hash.
- **RNF03 — Usabilidade:** a interface é simples, exigindo poucos cadastros para operações básicas; o registro de uma venda de pronta-entrega não pode exigir cadastro de cliente.
- **RNF04 — Integração:** o sistema deve poder se integrar ao WhatsApp para notificações.
- **RNF05 — Desempenho:** consultas e registros do dia a dia devem responder em até 3 segundos.
- **RNF06 — Privacidade:** os dados pessoais dos clientes seguem a LGPD (ver regra RN20).

---

## 4. Regras de Negócio

### 4.1 Regras de encomenda e vendas

- **RN01:** pedidos de encomenda ou delivery exigem cliente cadastrado; a pronta-entrega no balcão não exige.
- **RN02:** para registrar uma encomenda são necessários: nome, sobrenome, telefone, endereço e data de entrega.
- **RN03:** a data de entrega de uma encomenda respeita uma antecedência mínima, definida pela responsável da loja e não pode ser anterior à data do pedido.
- **RN04:** a encomenda exige o pagamento de um sinal para ser confirmada e iniciar a produção; o percentual é definido pela responsável.
- **RN05:** o cliente pode quitar o restante após o sinal, até a entrega.
- **RN06:** o cancelamento de encomenda só é permitido até um prazo definido pela responsável; o tratamento do sinal já pago é decidido por ela (o pagamento pode ser marcado como "estornado").
- **RN07:** em delivery, a taxa de entrega, definida pela loja, é lançada como item do pedido e entra no valor total.
- **RN08:** todo pedido tem ao menos um item, e o valor total é a soma dos subtotais dos itens.
- **RN09:** o preço de produtos sob encomenda é definido no item do pedido, e mudanças futuras no preço base não alteram pedidos antigos.
- **RN10:** um cliente pode ter vários pedidos em andamento ao mesmo tempo.

### 4.2 Regras de pagamento e financeiro

- **RN11:** todo pagamento pertence a um pedido, e um pedido pode ter vários pagamentos.
- **RN12:** as formas de pagamento aceitas são cartão de débito, cartão de crédito, Pix, dinheiro e VR.
- **RN13:** a soma dos pagamentos confirmados de um pedido não pode ultrapassar o valor total.
- **RN14:** todo pagamento confirmado gera um lançamento de entrada, e toda compra recebida gera um lançamento de saída.

### 4.3 Regras de estoque e compras

- **RN15:** o estoque é controlado por insumo e por local de armazenamento (cozinha e depósito), e a quantidade nunca pode ser negativa.
- **RN16:** toda movimentação informa o insumo, o local, o tipo (entrada, saída, perda ou ajuste), a quantidade e a data.
- **RN17:** quando a quantidade total de um insumo (soma dos locais) ficar igual ou abaixo do estoque mínimo, o sistema gera um alerta.
- **RN18:** no recebimento de uma compra registra-se a validade dos insumos, e insumos vencidos são baixados como perda.

### 4.4 Restrições externas e de acesso

- **RN19 — Normas sanitárias:** a confeitaria deve seguir as normas de vigilância sanitária para alimentos. O sistema apoia essa obrigação com o controle de validade (RN18) e o registro de perdas, mas não substitui as rotinas sanitárias.
- **RN20 — LGPD:** os dados pessoais dos clientes (nome, sobrenome, telefone, endereço) são usados apenas para atender encomendas e enviar avisos sobre elas. Só usuários autorizados acessam esses dados, e o cliente pode pedir a correção ou a exclusão de seu cadastro.
- **RN21 — Cupom fiscal:** a emissão de cupom fiscal é obrigação da loja e fica fora do escopo deste modelo. O sistema guarda os pagamentos que dão origem à venda.
- **RN22 — Acesso:** o login do usuário é único, e o acesso às funções depende do nível de acesso.

### 4.5 Restrições organizacionais

- **Equipe reduzida:** com apenas três funcionárias, o sistema deve ser simples e evitar cadastros extensos.
- **Atendimento humano:** a responsável quer manter o contato direto com o cliente, então o sistema apoia o atendimento sem substituí-lo.
- **Armazenamento seguro:** os dados não podem ficar só em um computador local, o que justifica a hospedagem em nuvem.
- **Canal de comunicação:** os avisos usam o WhatsApp, canal já usado na rotina da empresa.

---

## 5. Dicionário de Dados

O dicionário completo, com tipos, obrigatoriedade e regras de cada atributo, está em [`dicionario.html`](dicionario.html) (versão 2.0). O quadro abaixo resume as entidades e os atributos principais.

| Entidade | Atributos principais |
|---|---|
| USUÁRIO | id_usuario, nome, login, senha (hash), nivel_acesso, ativo |
| CLIENTE | id_cliente, nome, sobrenome, telefone, endereço |
| PEDIDO | id_pedido, tipo_pedido, status, data_pedido, data_entrega, hora_entrega, valor_total, observações, foto_referência |
| ITEM_PEDIDO | id_item, quantidade, preço_unitário, personalização, subtotal |
| CATEGORIA_PRODUTO | id_categoria, nome, descrição, ativo |
| PRODUTO | id_produto, nome, descrição, tamanho, quantidade_pessoas, preço_base, ativo |
| RECEITA | id_receita, nome, modo_preparo, rendimento |
| ITEM_RECEITA | id_item_receita, quantidade_necessária |
| INSUMO | id_insumo, nome, categoria, unidade_medida, estoque_minimo, ativo |
| LOCAL_ARMAZENAMENTO | id_local, nome, descrição |
| ESTOQUE | id_estoque, quantidade_atual |
| MOVIMENTAÇÃO_ESTOQUE | id_movimentação, tipo_movimentação, quantidade, data_movimentação, motivo |
| FORNECEDOR | id_fornecedor, nome, telefone, endereço, ativo |
| COMPRA | id_compra, data_compra, data_recebimento, status, valor_total |
| ITEM_COMPRA | id_item_compra, quantidade, preço_unitário, validade |
| PAGAMENTO | id_pagamento, valor, forma_pagamento, tipo_pagamento, status_pagamento, data_pagamento |
| FINANCEIRO | id_lancamento, tipo, descrição, valor, data_lancamento |

As chaves estrangeiras aparecem no dicionário como apoio ao modelo lógico, mas não são desenhadas no DER conceitual.

---

## 6. Modelagem Conceitual

### 6.1 Entidades

| Entidade | Justificativa |
|---|---|
| USUÁRIO | Quem acessa o sistema e registra as operações |
| CLIENTE | Quem faz encomendas e delivery e recebe as notificações |
| PEDIDO | Registra cada venda (pronta-entrega, encomenda ou delivery), com datas, status e valor |
| ITEM_PEDIDO | Detalha produto, quantidade e preço de cada item do pedido |
| CATEGORIA_PRODUTO | Organiza os produtos (bolos, doces, tortas) |
| PRODUTO | Itens vendidos pela confeitaria |
| RECEITA | Define como cada produto é preparado |
| ITEM_RECEITA | Ficha técnica: quanto de cada insumo a receita usa |
| INSUMO | Ingredientes e materiais usados na produção |
| LOCAL_ARMAZENAMENTO | Cozinha, depósito e outros locais onde os insumos ficam |
| ESTOQUE | Quantidade de cada insumo em cada local |
| MOVIMENTAÇÃO_ESTOQUE | Histórico de entradas, saídas, perdas e ajustes |
| FORNECEDOR | Quem fornece os insumos |
| COMPRA | Compra de insumos, com data de recebimento |
| ITEM_COMPRA | Insumos, quantidades, preços e validade de cada compra |
| PAGAMENTO | Pagamentos de um pedido (sinal, parcial, quitação) |
| FINANCEIRO | Entradas e saídas financeiras da confeitaria |

### 6.2 Relacionamentos e cardinalidades

A notação (mín,máx) fica ao lado de cada entidade e indica quantas vezes uma ocorrência dela participa do relacionamento.

| Entidade A | Relacionamento | Entidade B |
|---|---|---|
| USUÁRIO (0,N) | registra | PEDIDO (1,1) |
| CLIENTE (0,N) | faz | PEDIDO (0,1) |
| PEDIDO (1,N) | contém | ITEM_PEDIDO (1,1) |
| ITEM_PEDIDO (1,1) | refere-se a | PRODUTO (0,N) |
| PRODUTO (1,1) | pertence a | CATEGORIA_PRODUTO (0,N) |
| PRODUTO (0,1) | tem | RECEITA (1,1) |
| RECEITA (1,N) | contém | ITEM_RECEITA (1,1) |
| ITEM_RECEITA (1,1) | usa | INSUMO (0,N) |
| INSUMO (0,N) | possui | ESTOQUE (1,1) |
| LOCAL_ARMAZENAMENTO (0,N) | guarda | ESTOQUE (1,1) |
| ESTOQUE (0,N) | sofre | MOVIMENTAÇÃO_ESTOQUE (1,1) |
| PEDIDO (0,N) | recebe | PAGAMENTO (1,1) |
| PAGAMENTO (0,1) | gera | FINANCEIRO (0,1) |
| COMPRA (0,1) | gera | FINANCEIRO (0,1) |
| FORNECEDOR (0,N) | fornece | COMPRA (1,1) |
| COMPRA (1,N) | contém | ITEM_COMPRA (1,1) |
| ITEM_COMPRA (1,1) | refere-se a | INSUMO (0,N) |
| USUÁRIO (0,N) | lança | FINANCEIRO (1,1) |

**Restrições e políticas aplicadas ao modelo:** poucos campos obrigatórios (equipe reduzida); cliente obrigatório só em encomenda e delivery; telefone obrigatório quando há cliente (notificações pelo WhatsApp); estoque mínimo por insumo; senha em hash.

---

## 7. Diagrama Entidade-Relacionamento (DER)

![DER da Sweet Thuty](DER_CONFEITARIA_v2.png)

O diagrama mostra as 17 entidades com seus atributos, os 18 relacionamentos e as cardinalidades mínima e máxima. Arquivo editável: [`DER_CONFEITARIA_v2.drawio`](DER_CONFEITARIA_v2.drawio).

**Principais mudanças em relação à versão 1.0**

- Todos os relacionamentos agora têm cardinalidade (mín,máx).
- Entidades novas: ITEM_RECEITA, LOCAL_ARMAZENAMENTO, COMPRA e ITEM_COMPRA.
- ITEM_PEDIDO tem quantidade, preço e personalização, em vez de repetir atributos do pedido.
- ESTOQUE passou a guardar a quantidade de cada insumo em cada local e perdeu os atributos de cliente.
- FORNECEDOR ganhou identificador próprio.
- A receita liga-se ao produto e, pela ficha técnica, aos insumos.
- O pedido aceita cliente opcional (pronta-entrega) e vários pagamentos, com sinal.
- Chaves estrangeiras saíram do desenho conceitual.

---

## 8. Justificativa Técnica

- **PEDIDO e ITEM_PEDIDO separados:** um pedido tem vários produtos, e cada item guarda quantidade e preço da venda. Como o preço de encomendas varia com a personalização, o preço do item pode ser diferente do preço base, e mudanças futuras não alteram pedidos antigos.
- **Cliente opcional no pedido:** a loja só precisa de cadastro em delivery e encomenda. A pronta-entrega no balcão não exige cliente, o que mantém o atendimento rápido.
- **PAGAMENTO separado de PEDIDO:** a loja recebe sinal e quitação depois, às vezes com formas diferentes. Por isso o pedido tem vários pagamentos, cada um com tipo e status.
- **PAGAMENTO e FINANCEIRO separados:** o pagamento está ligado ao pedido, enquanto o financeiro também cobre saídas (compras, despesas), que não têm pedido.
- **CATEGORIA_PRODUTO como entidade própria:** evita repetir o nome da categoria em cada produto e facilita criar novas categorias.
- **RECEITA e ITEM_RECEITA:** a receita fica ligada ao produto, e a ficha técnica liga a receita aos insumos. Isso permite à cozinha consultar o preparo e, no futuro, baixar o estoque automaticamente.
- **ESTOQUE por local:** a loja guarda parte do insumo na cozinha e parte no depósito. A entidade ESTOQUE liga cada insumo a cada local, e o alerta de mínimo usa a soma dos locais.
- **ESTOQUE e MOVIMENTAÇÃO_ESTOQUE separados:** o estoque guarda a quantidade atual, e a movimentação guarda o histórico, o que permite rastrear entradas, saídas e perdas.
- **COMPRA e ITEM_COMPRA:** ligam fornecedor, insumo, preço e validade, e permitem registrar o recebimento e gerar o lançamento financeiro.
- **LOCAL_ARMAZENAMENTO como entidade:** evita escrever o nome do local em cada registro e permite incluir novos locais.
- **USUÁRIO como entidade:** controla o acesso por login e nível de permissão, necessário por haver mais de uma pessoa operando o sistema.
- **Cadastro enxuto de CLIENTE:** reflete o pedido da responsável por menos burocracia, mantendo só os dados necessários (nome, sobrenome, telefone e endereço).

---

## 9. Uso de Inteligência Artificial

### ChatGPT

| Item | Registro |
|---|---|
| **Ferramenta e etapa** | ChatGPT, nas funcionalidades e na decoração do site |
| **Motivação** | Dúvidas sobre as funcionalidades do site, principalmente a visualização |
| **Prompt(s) utilizados** | Perguntas sobre CSS e layout, como sombras, a frase decorativa e títulos com símbolo |
| **Resposta recebida** | Trechos de CSS e sugestões de layout; também uma imagem de DER com letras e símbolos ilegíveis |
| **Fontes consultadas e verificadas** | A IA foi usada apenas para o site e a decoração; o resultado foi testado no próprio site |
| **Trechos rejeitados ou corrigidos** | O DER gerado foi descartado por ser ilegível, e o grupo o refez no draw.io |
| **Justificativa da escolha final** | Foram mantidos só os trechos de CSS que funcionaram no site; o DER foi feito pelo grupo para garantir legibilidade e correção do conteúdo |
| **Reflexão crítica** | Limitação na geração de imagens e alucinação da IA, com palavras em inglês no DER onde deveria haver português |

### Claude (Anthropic) — dicionário de dados e HTML (versão 1.0)

| Item | Registro |
|---|---|
| **Ferramenta e etapa** | Claude, na elaboração do dicionário de dados e na sua versão em HTML para o site |
| **Motivação** | Organizar o dicionário de dados a partir da imagem do DER e adaptá-lo ao site |
| **Prompt(s) utilizados** | "Faça um dicionário de dados" (com a imagem do DER anexada); "em HTML"; "faça apenas o código"; "preciso adicionar essa parte do dicionário no site"; "modelo README GitHub texto limpo" |
| **Resposta recebida** | Dicionário de dados em tabelas e em HTML, com atributos, descrições e regras |
| **Fontes consultadas e verificadas** | O conteúdo foi baseado no DER do grupo e conferido com ele |
| **Trechos rejeitados ou corrigidos** | A IA apontou inconsistências no DER (ESTOQUE, FORNECEDORES, ITEM_PEDIDOS), tratadas pelo grupo na versão 2.0 |
| **Justificativa da escolha final** | O grupo manteve a estrutura em tabelas por ser clara e fácil de conferir com o DER |
| **Reflexão crítica** | Os tipos de dados são sugestões da IA e dependem da validação do grupo e da escolha do banco |

### Claude (Anthropic) — revisão para a versão 2.0

| Item | Registro |
|---|---|
| **Ferramenta e etapa** | Claude, na atualização do DER, do dicionário de dados e deste README, após a correção do professor |
| **Motivação** | Corrigir o DER (cardinalidades, chaves estrangeiras, atributos trocados, entidades faltando) e incorporar as respostas de uma nova visita à loja |
| **Prompt(s) utilizados** | Envio do DER antigo, do link do dicionário e das respostas da loja, com o pedido de "montar um DER atualizado de acordo com o que o professor pediu e está faltando"; depois "dicionário de dados em HTML atualizado", "manda o código" e "README atualizado" |
| **Resposta recebida** | Novo DER (PNG e arquivo editável do draw.io) com 17 entidades e 18 relacionamentos com (mín,máx); dicionário HTML versão 2.0; texto deste README |
| **Fontes consultadas e verificadas** | As respostas da responsável sobre sinal, pagamentos, estoque por local, preço variável e cadastro de cliente; o feedback do professor; o dicionário anterior do grupo |
| **Trechos rejeitados ou corrigidos** | O grupo revisou os valores sugeridos pela IA (status de compra, tipos de movimentação, tipos de dados MySQL) e os valores das regras de encomenda, que dependem da responsável (antecedência, percentual do sinal, prazo de cancelamento, taxa de entrega) |
| **Justificativa da escolha final** | O modelo novo foi adotado porque cada mudança responde a um erro apontado pelo professor ou a uma resposta da loja; as decisões de modelagem (receita 0,1 por produto, `tipo_pedido`, ESTOQUE por local) foram discutidas e aceitas pelo grupo |
| **Reflexão crítica** | A IA pode inventar detalhes que a loja não confirmou, por isso as regras com valores reais ficaram como definição da responsável; o grupo conferiu o DER, o dicionário e este texto antes de entregar |
