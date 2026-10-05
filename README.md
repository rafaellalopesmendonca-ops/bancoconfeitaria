# Entrega 1 — Modelo Conceitual (DER)
### Modelagem de um sistema de gestão de informações para uma organização de pequeno porte

> Este arquivo é o esqueleto do **README.md** do repositório GitHub do seu grupo.
> Preencha cada seção abaixo. Não apague os títulos — apenas substitua as instruções em *itálico* pelo conteúdo do seu projeto.
> O **DER** é anexado separadamente ao repositório (em imagem), mas sua justificativa entra neste README.
>
> **A organização escolhida pode ser de qualquer natureza:** empresa com fins lucrativos (livraria, lanchonete, pet shop), ONG, associação comunitária, cooperativa, instituições religiosas/comunitárias como igrejas, terreiros de religiões de matriz africana (candomblé, umbanda) ou outras. O que muda de um tipo para outro são os processos e as regras específicas — a estrutura do trabalho (levantamento de requisitos, modelagem conceitual, DER) é a mesma para todas. Termos como "empresa" e "negócio" usados abaixo devem ser lidos de forma ampla, no sentido técnico de modelagem de dados (ex.: "regras de negócio" = regras de funcionamento da organização, seja ela comercial, religiosa ou social).
>
> **Importante:** a organização precisa **existir de fato** — não é permitido inventar uma organização fictícia. O levantamento de requisitos e regras de negócio deve ser feito por meio de **pesquisa de campo na própria organização** (visitas, entrevistas com responsáveis, observação dos processos reais), então o grupo só deve escolher uma organização à qual **realmente tenha acesso**. Ao escolher, tomem cuidado com o porte: **nem tão pequena** que não gere dados suficiente para o trabalho (poucos processos, poucas entidades), **nem tão grande/complexa** que fique inviável de modelar nesta primeira etapa do curso.

---

## Metadados

- **Nomes dos alunos e RGM**

- David Mota Marques RGM: 47753251
- Lucas Ronaldo Gasparotto Machado RGM: 47297166
- Luiz Paulo Alves Souza Coelho Freitas RGM: 47779829
- Rafaella Lopes Mendonça Tolentino RGM: 48033863

## 1. Caracterização da Organização
*(vale 7,5% — Dimensão Conceitual)*

- Nome e natureza da organização: Sweet Thuty, estabelecimento comercial focado em confeitaria
  
- **Contexto e porte:** A organização analisada é um estabelecimento de pequeno porte, com fins lucrativos, voltado para o atendimento e comercialização de produtos alimentícios. Atualmente, a operação conta com 3 funcionárias, cada uma responsável por uma função específica no funcionamento diário do estabelecimento.

Sthefany: responsável pelo atendimento no balcão e pelo contato direto com os clientes;

Tuany: responsável pelo caixa e pelo recebimento dos pagamentos;

Maria: responsável pela cozinha e pela preparação dos produtos.

Por possuir uma equipe reduzida, as atividades são distribuídas entre as três funcionárias, sendo necessário manter uma boa organização dos processos para garantir o atendimento aos clientes, o controle das vendas e o funcionamento adequado da cozinha. O estabelecimento realiza atividades de atendimento ao público e vendas de produtos alimentícios, tendo seu volume de atividades diretamente relacionado ao fluxo diário

- **Problemas e necessidades identificados:

A organização apresenta atualmente alguns problemas relacionados principalmente ao gerenciamento dos pedidos, atendimento aos clientes, armazenamento dos dados, controle de estoque e acompanhamento financeiro.

Um dos principais problemas ocorreu com o aplicativo Anota.ai, utilizado anteriormente pela organização. Segundo o relato da responsável, havia dificuldades relacionadas ao atendimento e ao suporte oferecido pela plataforma. Atualmente, a organização utiliza o sistema Consumer, principalmente pela possibilidade de acesso remoto. Entretanto, houve um problema quando o computador utilizado pela empresa apresentou uma falha, pois parte dos dados estava armazenada no disco do equipamento. Isso demonstrou a necessidade de uma solução mais segura para o armazenamento das informações, evitando que uma falha no computador resulte na perda ou indisponibilidade dos dados.

