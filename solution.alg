registo PESSOA
	inteiro codigo
	literal nome
	literal identificacao
	literal telefone
fim registo

registo CONTA
	inteiro numero_conta
	inteiro tipo_conta
	real 	saldo
	inteiro codigo_cliente
	inteiro	estado
fim registo

PESSOA clientes[1000]
CONTA contas[1000]
inteiro totalClientes, totalContas

procedimento mostrarMenu ()
	limpatela
	escreva "|========================================|\n"
	escreva "| [1] - Cadastrar clientes               |\n"
	escreva "| [2] - Listar clientes                  |\n"
	escreva "| [3] - Abertura de conta                |\n"
	escreva "| [4] - Depositar dinheiro               |\n"
	escreva "| [5] - Levantar dinheiro                |\n"
	escreva "| [6] - Consultar saldo                  |\n"
	escreva "| [7] - Transferir dinheiro              |\n"
	escreva "| [8] - Actualizar dados do cliente      |\n"
	escreva "| [9] - Terminar                         |\n"
	escreva "|========================================|\n"

fim procedimento

inicio
	
	constante inteiro CADASTRO 			<- 1
	constante inteiro LISTAR 			<- 2
	constante inteiro ABERTURA_CONTA 	<- 3
	constante inteiro DEPOSITO 			<- 4
	constante inteiro LEVANTAMENTO 		<- 5
	constante inteiro CONSULTA 			<- 6
	constante inteiro TRANSFERENCIA 	<- 7
	constante inteiro ATUALIZACAO 		<- 8
	constante inteiro SAIR 				<- 9
	
	inteiro opcao
	enquanto opcao <> SAIR faca
		
		mostrarMenu()
		leia opcao
		
		escolha opcao
		caso CADASTRO:
			
		caso LISTAR:
			
		caso ABERTURA_CONTA:
			
		caso DEPOSITO:
			
		caso LEVANTAMENTO:
			
		caso CONSULTA:
			
		caso TRANSFERENCIA:
			
		caso ATUALIZACAO:
			
		caso SAIR:
			limpatela
		fim escolha
	fim enquanto
	
fim algoritmo