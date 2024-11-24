from django.db import models

# Representa informações pessoais gerais
class Pessoa(models.Model):
    nome = models.CharField(max_length=100)  # Nome da pessoa
    sobrenome = models.CharField(max_length=100)  # Sobrenome da pessoa
    cpf = models.CharField(max_length=11, unique=True)  # CPF único
    email = models.EmailField()  # Email da pessoa
    telefone = models.CharField(max_length=15)  # Telefone de contato
    endereco = models.CharField(max_length=255)  # Endereço residencial

    def __str__(self):
        return f"{self.nome} {self.sobrenome}"  # Representação legível no admin


# Representa clientes, cada cliente está vinculado a uma Pessoa
class Cliente(models.Model):
    pessoa = models.OneToOneField(Pessoa, on_delete=models.CASCADE)  # Relacionamento 1-para-1 com Pessoa

    def __str__(self):
        return f"Cliente: {self.pessoa}"


# Representa mesas disponíveis para uso 
class Mesa(models.Model):
    localizacao = models.CharField(max_length=100)  # Localização da mesa 
    numero_mesa = models.IntegerField()  # Número da mesa
    numero_cadeiras = models.IntegerField()  # Quantidade de cadeiras na mesa
    status = models.CharField(max_length=50)  # Status da mesa 

    def __str__(self):
        return f"Mesa {self.numero_mesa} - {self.localizacao}"


# Representa pedidos feitos por clientes
class Pedido(models.Model):
    data = models.DateField()  # Data do pedido
    hora = models.TimeField()  # Hora do pedido
    tipo = models.CharField(max_length=50)  # Tipo do pedido 
    observacoes = models.TextField(blank=True, null=True)  # Observações adicionais sobre o pedido
    cliente = models.ForeignKey(Cliente, on_delete=models.CASCADE)  # Relacionamento com Cliente
    mesa = models.ForeignKey(Mesa, on_delete=models.CASCADE)  # Relacionamento com Mesa

    def __str__(self):
        return f"Pedido {self.id}"


# Representa itens associados a pedidos
class Itens(models.Model):
    quantidade = models.IntegerField()  # Quantidade do item
    preco = models.DecimalField(max_digits=10, decimal_places=2)  # Preço total do item
    ingredientes = models.TextField(blank=True, null=True)  # Ingredientes 
    pedido = models.ForeignKey(Pedido, on_delete=models.CASCADE)  # Relacionamento com Pedido

    def __str__(self):
        return f"Item do Pedido {self.pedido.id}"


# Representa pacientes, cada paciente está vinculado a uma Pessoa
class Paciente(models.Model):
    pessoa = models.OneToOneField(Pessoa, on_delete=models.CASCADE)  # Relacionamento 1-para-1 com Pessoa

    def __str__(self):
        return f"Paciente: {self.pessoa}"


# Representa médicos, cada médico está vinculado a uma Pessoa
class Medico(models.Model):
    crm = models.CharField(max_length=20, unique=True)  # CRM único
    especializacao = models.CharField(max_length=50)  # Especialização do médico 
    pessoa = models.OneToOneField(Pessoa, on_delete=models.CASCADE)  # Relacionamento 1-para-1 com Pessoa

    def __str__(self):
        return f"Médico: {self.pessoa} ({self.especializacao})"


# Representa consultas realizadas entre médicos e pacientes
class Consulta(models.Model):
    data_consulta = models.DateField()  # Data da consulta
    hora_consulta = models.TimeField()  # Hora da consulta
    receita = models.TextField(blank=True, null=True)  # Receita médica 
    paciente = models.ForeignKey(Paciente, on_delete=models.CASCADE)  # Relacionamento com Paciente
    medico = models.ForeignKey(Medico, on_delete=models.CASCADE)  # Relacionamento com Médico

    def __str__(self):
        return f"Consulta em {self.data_consulta} com {self.medico}"


# Representa funcionários, cada funcionário está vinculado a uma Pessoa
class Funcionario(models.Model):
    turno = models.CharField(max_length=20)  # Turno do funcionário 
    cargo = models.CharField(max_length=50)  # Cargo do funcionário 
    pessoa = models.OneToOneField(Pessoa, on_delete=models.CASCADE)  # Relacionamento 1-para-1 com Pessoa

    def __str__(self):
        return f"Funcionário: {self.pessoa} ({self.cargo})"


# Representa recepções realizadas por funcionários
class Recepcao(models.Model):
    nome_recepcionista = models.CharField(max_length=100)  # Nome do recepcionista
    turno = models.CharField(max_length=20)  # Turno do recepcionista
    funcionario = models.ForeignKey(Funcionario, on_delete=models.CASCADE)  # Relacionamento com Funcionário
    paciente = models.ForeignKey(Paciente, on_delete=models.CASCADE)  # Relacionamento com Paciente

    def __str__(self):
        return f"Recepção de {self.paciente}"


# Representa locais onde eventos podem ser realizados
class Lugar(models.Model):
    nome = models.CharField(max_length=100)  # Nome do lugar
    endereco = models.CharField(max_length=255)  # Endereço do lugar
    capacidade = models.IntegerField()  # Capacidade máxima do lugar

    def __str__(self):
        return f"Lugar: {self.nome}"


# Representa eventos realizados
class Evento(models.Model):
    tipo_evento = models.CharField(max_length=50)  # Tipo do evento
    data_inicio = models.DateField()  # Data de início do evento
    data_fim = models.DateField()  # Data de término do evento
    hora_evento = models.TimeField()  # Hora do evento
    lugar = models.ForeignKey(Lugar, on_delete=models.CASCADE)  # Relacionamento com Lugar

    def __str__(self):
        return f"Evento: {self.tipo_evento} no {self.lugar}"


# Representa participantes de eventos, cada participante está vinculado a uma Pessoa
class Participante(models.Model):
    pessoa = models.OneToOneField(Pessoa, on_delete=models.CASCADE)  # Relacionamento 1-para-1 com Pessoa

    def __str__(self):
        return f"Participante: {self.pessoa}"


# Representa inscrições realizadas por participantes em eventos
class Inscricao(models.Model):
    data_inscricao = models.DateField()  # Data da inscrição
    status = models.CharField(max_length=20)  # Status da inscrição 
    evento = models.ForeignKey(Evento, on_delete=models.CASCADE)  # Relacionamento com Evento
    participante = models.ForeignKey(Participante, on_delete=models.CASCADE)  # Relacionamento com Participante

    def __str__(self):
        return f"Inscrição para {self.evento}"
    
class Reserva(models.Model):
    cliente = models.ForeignKey('Cliente', on_delete=models.CASCADE)  # Relacionamento com Cliente
    mesa = models.ForeignKey('Mesa', on_delete=models.CASCADE)  # Relacionamento com Mesa
    data_hora = models.DateTimeField()  # Data e hora da reserva

    def __str__(self):
        return f"Reserva de {self.cliente} na Mesa {self.mesa}"

