from django.urls import path
from .views import (
    ModeloListView, ModeloCreateView, ModeloUpdateView, ModeloDeleteView
)
from .models import (
    Pessoa, Cliente, Mesa, Pedido, Itens, Paciente, Medico, Consulta, 
    Funcionario, Recepcao, Lugar, Evento, Participante, Inscricao, Reserva
)
from crud.views import pagina_inicial


urlpatterns = [
    path('pessoas/', ModeloListView.as_view(model=Pessoa), name='listar_pessoas'),
    path('pessoas/criar/', ModeloCreateView.as_view(model=Pessoa, fields='__all__'), name='criar_pessoa'),
    path('pessoas/<int:pk>/atualizar/', ModeloUpdateView.as_view(model=Pessoa, fields='__all__'), name='atualizar_pessoa'),
    path('pessoas/<int:pk>/excluir/', ModeloDeleteView.as_view(model=Pessoa), name='excluir_pessoa'),

    # Cliente
    path('clientes/', ModeloListView.as_view(model=Cliente), name='listar_clientes'),
    path('clientes/criar/', ModeloCreateView.as_view(model=Cliente, fields='__all__'), name='criar_cliente'),
    path('clientes/<int:pk>/atualizar/', ModeloUpdateView.as_view(model=Cliente, fields='__all__'), name='atualizar_cliente'),
    path('clientes/<int:pk>/excluir/', ModeloDeleteView.as_view(model=Cliente), name='excluir_cliente'),

    # Mesa
    path('mesas/', ModeloListView.as_view(model=Mesa), name='listar_mesas'),
    path('mesas/criar/', ModeloCreateView.as_view(model=Mesa, fields='__all__'), name='criar_mesa'),
    path('mesas/<int:pk>/atualizar/', ModeloUpdateView.as_view(model=Mesa, fields='__all__'), name='atualizar_mesa'),
    path('mesas/<int:pk>/excluir/', ModeloDeleteView.as_view(model=Mesa), name='excluir_mesa'),

    # Pedido
    path('pedidos/', ModeloListView.as_view(model=Pedido), name='listar_pedidos'),
    path('pedidos/criar/', ModeloCreateView.as_view(model=Pedido, fields='__all__'), name='criar_pedido'),
    path('pedidos/<int:pk>/atualizar/', ModeloUpdateView.as_view(model=Pedido, fields='__all__'), name='atualizar_pedido'),
    path('pedidos/<int:pk>/excluir/', ModeloDeleteView.as_view(model=Pedido), name='excluir_pedido'),

    # Itens
    path('itens/', ModeloListView.as_view(model=Itens), name='listar_itens'),
    path('itens/criar/', ModeloCreateView.as_view(model=Itens, fields='__all__'), name='criar_item'),
    path('itens/<int:pk>/atualizar/', ModeloUpdateView.as_view(model=Itens, fields='__all__'), name='atualizar_item'),
    path('itens/<int:pk>/excluir/', ModeloDeleteView.as_view(model=Itens), name='excluir_item'),

    # Paciente
    path('pacientes/', ModeloListView.as_view(model=Paciente), name='listar_pacientes'),
    path('pacientes/criar/', ModeloCreateView.as_view(model=Paciente, fields='__all__'), name='criar_paciente'),
    path('pacientes/<int:pk>/atualizar/', ModeloUpdateView.as_view(model=Paciente, fields='__all__'), name='atualizar_paciente'),
    path('pacientes/<int:pk>/excluir/', ModeloDeleteView.as_view(model=Paciente), name='excluir_paciente'),

    # Medico
    path('medicos/', ModeloListView.as_view(model=Medico), name='listar_medicos'),
    path('medicos/criar/', ModeloCreateView.as_view(model=Medico, fields='__all__'), name='criar_medico'),
    path('medicos/<int:pk>/atualizar/', ModeloUpdateView.as_view(model=Medico, fields='__all__'), name='atualizar_medico'),
    path('medicos/<int:pk>/excluir/', ModeloDeleteView.as_view(model=Medico), name='excluir_medico'),

    # Consulta
    path('consultas/', ModeloListView.as_view(model=Consulta), name='listar_consultas'),
    path('consultas/criar/', ModeloCreateView.as_view(model=Consulta, fields='__all__'), name='criar_consulta'),
    path('consultas/<int:pk>/atualizar/', ModeloUpdateView.as_view(model=Consulta, fields='__all__'), name='atualizar_consulta'),
    path('consultas/<int:pk>/excluir/', ModeloDeleteView.as_view(model=Consulta), name='excluir_consulta'),

    # Funcionario
    path('funcionarios/', ModeloListView.as_view(model=Funcionario), name='listar_funcionarios'),
    path('funcionarios/criar/', ModeloCreateView.as_view(model=Funcionario, fields='__all__'), name='criar_funcionario'),
    path('funcionarios/<int:pk>/atualizar/', ModeloUpdateView.as_view(model=Funcionario, fields='__all__'), name='atualizar_funcionario'),
    path('funcionarios/<int:pk>/excluir/', ModeloDeleteView.as_view(model=Funcionario), name='excluir_funcionario'),

    # Recepcao
    path('recepcoes/', ModeloListView.as_view(model=Recepcao), name='listar_recepcoes'),
    path('recepcoes/criar/', ModeloCreateView.as_view(model=Recepcao, fields='__all__'), name='criar_recepcao'),
    path('recepcoes/<int:pk>/atualizar/', ModeloUpdateView.as_view(model=Recepcao, fields='__all__'), name='atualizar_recepcao'),
    path('recepcoes/<int:pk>/excluir/', ModeloDeleteView.as_view(model=Recepcao), name='excluir_recepcao'),

    # Lugar
    path('lugares/', ModeloListView.as_view(model=Lugar), name='listar_lugares'),
    path('lugares/criar/', ModeloCreateView.as_view(model=Lugar, fields='__all__'), name='criar_lugar'),
    path('lugares/<int:pk>/atualizar/', ModeloUpdateView.as_view(model=Lugar, fields='__all__'), name='atualizar_lugar'),
    path('lugares/<int:pk>/excluir/', ModeloDeleteView.as_view(model=Lugar), name='excluir_lugar'),

    # Evento
    path('eventos/', ModeloListView.as_view(model=Evento), name='listar_eventos'),
    path('eventos/criar/', ModeloCreateView.as_view(model=Evento, fields='__all__'), name='criar_evento'),
    path('eventos/<int:pk>/atualizar/', ModeloUpdateView.as_view(model=Evento, fields='__all__'), name='atualizar_evento'),
    path('eventos/<int:pk>/excluir/', ModeloDeleteView.as_view(model=Evento), name='excluir_evento'),

    # Participante
    path('participantes/', ModeloListView.as_view(model=Participante), name='listar_participantes'),
    path('participantes/criar/', ModeloCreateView.as_view(model=Participante, fields='__all__'), name='criar_participante'),
    path('participantes/<int:pk>/atualizar/', ModeloUpdateView.as_view(model=Participante, fields='__all__'), name='atualizar_participante'),
    path('participantes/<int:pk>/excluir/', ModeloDeleteView.as_view(model=Participante), name='excluir_participante'),

    # Inscricao
    path('inscricoes/', ModeloListView.as_view(model=Inscricao), name='listar_inscricoes'),
    path('inscricoes/criar/', ModeloCreateView.as_view(model=Inscricao, fields='__all__'), name='criar_inscricao'),
    path('inscricoes/<int:pk>/atualizar/', ModeloUpdateView.as_view(model=Inscricao, fields='__all__'), name='atualizar_inscricao'),
    path('inscricoes/<int:pk>/excluir/', ModeloDeleteView.as_view(model=Inscricao), name='excluir_inscricao'),

    # Reserva
    path('reservas/', ModeloListView.as_view(model=Reserva), name='listar_reservas'),
    path('reservas/criar/', ModeloCreateView.as_view(model=Reserva, fields='__all__'), name='criar_reserva'),
    path('reservas/<int:pk>/atualizar/', ModeloUpdateView.as_view(model=Reserva, fields='__all__'), name='atualizar_reserva'),
    path('reservas/<int:pk>/excluir/', ModeloDeleteView.as_view(model=Reserva), name='excluir_reserva'),
]
