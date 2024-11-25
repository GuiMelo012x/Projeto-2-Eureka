from django.contrib import admin
from django import forms
from .models import (
    Pessoa, Cliente, Mesa, Pedido, Itens, Paciente, Medico, Consulta,
    Funcionario, Recepcao, Lugar, Evento, Participante, Inscricao, Reserva
)
from .utils import buscar_endereco_via_cep

class PessoaAdminForm(forms.ModelForm):
    """
    Formulário customizado para a busca de endereço pelo CEP.
    """
    class Meta:
        model = Pessoa
        fields = "__all__"

    def clean(self):
        cleaned_data = super().clean()
        cep = cleaned_data.get("cep")
        if cep:
            endereco = buscar_endereco_via_cep(cep)
            if "erro" in endereco:
                self.add_error("cep", endereco["erro"])
            else:
                # Preenche o campo endereço automaticamente
                cleaned_data["endereco"] = (
                    f"{endereco['logradouro']}, {endereco['bairro']}, "
                    f"{endereco['cidade']}-{endereco['uf']}"
                )
        return cleaned_data

@admin.register(Pessoa)
class PessoaAdmin(admin.ModelAdmin):
    form = PessoaAdminForm
    list_display = ("nome", "sobrenome", "cpf", "email", "cep", "endereco")
    search_fields = ("nome", "sobrenome", "cpf", "email", "cep")

    class Media:
        js = ('js/autocomplete_cep.js',)  # Carrega o script JavaScript no admin



# Registre todos os modelos no admin
# Registre os outros modelos no admin
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