Outro problema identificado está relacionado ao atendimento ao cliente. A responsável prefere ter a possibilidade de conversar diretamente com os clientes, em vez de depender exclusivamente de atendimentos automatizados por robôs. Ela também busca um sistema mais simples e prático, que não exija uma quantidade excessiva de cadastros ou informações para realizar pedidos simples, como a encomenda de um bolo.

Também existe uma necessidade de melhorar o controle financeiro e operacional. A responsável gostaria de visualizar de forma clara as entradas e saídas da empresa, além de acompanhar sua margem e ter informações que permitam compreender melhor a situação financeira do negócio.

Em relação ao estoque, existe a necessidade de saber quais produtos e recursos estão disponíveis, onde estão armazenados e quanto ainda resta de cada item. O sistema também deveria emitir alertas quando determinado recurso estiver próximo de acabar, permitindo que a responsável se antecipe à falta de materiais.

Outro ponto importante é a necessidade de notificações simples e acessíveis. Em vez de informações complexas ou difíceis de interpretar, a responsável gostaria de receber avisos de maneira clara, preferencialmente por um canal que já utilize no dia a dia, como o WhatsApp, informando situações como estoque baixo, necessidade de reposição e proximidade da data de entrega de um pedido.

A organização também identificou a necessidade de um servidor em nuvem, permitindo que os dados sejam armazenados com maior segurança e acessados remotamente, independentemente de um único computador. Além disso, existe o interesse em integrar as funcionalidades utilizadas atualmente no Anota.ai ao próprio sistema de gerenciamento da confeitaria, evitando a necessidade de utilizar diversas ferramentas separadas.

Por fim, o sistema ideal deverá permitir o acompanhamento dos pedidos e das datas de entrega, enviando lembretes antecipados e próximos à data programada. Dessa forma, a responsável poderá se organizar com antecedência para a produção e entrega dos pedidos.

Diante desses problemas, a principal crise operacional identificada pode ser resumida como a falta de uma solução centralizada, simples e segura para gerenciar pedidos, clientes, estoque, informações financeiras e entregas, além da dependência de sistemas externos e do armazenamento de dados em equipamentos locais.


- Justificativa da escolha:


A organização foi escolhida para o desenvolvimento do projeto por apresentar necessidades reais de organização, controle e gerenciamento das atividades, permitindo que o grupo desenvolva uma solução diretamente relacionada aos problemas enfrentados no dia a dia da empresa.

A confeitaria possui uma equipe pequena, formada por três funcionárias, o que torna ainda mais importante a utilização de ferramentas simples e eficientes para auxiliar na administração dos pedidos, estoque, atendimento e informações financeiras. Atualmente, a organização utiliza diferentes recursos e sistemas, mas já enfrentou dificuldades com o atendimento, armazenamento de dados e dependência de equipamentos específicos.

Um dos principais motivos para a escolha foi a ocorrência de problemas relacionados à perda ou indisponibilidade de informações quando o computador apresentou uma falha, evidenciando a necessidade de um sistema com armazenamento em nuvem e maior segurança dos dados. Além disso, a responsável demonstrou interesse em ter uma ferramenta centralizada que facilite o acompanhamento dos pedidos, controle o estoque, apresente as entradas e saídas financeiras e gere alertas sobre recursos próximos do fim e pedidos próximos da data de entrega.

A organização também se mostrou um bom caso para o projeto porque a responsável possui uma visão clara sobre suas necessidades e está aberta à utilização de uma solução tecnológica que seja prática, simples e adequada à rotina da empresa. Entre suas principais expectativas estão a redução de cadastros desnecessários, a possibilidade de manter um contato mais direto com os clientes e o recebimento de avisos por meios de comunicação que já fazem parte de sua rotina, como o WhatsApp.

