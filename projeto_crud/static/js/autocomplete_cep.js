document.addEventListener("DOMContentLoaded", function () {
    const cepField = document.getElementById("id_cep"); // Campo CEP
    const enderecoField = document.getElementById("id_endereco"); // Campo Endereço

    if (cepField) {
        cepField.addEventListener("blur", function () {
            const cep = cepField.value.replace(/\D/g, ""); // Remove caracteres não numéricos

            if (cep.length === 8) {
                fetch(`https://viacep.com.br/ws/${cep}/json/`)
                    .then((response) => response.json())
                    .then((data) => {
                        if (!data.erro) {
                            enderecoField.value = `${data.logradouro}, ${data.bairro}, ${data.localidade} - ${data.uf}`;
                        } else {
                            alert("CEP não encontrado!");
                        }
                    })
                    .catch((error) => {
                        console.error("Erro ao buscar o endereço:", error);
                        alert("Erro ao buscar o endereço.");
                    });
            } else {
                alert("CEP inválido!");
            }
        });
    }
});
