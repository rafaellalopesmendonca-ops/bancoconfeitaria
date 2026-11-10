
DROP TABLE IF EXISTS financeiro;
DROP TABLE IF EXISTS pagamento;
DROP TABLE IF EXISTS item_compra;
DROP TABLE IF EXISTS compra;
DROP TABLE IF EXISTS fornecedor;
DROP TABLE IF EXISTS movimentacao_estoque;
DROP TABLE IF EXISTS estoque;
DROP TABLE IF EXISTS local_armazenamento;
DROP TABLE IF EXISTS item_receita;
DROP TABLE IF EXISTS insumo;
DROP TABLE IF EXISTS receita;
DROP TABLE IF EXISTS item_pedido;
DROP TABLE IF EXISTS pedido;
DROP TABLE IF EXISTS produto;
DROP TABLE IF EXISTS categoria_produto;
DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS usuario;

CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    login VARCHAR(50) NOT NULL UNIQUE,
    senha_hash VARCHAR(255) NOT NULL,
    nivel_acesso VARCHAR(30) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    sobrenome VARCHAR(100),
    telefone VARCHAR(20),
    endereco VARCHAR(255)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE categoria_produto (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    ativo BOOLEAN NOT NULL DEFAULT TRUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    id_categoria INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    tamanho VARCHAR(50),
    quantidade_pessoas INT,
    preco_base DECIMAL(10,2) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    FOREIGN KEY (id_categoria) REFERENCES categoria_produto(id_categoria),
    CHECK (preco_base >= 0),
    CHECK (quantidade_pessoas IS NULL OR quantidade_pessoas > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_cliente INT,
    tipo_pedido VARCHAR(30) NOT NULL,
    status VARCHAR(30) NOT NULL,
    data_pedido DATE NOT NULL,
    data_entrega DATE,
    hora_entrega TIME,
    valor_total DECIMAL(10,2) NOT NULL DEFAULT 0,
    observacoes TEXT,
    foto_referencia VARCHAR(255),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    CHECK (tipo_pedido IN ('pronta-entrega', 'encomenda', 'delivery')),

    CHECK (tipo_pedido NOT IN ('encomenda', 'delivery') OR id_cliente IS NOT NULL),
    CHECK (valor_total >= 0),
    CHECK (data_entrega IS NULL OR data_entrega >= data_pedido)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE item_pedido (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    personalizacao TEXT,

    subtotal DECIMAL(10,2) GENERATED ALWAYS AS (quantidade * preco_unitario) STORED,
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto),
    UNIQUE (id_pedido, id_produto),
    CHECK (quantidade > 0),
    CHECK (preco_unitario >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE receita (
    id_receita INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL,
    modo_preparo TEXT,
    rendimento INT,
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto),
    CHECK (rendimento IS NULL OR rendimento > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE insumo (
    id_insumo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    categoria VARCHAR(100),
    unidade_medida VARCHAR(30) NOT NULL,
    estoque_minimo DECIMAL(10,3) NOT NULL DEFAULT 0,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    CHECK (estoque_minimo >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE item_receita (
    id_item_receita INT AUTO_INCREMENT PRIMARY KEY,
    id_receita INT NOT NULL,
    id_insumo INT NOT NULL,
    quantidade_necessaria DECIMAL(10,3) NOT NULL,
    FOREIGN KEY (id_receita) REFERENCES receita(id_receita),
    FOREIGN KEY (id_insumo) REFERENCES insumo(id_insumo),
    UNIQUE (id_receita, id_insumo),
    CHECK (quantidade_necessaria > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE local_armazenamento (
    id_local INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE estoque (
    id_estoque INT AUTO_INCREMENT PRIMARY KEY,
    id_insumo INT NOT NULL,
    id_local INT NOT NULL,
    quantidade_atual DECIMAL(10,3) NOT NULL DEFAULT 0,
    FOREIGN KEY (id_insumo) REFERENCES insumo(id_insumo),
    FOREIGN KEY (id_local) REFERENCES local_armazenamento(id_local),
    UNIQUE (id_insumo, id_local),
    CHECK (quantidade_atual >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE movimentacao_estoque (
    id_movimentacao INT AUTO_INCREMENT PRIMARY KEY,
    id_estoque INT NOT NULL,
    tipo_movimentacao VARCHAR(30) NOT NULL,
    quantidade DECIMAL(10,3) NOT NULL,
    data_movimentacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    motivo TEXT,
    FOREIGN KEY (id_estoque) REFERENCES estoque(id_estoque),
    CHECK (tipo_movimentacao IN ('entrada', 'saida', 'perda', 'ajuste')),
    CHECK (quantidade > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE fornecedor (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    endereco VARCHAR(255),
    ativo BOOLEAN NOT NULL DEFAULT TRUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE compra (
    id_compra INT AUTO_INCREMENT PRIMARY KEY,
    id_fornecedor INT NOT NULL,
    data_compra DATE NOT NULL,
    data_recebimento DATE,
    status VARCHAR(30) NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL DEFAULT 0,
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedor(id_fornecedor),
    CHECK (valor_total >= 0),
    CHECK (data_recebimento IS NULL OR data_recebimento >= data_compra)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE item_compra (
    id_item_compra INT AUTO_INCREMENT PRIMARY KEY,
    id_compra INT NOT NULL,
    id_insumo INT NOT NULL,
    quantidade DECIMAL(10,3) NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    validade DATE,
    FOREIGN KEY (id_compra) REFERENCES compra(id_compra),
    FOREIGN KEY (id_insumo) REFERENCES insumo(id_insumo),
    CHECK (quantidade > 0),
    CHECK (preco_unitario >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    forma_pagamento VARCHAR(30) NOT NULL,
    tipo_pagamento VARCHAR(30) NOT NULL,
    status_pagamento VARCHAR(30) NOT NULL,
    data_pagamento DATETIME,
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
    CHECK (valor > 0),
    CHECK (forma_pagamento IN ('debito', 'credito', 'pix', 'dinheiro', 'vr')),
    CHECK (tipo_pagamento IN ('sinal', 'parcial', 'quitacao')),
    CHECK (status_pagamento IN ('pendente', 'confirmado', 'estornado'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE financeiro (
    id_lancamento INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_pagamento INT,
    id_compra INT,
    tipo VARCHAR(30) NOT NULL,
    descricao TEXT,
    valor DECIMAL(10,2) NOT NULL,
    data_lancamento DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_pagamento) REFERENCES pagamento(id_pagamento),
    FOREIGN KEY (id_compra) REFERENCES compra(id_compra),
    CHECK (tipo IN ('entrada', 'saida')),
    CHECK (valor >= 0),

    CHECK ((id_pagamento IS NOT NULL AND id_compra IS NULL)
        OR (id_pagamento IS NULL AND id_compra IS NOT NULL))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