Dessa forma, a organização apresenta um cenário adequado para o desenvolvimento do projeto, pois os problemas identificados são concretos e podem ser transformados em requisitos para um sistema de gerenciamento integrado. A solução proposta poderá contribuir para centralizar as informações, melhorar o controle dos pedidos e do estoque, aumentar a segurança dos dados e facilitar a tomada de decisões pela responsável.

Portanto, a escolha da organização se justifica pela possibilidade de desenvolver uma solução tecnológica baseada em necessidades reais de uma pequena empresa, proporcionando uma aplicação prática dos conhecimentos adquiridos no projeto e buscando gerar benefícios para a rotina operacional da organização.




## 2. Processos de Negócio
*(vale 10% — Dimensão Procedimental)*

- **Principais processos mapeados:** *ex.: cadastro de clientes/beneficiários/fiéis, controle de estoque ou doações, vendas ou arrecadação, emissão de pedidos ou solicitações, entregas ou distribuição, organização de eventos/rituais/mutirões.*
- **Fluxogramas:** (Opcional) *represente visualmente pelo menos os processos-chave (imagens anexadas). Deve ficar claro o fluxo de cada processo e como eles se integram entre si.*

---

## 3. Requisitos do Sistema
*(esta seção e a Seção 4 "Regras de Negócio" DIVIDEM 7,5% na dimensão conceitual — juntas valem 7,5%, não 7,5% cada — + 4% exclusivos desta seção na organização/documentação)*

### 3.1 Requisitos Funcionais
*O que o sistema precisa FAZER (ex.: "o sistema deve permitir registrar uma venda").*

### 3.2 Requisitos Não Funcionais
*Características de qualidade (ex.: desempenho, segurança, usabilidade, disponibilidade).*

---

## 4. Regras de Negócio
*(esta seção DIVIDE com a Seção 3 "Requisitos do Sistema" os mesmos 7,5% da dimensão conceitual — juntas valem 7,5%, não 7,5% cada — + 4% exclusivos desta seção na documentação. "Regras de negócio" é o termo técnico usado em modelagem de dados para as regras de funcionamento de qualquer organização, com ou sem fins lucrativos)*

- **Regras operacionais:** *condições que a organização impõe (ex.: "um pedido só pode ser fechado se houver estoque disponível", "uma doação só pode ser registrada com identificação do doador", "um ritual só pode ser agendado se o espaço estiver disponível").*
- **Restrições organizacionais:** *limitações que afetam o modelo (ex.: políticas internas, prazos, exigências legais, normas religiosas ou estatutárias) — e por que elas importam.*

---

## 5. Dicionário de Dados Conceitual (Preliminar)
*(vale 10% — Dimensão Procedimental - Segue o modelo do arquivo 02-03g_Exemplo_Dicionario_Dados.pdf)*

Para cada entidade identificada, liste:

| Atributo | Descrição | Regra de negócio associada |
|----------|-----------|------------------------------|
| *nome do atributo* | *o que ele representa* | *se houver alguma regra (obrigatoriedade, valores possíveis, etc.)* |

*Mantenha o dicionário organizado e padronizado (mesmo formato de tabela para todas as entidades).*

**Atenção à privacidade:** se forem usados exemplos de valores para ilustrar os atributos, esses exemplos devem ser **fictícios** — não utilize dados reais de clientes, fiéis, beneficiários, doadores ou funcionários da organização (nomes, CPFs, contatos etc.), mesmo que tenham sido observados durante a pesquisa de campo. Os exemplos devem apenas ser **coerentes com as operações reais** observadas.

---

## 6. Modelagem Conceitual (Entidades, Atributos, Relacionamentos)
*(vale 7,5% na dimensão conceitual)*

- **Entidades reconhecidas:** *liste e justifique brevemente cada uma.*
- **Atributos e classificações:** *quais atributos pertencem a cada entidade.*
- **Relacionamentos pertinentes:** *como as entidades se conectam.*
- **Restrições e políticas organizacionais aplicadas ao modelo.**

---

