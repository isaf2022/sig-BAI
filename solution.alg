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

constante inteiro NAO_ENCONTRADO <- -1

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

procedimento mensagem_de_erro (literal erro)
	escreva "==========================================\n"
	escreva " ERRO! ", erro, "\n"
	escreva "==========================================\n"
fim procedimento

procedimento mostrarDadosCliente (PESSOA cliente, CONTA conta_cliente)
	literal estados[] <- {"BLOQUEADO", "ACTIVO"}
	literal tipos_conta[] <- {"PESSOAL", "EMPRESARIAL"}

	escreva "==========================================\n"
	escreva "        DADOS PESSOAIS DO CLIENTE         \n"
	escreva " CODIGO : ", 			cliente.codigo, "\n"
	escreva " NOME : ", 			cliente.nome, "\n"
	escreva " IDENTIFICAÇÃO: ", 	cliente.identificacao, "\n"
	escreva " TELEFONE: ", 			cliente.telefone, "\n"
	escreva "        DADOS DA CONTA DO CLIENTE         \n"
	escreva " NUMERO DA CONTA: ", 	conta_cliente.numero_conta, "\n"
	escreva " TIPO DE CONTA: ", 	tipos_conta[conta_cliente.tipo_conta], "\n"
	escreva " SALDO: ", 			conta_cliente.saldo, "\n"
	escreva " ESTADO DA CONTA: ", 	estados[conta_cliente.estado], "\n"
	escreva "==========================================\n"
fim procedimento

funcao literal pedirLiteral (literal mensagem)
	literal resposta

	escreva mensagem
	leia resposta

	retorne resposta
fim funcao

funcao real pedirReal (literal mensagem)
	retorne strValorReal(pedirLiteral(mensagem))
fim funcao

funcao inteiro pedirInteiro (literal mensagem)
	retorne strValorInt(pedirLiteral(mensagem))
fim funcao

funcao inteiro procurarConta (inteiro numero_conta)
	inteiro indice
	para indice de 0 ate totalContas - 1
		se contas[indice].numero_conta = numero_conta entao
			retorne indice
		fim se
	fim para
	
	retorne NAO_ENCONTRADO
fim funcao

funcao inteiro procurarCliente (inteiro codigo_cliente)
	inteiro indice
	para indice de 0 ate totalClientes - 1
		se clientes[indice].codigo = codigo_cliente entao
			retorne indice
		fim se
	fim para

	retorne NAO_ENCONTRADO
fim funcao

funcao inteiro procurarContaPorCliente (inteiro codigo_cliente)
	inteiro indice
	para indice de 0 ate totalContas - 1
		se contas[indice].codigo_cliente = codigo_cliente entao
			retorne indice
		fim se
	fim para

	retorne NAO_ENCONTRADO
fim funcao

funcao logico cadastro_de_cliente (PESSOA p)
	p.codigo <- totalClientes + 1
	clientes[totalClientes] <- p
	totalClientes <- totalClientes + 1
	
	retorne verdadeiro
fim funcao

procedimento listar_clientes ()
	se totalClientes = 0 ou totalContas = 0 entao
		mensagem_de_erro("Nada para mostrar ainda")
	fim se
	
	inteiro i
	para i de 0 ate totalClientes - 1
		inteiro indice <- procurarContaPorCliente(clientes[i].codigo)

		se indice = NAO_ENCONTRADO entao
			continue
		fim se

		mostrarDadosCliente(clientes[i], contas[indice])
	fim para
fim procedimento

funcao logico abertura_de_conta (PESSOA p, inteiro tipo_de_conta)
	CONTA c
	c.numero_conta <- totalContas + 1
	c.tipo_conta <- tipo_de_conta
	c.saldo <- 0
	c.codigo_cliente <- p.codigo
	c.estado <- 1

	contas[totalContas] <- c
	totalContas <- totalContas + 1
	
	retorne verdadeiro
fim funcao

funcao logico depositar_dinheiro (inteiro num_da_conta, real valor)
	inteiro indice <- procurarConta(num_da_conta)

	se indice = NAO_ENCONTRADO entao
		mensagem_de_erro("Número de conta incorrecto")
		retorne falso
	fim se
	
	contas[indice].saldo <- contas[indice].saldo + valor
	
	retorne verdadeiro
fim funcao

funcao logico levantar_dinheiro (inteiro num_da_conta, real valor)
	inteiro indice <- procurarConta(num_da_conta)

	se indice = NAO_ENCONTRADO entao
		mensagem_de_erro("Número de conta incorrecto")
		retorne falso
	fim se

	CONTA c <- contas[indice]

	se c.saldo < valor entao
		mensagem_de_erro("O saldo da conta é insuficiente")
		retorne falso
	fim se
	
	c.saldo <- c.saldo - valor

	retorne verdadeiro
