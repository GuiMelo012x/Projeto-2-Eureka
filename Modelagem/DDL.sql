CREATE TABLE Pessoa (
    ID_Pessoa INT PRIMARY KEY,
    Nome VARCHAR(100),
    Sobrenome VARCHAR(100),
    CPF VARCHAR(11),
    Email VARCHAR(100),
    Telefone VARCHAR(15),
    Endereco VARCHAR(255)
);

CREATE TABLE Cliente (
    ID_Cliente INT PRIMARY KEY,
    ID_Pessoa INT,
    CONSTRAINT FK_Cliente_Pessoa FOREIGN KEY (ID_Pessoa) REFERENCES Pessoa(ID_Pessoa)
);

CREATE TABLE Mesa (
    ID_Mesa INT PRIMARY KEY,
    Localizacao VARCHAR(100),
    Numero_mesa INT,
    Numero_cadeiras INT,
    Status VARCHAR(50)
);

CREATE TABLE Pedido (
    ID_Pedido INT PRIMARY KEY,
    Data DATE,
    Hora TIME,
    Tipo VARCHAR(50),
    Observacoes TEXT,
    ID_Cliente INT,
    ID_Mesa INT,
    CONSTRAINT FK_Pedido_Cliente FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente),
    CONSTRAINT FK_Pedido_Mesa FOREIGN KEY (ID_Mesa) REFERENCES Mesa(ID_Mesa)
);

CREATE TABLE Itens (
    ID_Item INT PRIMARY KEY,
    Quantidade INT,
    Preco DECIMAL(10,2),
    Ingredientes TEXT,
    ID_Pedido INT,
    CONSTRAINT FK_Itens_Pedido FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido)
);

CREATE TABLE Paciente (
    ID_Paciente INT PRIMARY KEY,
    ID_Pessoa INT,
    CONSTRAINT FK_Paciente_Pessoa FOREIGN KEY (ID_Pessoa) REFERENCES Pessoa(ID_Pessoa)
);

CREATE TABLE Medico (
    ID_Medico INT PRIMARY KEY,
    CRM VARCHAR(20),
    Especializacao VARCHAR(50),
    ID_Pessoa INT,
    CONSTRAINT FK_Medico_Pessoa FOREIGN KEY (ID_Pessoa) REFERENCES Pessoa(ID_Pessoa)
);

CREATE TABLE Consulta (
    ID_Consulta INT PRIMARY KEY,
    Data_consulta DATE,
    Hora_consulta TIME,
    Receita TEXT,
    ID_Paciente INT,
    ID_Medico INT,
    CONSTRAINT FK_Consulta_Paciente FOREIGN KEY (ID_Paciente) REFERENCES Paciente(ID_Paciente),
    CONSTRAINT FK_Consulta_Medico FOREIGN KEY (ID_Medico) REFERENCES Medico(ID_Medico)
);

CREATE TABLE Funcionario (
    ID_Funcionario INT PRIMARY KEY,
    Turno VARCHAR(20),
    Cargo VARCHAR(50),
    ID_Pessoa INT,
    CONSTRAINT FK_Funcionario_Pessoa FOREIGN KEY (ID_Pessoa) REFERENCES Pessoa(ID_Pessoa)
);

CREATE TABLE Recepcao (
    ID_Recepcao INT PRIMARY KEY,
    Nome_recepcionista VARCHAR(100),
    Turno VARCHAR(20),
    ID_Funcionario INT,
    ID_Paciente INT,
    CONSTRAINT FK_Recepcao_Funcionario FOREIGN KEY (ID_Funcionario) REFERENCES Funcionario(ID_Funcionario),
    CONSTRAINT FK_Recepcao_Paciente FOREIGN KEY (ID_Paciente) REFERENCES Paciente(ID_Paciente)
);

CREATE TABLE Evento (
    ID_Evento INT PRIMARY KEY,
    Tipo_evento VARCHAR(50),
    Data_inicio DATE,
    Data_fim DATE,
    Hora_evento TIME,
    ID_Lugar INT,
    CONSTRAINT FK_Evento_Lugar FOREIGN KEY (ID_Lugar) REFERENCES Lugar(ID_Lugar)
);

CREATE TABLE Lugar (
    ID_Lugar INT PRIMARY KEY,
    Nome VARCHAR(100),
    Endereco VARCHAR(255),
    Capacidade INT
);

CREATE TABLE Participante (
    ID_Participante INT PRIMARY KEY,
    ID_Pessoa INT,
    CONSTRAINT FK_Participante_Pessoa FOREIGN KEY (ID_Pessoa) REFERENCES Pessoa(ID_Pessoa)
);

CREATE TABLE Inscricao (
    ID_Inscricao INT PRIMARY KEY,
    Data_Inscricao DATE,
    Status VARCHAR(20),
    ID_Evento INT,
    ID_Participante INT,
    CONSTRAINT FK_Inscricao_Evento FOREIGN KEY (ID_Evento) REFERENCES Evento(ID_Evento),
    CONSTRAINT FK_Inscricao_Participante FOREIGN KEY (ID_Participante) REFERENCES Participante(ID_Participante)
);
