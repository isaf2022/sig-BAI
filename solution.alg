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

procedimento mensagem_de_sucesso ()
	escreva "|========================================|\n"
	escreva "| OPERAÇÃO REALIZADA COM SUCESSO!        |\n"
	escreva "|========================================|\n"
fim procedimento

funcao logico cadastro_de_cliente (PESSOA p)
	retorne verdadeiro
fim funcao

funcao logico abertura_de_conta (PESSOA p, inteiro tipo_de_conta)
	retorne verdadeiro
fim funcao

funcao logico depositar_dinheiro (inteiro num_da_conta, real valor)
	retorne verdadeiro
fim funcao

funcao logico levantar_dinheiro (inteiro num_da_conta, real valor)
	retorne verdadeiro
fim funcao

funcao real consultar_saldo (inteiro num_da_conta)
	retorne 0
fim funcao

funcao logico transferir_dinheiro (inteiro num_da_conta_enviar, inteiro num_da_conta_receber, real valor)
	retorne verdadeiro
fim funcao

funcao logico actualizar_dados (PESSOA p, inteiro codigo_cliente)
	retorne verdadeiro
fim funcao

procedimento listar_clientes ()
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

		logico resposta
		
		escolha opcao
		caso CADASTRO:
			PESSOA p
			resposta <- cadastro_de_cliente(p)
			
		caso LISTAR:
			listar_clientes()
			tPause(2 * 1000) // 2 segundos
			
		caso ABERTURA_CONTA:
			PESSOA cliente
			inteiro tipo_conta
			
			resposta <- abertura_de_conta(cliente, tipo_conta)
			
		caso DEPOSITO:
			inteiro numero_conta <- 1
			real valor <- 0
			
			resposta <- depositar_dinheiro(numero_conta, valor)
			
		caso LEVANTAMENTO:
			inteiro numero_conta <- 1
			real valor <- 0
			
			resposta <- levantar_dinheiro(numero_conta, valor)
			
		caso CONSULTA:
			inteiro numero_conta <- 1
			real saldo <- consultar_saldo(numero_conta)
			
			resposta <- saldo = 0
			
		caso TRANSFERENCIA:
			inteiro num_conta_enviar <- 1
			inteiro num_conta_receber <- 2
			real valor <- 0

			resposta <- transferir_dinheiro(num_conta_enviar, num_conta_receber, valor)
		caso ATUALIZACAO:
			PESSOA p
			inteiro codigo_cliente <- 1
			
			resposta <- actualizar_dados(p, codigo_cliente)
		caso SAIR:
			limpatela
		fim escolha

		se resposta entao
			mensagem_de_sucesso()
		fim se

		tPause(5 * 1000) // 5 segundos
	fim enquanto
	
fim algoritmo