fim funcao

funcao real consultar_saldo (inteiro num_da_conta)
	inteiro indice <- procurarConta(num_da_conta)

	se indice = NAO_ENCONTRADO entao
		mensagem_de_erro("Número de conta incorrecto")
		retorne NAO_ENCONTRADO
	fim se
	
	retorne contas[indice].saldo
fim funcao

funcao logico transferir_dinheiro (inteiro num_da_conta_enviar, inteiro num_da_conta_receber, real valor)
	inteiro indice_conta_enviar <- procurarConta(num_da_conta_enviar)

	se indice_conta_enviar = NAO_ENCONTRADO entao
		mensagem_de_erro("Número de conta a enviar incorrecto")
		retorne falso
	fim se
	
	inteiro indice_conta_receber <- procurarConta(num_da_conta_receber)

	se indice_conta_receber = NAO_ENCONTRADO entao
		mensagem_de_erro("Número de conta a receber incorrecto")
		retorne falso
	fim se

	se indice_conta_enviar = indice_conta_receber entao
		mensagem_de_erro("Não pode transferir para a mesma conta")
		retorne falso
	fim se

	CONTA conta_enviar <- contas[indice_conta_enviar]
	CONTA conta_receber <- contas[indice_conta_receber]

	se conta_enviar.saldo < valor entao
		mensagem_de_erro("O saldo da conta é insuficiente")
		retorne falso
	fim se

	conta_enviar.saldo <- conta_enviar.saldo - valor
	conta_receber.saldo <- conta_receber.saldo + valor
	
	retorne verdadeiro
fim funcao

funcao logico actualizar_dados (PESSOA p, inteiro codigo_cliente)
	inteiro indice <- procurarCliente(codigo_cliente)

	se indice = NAO_ENCONTRADO entao
		mensagem_de_erro("Código cliente incorrecto")
		retorne falso
	fim se

	p.codigo <- codigo_cliente
	clientes[indice] <- p
	
	retorne verdadeiro
fim funcao

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
			
			p.nome <- pedirLiteral("Digite o seu nome completo: ")
			p.identificacao <- pedirLiteral("Digite o seu documento de identificação: ")
			p.telefone <- pedirLiteral("Digite o seu número de telefone: ")
			
			resposta <- cadastro_de_cliente(p)
			
		caso LISTAR:
			listar_clientes()
			tPause(2 * 1000) // 2 segundos
			
		caso ABERTURA_CONTA:
			inteiro codigo <- pedirInteiro("Digite o seu código pessoal: ")
			inteiro indice <- procurarCliente(codigo)

			se indice <> NAO_ENCONTRADO entao
				inteiro tipo_conta <- pedirInteiro("Digite 0 (zero) para conta pessoal ou 1 (um) para conta empresarial: ")
				resposta <- abertura_de_conta(clientes[indice], tipo_conta)
			fim se
			
		caso DEPOSITO:
			inteiro numero_conta <- pedirInteiro("Digite o seu número da conta: ")
			real valor <- pedirReal("Digite o valor a depositar: ")
			
			resposta <- depositar_dinheiro(numero_conta, valor)
			
		caso LEVANTAMENTO:
			inteiro numero_conta <- pedirInteiro("Digite o seu número da conta: ")
			real valor <- pedirReal("Digite o valor a levantar: ")

			resposta <- levantar_dinheiro(numero_conta, valor)
			
		caso CONSULTA:
			inteiro numero_conta <- pedirInteiro("Digite o seu número da conta: ")
			real saldo <- consultar_saldo(numero_conta)
			
		caso TRANSFERENCIA:
			inteiro num_conta_enviar <- pedirInteiro("Digite o seu número de conta: ")
			inteiro num_conta_receber <- pedirInteiro("Digite o número da conta destinatária: ")
			real valor <- pedirReal("Digite o valor que deseja transferir: ")

			resposta <- transferir_dinheiro(num_conta_enviar, num_conta_receber, valor)
			
		caso ATUALIZACAO:
			PESSOA p
			
			inteiro codigo_cliente <- pedirInteiro("Digite o seu código de cliente: ")
			p.nome <- pedirLiteral("Digite o seu nome completo: ")
			p.identificacao <- pedirLiteral("Digite o seu documento de identificação: ")
			p.telefone <- pedirLiteral("Digite o seu número de telefone: ")
			
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