## 7. Diagrama Entidade-Relacionamento (DER)
*(vale 20% — é o item de maior peso da entrega)*

- Anexe o DER (em imagem).
- O diagrama deve representar corretamente:
  - Entidades
  - Atributos
  - Relacionamentos
  - **Cardinalidades**
- O modelo deve ser **consistente** e já demonstrar potencial de **escalabilidade e integração** (pensando nas próximas etapas do projeto).

---

## 8. Justificativa Técnica
*(vale 7,5% — sozinho, é o subcritério de maior peso dentro da Dimensão Conceitual)*

*Explique e defenda as decisões de abstração e modelagem tomadas: por que essas entidades, esses atributos, esses relacionamentos e essas cardinalidades — e não outras alternativas possíveis?*

---

## 9. Uso de Inteligência Artificial
*(documentação obrigatória — não é opcional se o grupo usou IA em qualquer etapa: pesquisa, escrita, organização de ideias ou revisão de texto)*

Se o grupo usou alguma ferramenta de IA (ChatGPT, Claude, Gemini, Perplexity etc.) em qualquer parte do trabalho, registre **para cada uso relevante**:


| **Ferramenta e etapa** | Qual IA foi usada e em qual parte do trabalho: CHATGPT PARA FUNCIONALIDADES DO SITE
| **Motivação**: POIS TINHAMOS DÚVIDAS REFERENTES AOS FUNCIONALIDADES DO SITE, PRINCIPALMENTE A VISUALIZAÇÃO.
| **Prompt(s) utilizados** 
    box-shadow:
        0 5px 20px rgba(100, 45, 45, 0.08);

        .frase-decorativa {
    width: 220px;

    align-self: center;

    text-align: center;

    font-family:
        "Brush Script MT",
        "Segoe Script",
        cursive;

    font-size: 21px;

    color: #87545b;

    transform: rotate(-3deg);

    padding: 20px;
}

.conteudo-secao h2::after {
    content: " ♥";

    font-family: Arial, sans-serif;

    font-size: 15px;

    color: #d96e88;
}


| **Fontes consultadas e verificadas** USAMOS A IA APENAS PARA A FUNCIONALIDADE DO SITE E A DECORAÇÃO, A PARTE REFERENTE AO BANCO DE DADOS, FOI FEITA SEM IA 
| **Trechos rejeitados ou corrigidos** DER COM LETRAS E SIMBOLOS INELEGIVEIS 
| **Reflexão crítica** | LIMITAÇÃO NAS IMAGENS, ALUCINAÇÃO DA IA (APARECIMENTO DE PALAVRAS EM INGLES NO DER NO QUE DEVERIA SER EM PORTUGUÊS)


---

## Critérios Atitudinais (20%)
**Estes critérios NÃO constam explicitamente como item de entrega no README.** Eles são avaliados por meio de **Avaliação 360º entre os integrantes do grupo** (cada membro avalia os colegas de equipe) e, no caso da Colaboração, também pela **colaboração equilibrada no histórico de commits** do repositório GitHub — não pela leitura do restante do repositório nem pela apresentação:

- **Participação (5%):** envolvimento nas discussões técnicas e nas decisões do grupo.
- **Comprometimento (5%):** cumprimento de prazos e responsabilidades assumidas.
- **Colaboração (5%):** respeito às contribuições dos colegas, cooperação na construção do projeto e colaboração equilibrada no histórico de commits do repositório GitHub.
- **Autonomia (5%):** busca independente de soluções e proposta de melhorias.

---

## Resumo dos Pesos

| Dimensão | Peso total |
|----------|-----------|
| Conceitual (contexto, requisitos/regras, modelagem, justificativa técnica) | 30% |
| Procedimental (requisitos, fluxogramas, dicionário de dados, DER) | 50% |
| Atitudinal (participação, comprometimento, colaboração, autonomia) | 20% |

**Entrega final:** README.md completo + DER + Dicionário de Dados em HTML (com exceção dos cursos GTI) anexado no repositório GitHub do grupo.
