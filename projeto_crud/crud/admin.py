from django.contrib import admin
from .models import (
    Pessoa, Cliente, Mesa, Pedido, Itens, Paciente, Medico, Consulta,
    Funcionario, Recepcao, Lugar, Evento, Participante, Inscricao, Reserva
)

# Registre todos os modelos no admin
admin.site.register(Pessoa)
admin.site.register(Cliente)
admin.site.register(Mesa)
admin.site.register(Pedido)
admin.site.register(Itens)
admin.site.register(Paciente)
admin.site.register(Medico)
admin.site.register(Consulta)
admin.site.register(Funcionario)
admin.site.register(Recepcao)
admin.site.register(Lugar)
admin.site.register(Evento)
admin.site.register(Participante)
admin.site.register(Inscricao)
admin.site.register(Reserva)
