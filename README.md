# **Projeto People Crud**

**To install locally:**

1- Download ruby 3.2.2:

https://www.ruby-lang.org/en/downloads/

Installation:

1- Clone the project repository:

`git clone https://github.com/Castrosbruno/people-crud`

2- Enter the root of the cloned project and run the commands below step by step:

`cd people-crud`

3 - Create .env file and add your environment variables

`cp .env.sample .env`

4- Install the gems:

`bundle install`

5 - run db:create and migrate

`rails db:create && rails db:migrate`

6- Start the application:

`rails s`

_____________________________________________________________________________

**Tela inicial do sistema**

A tela inicial deste sistema apresenta uma lista completa de todas as pessoas cadastradas. Ao lado de cada cadastro, há dois botões: um para edição e outro para exclusão. Na parte inferior da lista, encontra-se o botão "Nova Pessoa", que, ao ser acionado, direciona o usuário para a página de cadastro de uma nova pessoa.
_____________________________________________________________________________

**Criação do cadastro de pessoas:**

**1° Passo:** Para iniciar a criação do cadastro de pessoas você deve clicar no botão **"Nova Pessoa"**, localizado na tela incial do projeto.

**2° Passo:** Os campos obrigatórios para criação de uma pessoa, são **Nome**, **E-mail** e **Data de nascimento**, caso não sejam preenchidos aparecerá um aviso, notificando que os campos não podem ficar em branco.

**3° Passo:** Existe um checkbox com o seguinte questionamento **"Deseja informar um endereço?"**, preenchendo o checkbox você deve preencher todos os campos do endereço, caso contrário aparecerá um aviso, notificando que os campos não podem ficar em branco, porém, se você não preencher o checkbox não é obrigatório o preenchimento e o cadastro é concluído com sucesso!

**Pronto, cadastro de pessoa feito com sucesso!!**

_____________________________________________________________________________

**Edição do cadastro**

**1° passo:** Para edição do cadastro de uma pessoa, você deve clicar no botão de edição, localizado no canto superior direito, ao lado do ícone da lixeira.

**Observação:** É possível realizar a exclusão do endereço de uma pessoa cadastrada de forma simplificada. Para isso, basta clicar no botão com o ícone de lixeira, que se encontra ao final das informações de endereço.

**2° passo:** Ápós a inclusão ou a retirada de informações, você deve clicar no botão **"Atualizar Pessoa"**.

**Pronto, cadastro atualizado com sucesso!!**


_____________________________________________________________________________

**Exclusão do cadastro**

**1° Passo:** Para exclusão do cadastro você deve estar na tela de visualização de todas as pessoas cadastras, localize o cadastro que você deseja excluir, clique no botão com o ícone de lixeira no canto superior direito.

**Pronto, cadastro excluído com sucesso!!**

_____________________________________________________________________________

# Qualidade e métricas de código

**Ruby Critic**

![image](https://github.com/Castrosbruno/people-crud/assets/69633173/3ae75087-12f3-460c-b534-a036e43ecc3a)

**SimpleCov**

![image](https://github.com/Castrosbruno/people-crud/assets/69633173/244164fc-6361-44bd-92c1-470df456b60f)

**Como obter essas métricas localmente**

- Para obter as métricas do Ruby Critic, devemos entrar no diretório da aplicação e rodar `rubycritic`, automaticamente ele irá abrir uma página no navegador contendo as métricas.

- Para obter as métricas do SimpleCov, devemos entrar no diretório da aplicação e rodar a suite de testes, utilizando o comando `rspec`, após finalizar a suite de teste um arquivo é criado na pasta coverage chamado **index.html**, basta abri-lo no navegador.
