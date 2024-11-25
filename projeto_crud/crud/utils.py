import requests

def buscar_endereco_via_cep(cep):
    """
    Consulta o endereço na API ViaCEP com base no CEP informado.
    """
    url = f"https://viacep.com.br/ws/{cep}/json/"
    try:
        response = requests.get(url)
        if response.status_code == 200:
            dados = response.json()
            if "erro" not in dados:
                return {
                    "logradouro": dados.get("logradouro", ""),
                    "bairro": dados.get("bairro", ""),
                    "cidade": dados.get("localidade", ""),
                    "uf": dados.get("uf", ""),
                    "cep": dados.get("cep", "")
                }
            else:
                return {"erro": "CEP não encontrado"}
        return {"erro": f"Erro na API: {response.status_code}"}
    except requests.RequestException as e:
        return {"erro": str(e)}
