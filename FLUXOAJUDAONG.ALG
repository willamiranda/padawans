Algoritmo "FluxoAjudaONG"

Tipo
causa = registro
nome: caracter
descricao: caracter
fimregistro

ong = registro
nome: caracter
causa: caracter
fundacao: caracter
localizacao: caracter
classificacao: inteiro
pessoasAjudadas: inteiro
fimregistro

Var
causas: vetor[0..2] de causa
ongs: vetor[0..5] de ong
escolhaCausa, escolhaONG: inteiro
escolhaAjuda: caractere

Inicio

//Inicializa��o das causas e das ONGs
procedimento inicializarCausas()
   inicio
      causas[0].nome <- "Combate � Viol�ncia Infantil"
      causas[0].descricao <- "Acabar com o abuso, explora��o e agress�o de crian�as"

      causas[1].nome <- "Luta por Direitos Iguais"
      causas[1].descricao <- "Instaurar um estado de justi�a igualit�ria"

      causas[2].nome <- "Retorno de Bens Roubados"
      causas[2].descricao <- "Devolu��o de bens roubados aos seus devidos donos"
   fimprocedimento
   
procedimento inicializarONGS()
   inicio
      ongs[0].nome <- "Organiza��o de Prote��o �s Crian�as"
      ongs[0].causa <- causas[0].nome
      ongs[0].fundacao <- "27/11/2020"
      ongs[0].localizacao <- "Belo Horizonte - MG - Brasil"
      ongs[0].classificacao <- 10
      ongs[0].pessoasAjudadas <- 5631
      
      ongs[1].nome <- "Organiza��o Contra a Explora��o Infantil"
      ongs[1].causa <- causas[0].nome
      ongs[1].fundacao <- "25/09/2021"
      ongs[1].localizacao <- "Contagem - MG - Brasil"
      ongs[1].classificacao <- 9
      ongs[1].pessoasAjudadas <- 1208
      
      ongs[2].nome <- "Organiza��o pela Democratiza��o dos Direitos"
      ongs[2].causa <- causas[1].nome
      ongs[2].fundacao <- "21/01/2012"
      ongs[2].localizacao <- "S�o Paulo - SP - Brasil"
      ongs[2].classificacao <- 8
      ongs[2].pessoasAjudadas <- 20545
      
      ongs[3].nome <- "Organiza��o da Igualdade"
      ongs[3].causa <- causas[1].nome
      ongs[3].fundacao <- "10/01/2015"
      ongs[3].localizacao <- "Florian�polis - SC - Brasil"
      ongs[3].classificacao <- 9
      ongs[3].pessoasAjudadas <- 8092
      
      ongs[4].nome <- "Organiza��o do Retorno de Bens"
      ongs[4].causa <- causas[2].nome
      ongs[4].fundacao <- "15/07/2018"
      ongs[4].localizacao <- "Rio de Janeiro - RJ - Brasil"
      ongs[4].classificacao <- 7
      ongs[4].pessoasAjudadas <- 1563
      
      ongs[5].nome <- "Organiza��o de Volta ao Meu Dono"
      ongs[5].causa <- causas[2].nome
      ongs[5].fundacao <- "18/12/2018"
      ongs[5].localizacao <- "Uberl�ndia - MG - Brasil"
      ongs[5].classificacao <- 8
      ongs[5].pessoasAjudadas <- 3048
   fimprocedimento
   
//Exibi��o do menu
procedimento exibirMenu()
   inicio
      escreval("Bem-vindo, Usu�rio!")
      escreval("")
      escreval("CAUSAS A APOIAR: ")
      escreval("")
      escreval("   1 - " + causas[0].nome)
      escreval("   2 - " + causas[1].nome)
      escreval("   3 - " + causas[2].nome)
      escreval("")
   fimprocedimento

//Escolha de uma causa a apoiar
procedimento escolherCausa()
   inicio
      escreval("Por favor, escolha uma causa: ")
      leia(escolhaCausa)
      escreval("")
      escreval("ONGs que podem te interessar: ")
      escolha(escolhaCausa)
         caso 1
            escreval("   1 - " + ongs[0].nome)
            escreval("   2 - " + ongs[1].nome)
         caso 2
            escreval("   3 - " + ongs[2].nome)
            escreval("   4 - " + ongs[3].nome)
         caso 3
            escreval("   5 - " + ongs[4].nome)
            escreval("   6 - " + ongs[5].nome)
         outrocaso
            escreval("Op��o inv�lida")
            escolherCausa
      fimescolha
      escreva("")
   fimprocedimento

//Exibir informa��es de ONGs
procedimento exibirInfoONG()
inicio
   escreval("Por favor, escolha uma ONG: ")
   leia(escolhaONG)
   escreval("")
   escolha(escolhaONG)
      caso 1
         escreval("Nome: " + ongs[escolhaCausa*2-2].nome)
         escreval("Causa: " + ongs[escolhaCausa*2-2].causa)
         escreval("Funda��o: " + ongs[escolhaCausa*2-2].fundacao)
         escreval("Localiza��o: " + ongs[escolhaCausa*2-2].localizacao)
         escreval("Classifica��o: ", ongs[escolhaCausa*2-2].classificacao)
         escreval("Pessoas ajudadas: ", ongs[escolhaCausa*2-2].pessoasAjudadas)
      caso 2
         escreval("Nome: " + ongs[escolhaCausa*2-1].nome)
         escreval("Causa: " + ongs[escolhaCausa*2-1].causa)
         escreval("Funda��o: " + ongs[escolhaCausa*2-1].fundacao)
         escreval("Localiza��o: " + ongs[escolhaCausa*2-1].localizacao)
         escreval("Classifica��o: ", ongs[escolhaCausa*2-1].classificacao)
         escreval("Pessoas ajudadas: ", ongs[escolhaCausa*2-1].pessoasAjudadas)
      outrocaso
         escreval("Op��o inv�lida")
         exibirInfoONG
   fimescolha
   escreval("")
fimprocedimento

//Op��o de ajudar uma ONG
procedimento ajudarONG()
inicio
   escreval("Deseja ajudar essa ONG?")
   escreval("   S - SIM ou N - N�O")
   leia(escolhaAjuda)
   escreval("")
   se (escolhaAjuda = "S") entao
      escreval("Muito obrigado! A ONG ser� informada sobre o seu apoio!")
   senao
      escreval("Nossa, que pena! Esperamos que possa contribuir algum dia :(")
      escreval("")
      Principal()
   fimse
fimprocedimento

//Procedimento principal
procedimento Principal()
inicio
   exibirMenu()
   escolherCausa()
   exibirInfoONG()
   ajudarONG()
fimprocedimento

inicializarCausas()
inicializarONGS()
Principal()

Fimalgoritmo