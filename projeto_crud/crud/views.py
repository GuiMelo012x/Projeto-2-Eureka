from django.shortcuts import render

def pagina_inicial(request):
    return render(request, 'pagina_inicial.html')  



"""from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.urls import reverse_lazy
from .models import (
    Pessoa, Cliente, Mesa, Pedido, Itens, Paciente, Medico, Consulta,
    Funcionario, Recepcao, Lugar, Evento, Participante, Inscricao, Reserva
)

# Listar (ListView)
class ModeloListView(ListView):
    template_name = 'crud/listarModelos.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['verbose_name_plural'] = self.model._meta.verbose_name_plural

        # Nome das URLs dinâmicas baseado no nome do modelo
        model_name = self.model._meta.model_name  # Exemplo: 'pessoa', 'cliente', etc.

        # Preenche dinamicamente as URLs de criação, atualização e exclusão
        context['criar_url'] = f'criar_{model_name}'
        context['atualizar_url'] = f'atualizar_{model_name}'  # Você usará este com {% url %}
        context['excluir_url'] = f'excluir_{model_name}'  # Você usará este com {% url %}

        return context


# Criar (CreateView)
class ModeloCreateView(CreateView):
    template_name = 'crud/criarModelo.html'

    def get_success_url(self):
        model_name_plural = self.model._meta.verbose_name_plural.lower()
        return reverse_lazy(f'listar_{self.model._meta.model_name}')  # Exemplo: listar_pessoas


# Atualizar (UpdateView)
class ModeloUpdateView(UpdateView):
    template_name = 'crud/atualizarModelo.html'

    def get_success_url(self):
        return reverse_lazy(f'listar_{self.model._meta.model_name}')  # Exemplo: listar_pessoas


# Excluir (DeleteView)
class ModeloDeleteView(DeleteView):
    template_name = 'crud/excluirModelo.html'

    def get_success_url(self):
        return reverse_lazy(f'listar_{self.model._meta.model_name}')  # Exemplo: listar_pessoas


from django.shortcuts import render


def pagina_inicial(request):
    return render(request, 'crud/pagina_inicial.html')"""
