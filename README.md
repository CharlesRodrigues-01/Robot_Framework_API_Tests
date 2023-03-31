<h1>Testes de API com Robot Framework</h1> 

> Exemplo de implementação de testes de API utilizando Robot Framework e Python

## Motivação das escolhas

Robot Framework é uma poderosa e versátil ferramenta para automação de testes. Pode ser usado uma variedade de tipos diferentes de testes automatizados como web, mobile, API e Desktop.

A escolha desta ferramenta traz mais praticidade para a automação pois, de forma muito simples, é possível implementar e executar seus testes. Tirando complexidade desnecessária e tornando o processo mais intuitivo.

Fácil instalação, linguagem simples, documentação robusta, reports e logs personalizados para os testes.


## Cenários de testes implementados

Get Products (GET /catalog/products) - Endpoint que deve retornar uma lista dos produtos cadastrados.

- Deve retornar uma lista de produtos cadastrados baseados nos filtros 'skip' e 'limit';
- Deve retornar mensagem de erro e status code 401 para usuários sem autorização;
- Deve retornar uma lista de produtos cadastrados sem a utilização de filtros;

Get Product (GET /catalog/product/id) - Endpoint que deve retornar um produto baseado no ID.

- Deve retornar o produto cadastrado baseado no id;
- Deve retornar mensagem de erro e status code 401 para usuários sem autorização;
- Deve retornar mensagem de erro e status code 404 para produto inexistente;

Create Product (POST /catalog/product) - Endpoint que deve cadastrar um produto.

- Deve cadastrar produto com sucesso enviando todas as informações;
- Deve retornar mensagem de erro e status code 401 para usuários sem autorização;
- Deve retornar mensagem de erro e status code 500 para body inexistente;

Delete Product (DELETE /catalog/product/id) - Endpoint que deve excluir um produto cadastrado.

- Deve deletar o produto cadastrado baseado no id;
- Deve retornar mensagem de erro e status code 401 para usuários sem autorização;
- Deve retornar mensagem de erro e status code 404 para produto inexistente;

Get Product in Category (GET /catalog/category/{category}/products) - Endpoint que deve retornar todos os produtos para uma categoria.

- Deve retornar todos os produtos baseados na categoria, filtrados por 'skip' e 'limit';
- Deve retornar mensagem de erro e status code 401 para usuários sem autorização;
- Deve retornar lista de produtos vazia para categoria inexistente;

## Setup para rodar os testes

Primeiro passo para rodar os testes com sucesso é garantir que possuímos todas as ferramentas necessárias para tal. São elas:

- Python 3
- Robot Framework

Para a instalação do Python 3 basta seguir a documentação disponibilizada logo abaixo.

Agora vamos seguir com a instalação do gerenciador de pacotes do Python, o Pip. Para isso é necessário executar o comando abaixo no terminal:
    
```sh
sudo apt install python3-pip
```
Agora que ja temos o gerenciador de pacotes, podemos seguir para a instalação do Robot Framework e de sua biblioteca para testes de API chamada de Requests. Executaremos os respectivos comandos abaixo:
```sh
pip install robotframework
```
```sh
pip install robotframework-requests
```
Verificar a versão do robot instalada:
```sh
robot --version
```
Pronto!! Agora podemos clonar o projeto e abrí-lo em uma IDE ou editor de texto de sua preferência.

Por fim, deveremos:
- realizar o cadastro no site: [RapidAPI](https://rapidapi.com/iddogino1/api/my-store2/);
- localizar os valores dos headers criados para seu usuário, X-RapidAPI-Key e X-RapidAPI-Host;
- criar o arquivo headers.yaml na pasta ../support/data e inserir estes valores da seguinte maneira:
```sh
X-RapidAPI-Key: valor criado para seu usuário
X-RapidAPI-Host: valor criado para seu usuário
```
## Rodando nossos testes

Vamos rodar nossos testes baseados nas tags criadas, são elas Products e Categories.

Com o comando abaixo o Robot irá criar uma pasta chamada TestResults e salvar os Logs e Reports nela, executar tosdos os testes com a tag Products que se encontrem na pasta features.
```sh
robot -d ./TestResults -i Products features
```
Pronto!!

Confira a documentação dos reports e os logs em .html gerados pelos testes e divirta-se criando novos cenários!!

## Documentação

- [Python 3](https://www.python.org/doc/)
- [Robot Framework](https://robotframework.org/)
- [Robot Framework - Requests](https://github.com/MarketSquare/robotframework-requests#readme)