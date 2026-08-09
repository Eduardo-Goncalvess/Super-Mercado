Algoritmo "SuperMercado"

Tipo
   vendedor = registro
      nome: caractere
      matric: inteiro
      salar: real
      comi: real
      totalComissao: real
   Fimregistro

   produto = registro
      cod: inteiro
      marca: caractere
      pvenda: real
      qtd: inteiro
   Fimregistro

   venda = registro
      vendedor: caractere
      produto: caractere
      quantidade: inteiro
      valorVenda: real
      comissao: real
   Fimregistro


procedimento organizarEstacionamento()
Var
   k, m, n, i, j, temp: inteiro
Inicio
   k <- 1
   para m de 1 até 5 faça
      para n de 1 até 5 faça
         listaEstacionamento[k] <- estacionamento[m, n]
         k <- k + 1
      fimpara
   fimpara

   para i de 1 até 25 faça
      para j de 1 até 25 - i faça
         se (listaEstacionamento[j] > listaEstacionamento[j + 1]) então
            temp <- listaEstacionamento[j]
            listaEstacionamento[j] <- listaEstacionamento[j + 1]
            listaEstacionamento[j + 1] <- temp
         fimse
      fimpara
   fimpara

   k <- 1
   para m de 1 até 5 faça
      para n de 1 até 5 faça
         estacionamento[m, n] <- listaEstacionamento[k]
         k <- k + 1
      fimpara
   fimpara

   limpatela
   Escreval("Estacionamento organizado com sucesso!")
Fimprocedimento

procedimento exibirEstacionamento()
Var
   m, n: inteiro
Inicio
   para m de 1 até 5 faça
      para n de 1 até 5 faça
         se (estacionamento[m, n] = 0) então
            Escreva("[ ] ")
         senao
            Escreva("[C] ")
         fimse
      fimpara
      Escreval("")
   fimpara

   observarVagasRestantes(vagasRestantes)
Fimprocedimento


procedimento removerCarro()
Var
   linha, coluna: inteiro
Inicio
   Escreva("Digite a linha (1-5): ")
   Leia(linha)

   enquanto (linha < 1) ou (linha > 5) faça
      Escreva("Digite uma linha existente (1-5): ")
      leia(linha)
   fimenquanto

   Escreva("Digite a coluna (1-5): ")
   Leia(coluna)

   enquanto (coluna < 1) ou (coluna > 5) faça
      Escreva("Digite uma coluna existente (1-5): ")
      Leia(coluna)
   fimenquanto

   se (estacionamento[linha, coluna] = 1) então
      estacionamento[linha, coluna] <- 0
      vagasRestantes <- vagasRestantes + 1
      limpatela
      Escreval("Carro removido com sucesso!")
   senao
      limpatela
      Escreval("Essa vaga já está vazia.")
   fimse
Fimprocedimento


procedimento estacionarCarro()
Var
   linha, coluna: inteiro
Inicio
   se (vagasRestantes > 0) então
      Escreva("Digite a linha (1-5): ")
      Leia(linha)

      enquanto (linha < 1) ou (linha > 5) faça
         Escreva("Digite uma linha existente (1-5): ")
         leia(linha)
      fimenquanto

      Escreva("Digite a coluna (1-5): ")
      Leia(coluna)

      enquanto (coluna < 1) ou (coluna > 5) faça
         Escreva("Digite uma coluna existente (1-5): ")
         Leia(coluna)
      fimenquanto

      se (estacionamento[linha, coluna] = 0) então
         estacionamento[linha, coluna] <- 1
         vagasRestantes <- vagasRestantes - 1
         limpatela
         Escreval("Carro estacionado com sucesso")
      senao
         limpatela
         Escreval("Essa vaga já está ocupada.")
      fimse
   senao
      limpatela
      Escreval("O estacionamento está cheio!")
   fimse
Fimprocedimento


funcao adicionarVendedores() : inteiro
Var
   x, i, vendedorEscolhido: inteiro
   logi: logico
Inicio
   escreval ("Quantos vendedores deseja adicionar ao SuperMercado? Max: 20")
   leia (x)

   enquanto (x <= 0) ou (x > 20) faca
      escreval ("Insira um valor válido!")
      leia (x)
   fimenquanto

   se (quantVendedores + x > 20) entao
      escreval ("A quantidade máxima de vendedores foi excedida (20)")
   senao
      para i de quantVendedores + 1 ate quantVendedores + x faca
         escreval("Insira o nome do ", i, "º vendedor: ")
         leia(vendedores[i].nome)

         logi <- falso
         enquanto (logi = falso) faca
            escreval("Insira a matrícula do ", i, "º vendedor: ")
            leia(vendedores[i].matric)

            se (vendedores[i].matric <= 0) entao
               escreval("Insira uma matrícula válida.")
            senao
               logi <- verdadeiro
               para j de 1 ate (i - 1) faca
                  se (vendedores[j].matric = vendedores[i].matric) então
                     escreval("Matrícula já cadastrada! Insira uma matrícula diferente.")
                     logi <- falso
                  fimse
               fimpara
            fimse
         fimenquanto

         escreval("Insira o salário do ", i, "º vendedor: ")
         leia(vendedores[i].salar)
         enquanto (vendedores[i].salar <= 1517) faca
            escreval("Insira um salário mínimo: (1518) ")
            leia(vendedores[i].salar)
         fimenquanto
      fimpara
      quantVendedores <- quantVendedores + x
      limpatela
   fimse
   retorne 0
Fimfuncao


funcao adicionarProdutos() : inteiro
Var
   x, i, j: inteiro
   logi: logico
Inicio
   escreval ("Quantos produtos deseja adicionar ao SuperMercado? Max: 20")
   leia (x)

   enquanto (x <= 0) ou (x > 20) faca
      escreval ("Insira um valor válido!")
      leia (x)
   fimenquanto

   se (quantProdutos + x > 20) entao
      escreval ("A quantidade máxima de produtos foi excedida (20)")
   senao
      para i de quantProdutos + 1 ate quantProdutos + x faca
         logi <- falso
         enquanto (logi = falso) faca
            escreval("Insira o código do ", i, "º produto: ")
            leia(produtos[i].cod)

            logi <- verdadeiro
            para j de 1 ate (i - 1) faca
               se (produtos[j].cod = produtos[i].cod) então
                  escreval("Código de produto já existe! Insira um código diferente.")
                  logi <- falso
               fimse
            fimpara
         fimenquanto

         escreval("Insira a marca do ", i, "º produto: ")
         leia(produtos[i].marca)
         escreval("Insira o preço de venda do ", i, "º produto: ")
         leia(produtos[i].pvenda)
         enquanto (produtos[i].pvenda <= 0) faca
            escreval("Insira um preço de venda válido para o ", i, "º produto: ")
            leia(produtos[i].pvenda)
         fimenquanto
         escreval("Insira a quantidade disponível do ", i, "º produto: ")
         leia(produtos[i].qtd)
         enquanto (produtos[i].qtd <= 0) faca
            escreval("Insira uma quantidade válida para o ", i, "º produto: ")
            leia(produtos[i].qtd)
         fimenquanto
      fimpara
      quantProdutos <- quantProdutos + x
      calcularCustoTotal(custoTotalEstoque, produtos[i].pvenda, produtos[i].qtd)
      limpatela
   fimse
   retorne 0
Fimfuncao


procedimento observarVagasRestantes(vagasRestantes: inteiro)
Inicio
   escreval("Quantidade restante de vagas no estacionamento: ", vagasRestantes)
Fimprocedimento


procedimento calcularCustoTotal(var custoTotalEstoque: real; precoProduto: real; quantidade: inteiro)
Inicio
   custoTotalEstoque <- custoTotalEstoque + (precoProduto * quantidade * 0.8)
Fimprocedimento


funcao realizarCompra(): inteiro
Var
   indiceProduto, vendedorEscolhido, quantidadeCompra, possuiDesconto, valorDesconto: inteiro
   valorVenda: real
   produtoEncontrado: logico
Inicio
   contadorVendas <- 1
   escreval("Escolha o código do produto para compra: ")
   leia(indiceProduto)
   produtoEncontrado <- falso
   para i de 1 ate 20 faca
      se (produtos[i].cod = indiceProduto) entao
         produtoEncontrado <- verdadeiro
         escreval("Quantos itens deseja comprar? ")
         leia(quantidadeCompra)

         enquanto (quantidadeCompra < 1) faca
            escreval("Insira uma quantidade válida")
            leia(quantidadeCompra)
         fimenquanto

         se (quantidadeCompra <= produtos[i].qtd) então
            produtos[i].qtd <- produtos[i].qtd - quantidadeCompra
            escreval("Lista de vendedores disponíveis:")
            para j de 1 ate 20 faca
               se (vendedores[j].nome <> "") entao
                  escreval(j, " - ", vendedores[j].nome)
               fimse
            fimpara

            escreval("Escolha o vendedor digitando sua posição no vetor: ")
            leia(vendedorEscolhido)

            enquanto (vendedorEscolhido < 1) ou (vendedorEscolhido > 20) faca
               escreval("Número inválido! Escolha um vendedor entre 1 e 20.")
               leia(vendedorEscolhido)
            fimenquanto

            enquanto (vendedores[vendedorEscolhido].nome = "") faca
               escreval("Este vendedor não está disponível. Escolha outro.")
               leia(vendedorEscolhido)
            fimenquanto

            escreval("Você possui cupom para desconto? (0-Sim 1-Não): ")
            leia(possuiDesconto)
            enquanto (possuiDesconto <> 0) e (possuiDesconto <> 1) faca
               escreval("Insira uma resposta válida! (0-Sim 1-Não): ")
               leia(possuiDesconto)
            fimenquanto

            se (possuiDesconto = 0) entao
               escreval("Insira o valor do desconto (%): ")
               leia(valorDesconto)

               enquanto ((valorDesconto <= 0) ou (valorDesconto > 100)) faca
                  escreval("Insira um desconto válido")
                  leia(valorDesconto)
               fimenquanto

               valorVenda <- (produtos[i].pvenda * quantidadeCompra) * (1 - valorDesconto / 100)
            senao
               valorVenda <- produtos[i].pvenda * quantidadeCompra
            fimse

            se (contadorVendas <= 100) entao
               vendas[contadorVendas].vendedor <- vendedores[vendedorEscolhido].nome
               vendas[contadorVendas].produto <- produtos[i].marca
               vendas[contadorVendas].quantidade <- quantidadeCompra
               vendas[contadorVendas].valorVenda <- valorVenda

               contadorVendas <- contadorVendas + 1
               escreval("Venda realizada com sucesso!")
               retorne 0
               limpatela
            senao
               escreval("Limite de vendas atingido!")
               retorne 1
            fimse
         senao
            escreval("Quantidade insuficiente em estoque.")
         fimse
      fimse
   fimpara

   se (produtoEncontrado = falso) entao
      escreval("Código não encontrado.")
   fimse
   retorne 1

Fimfuncao

funcao mostrarQuantidadeProdutos(): inteiro
Var
   i: inteiro
Inicio
   escreval("Quantidade restante de produtos no estoque:")
   para i de 1 ate 20 faca
      escreval("Produto: ", produtos[i].marca, " | Quantidade restante: ", produtos[i].qtd)
   fimpara
   retorne 0
Fimfuncao

procedimento historicoDeVendas()
Var
   i: inteiro
Inicio
   escreval("Histórico de Vendas:")
   para i de 1 ate contadorVendas - 1 faca
      escreval("Vendedor: ", vendas[i].vendedor, " | Produto: ", vendas[i].produto, " | Quantidade: ", vendas[i].quantidade, " | Valor da venda: R$ ", vendas[i].valorVenda:0:2)
   fimpara
Fimprocedimento

Var
   estacionamento: vetor[1..5, 1..5] de inteiro
   m, n, linha, coluna, vagasRestantes, op: inteiro
   i, x, y, z, a, j, b, c, quantVendedores, quantProdutos: inteiro
   vendedores: vetor [1..20] de vendedor
   produtos: vetor [1..20] de produto
   vendas: vetor [1..100] de venda
   contadorVendas: inteiro
   lucroTotal, custoTotalEstoque: real
   opcao: inteiro
   logi, continuarNoEstacionamento: logico
   linhaDestino, colunaDestino, k, temp: inteiro
   listaEstacionamento: vetor [1..25] de inteiro

Inicio
   vagasRestantes <- 25
   para m de 1 ate 5 faca
      para n de 1 ate 5 faca
         estacionamento[m, n] <- 0
      fimpara
   fimpara

   enquanto (opcao <> 8) faca
      escreval("----_______SuperMercado_______----")
      escreval("                   Bem-vindo ao Menu de Gerência")
      escreval
      escreval("1 - Realizar uma compra")
      escreval("2 - Adicionar vendedores ao SuperMercado")
      escreval("3 - Adicionar produtos ao estoque do SuperMercado")
      escreval("4 - Quantidade de produtos no estoque")
      escreval("5 - Histórico de vendas")
      escreval("6 - Estacionamento")
      escreval("7 - Custo de estoque")
      escreval("8 - Sair")
      leia(opcao)

      se (opcao = 1) entao
         x <- realizarCompra()
      senao
         se (opcao = 2) entao
            x <- adicionarVendedores()
         senao
            se (opcao = 3) entao
               x <- adicionarProdutos()
            senao
               se (opcao = 4) entao
                  a <- mostrarQuantidadeProdutos()
               senao
                  se (opcao = 5) entao
                     historicoDeVendas()
                  senao
                     se (opcao = 6) então
                        continuarNoEstacionamento <- verdadeiro
                        enquanto (continuarNoEstacionamento = verdadeiro) faça
                           Escreval("1 - Estacionar carro")
                           Escreval("2 - Remover carro")
                           Escreval("3 - Mostrar estacionamento")
                           Escreval("4 - Organizar estacionamento")
                           Escreval("5 - Voltar ao menu principal")
                           Leia(op)

                           se (op = 1) então
                              estacionarCarro()
                           fimse

                           se (op = 2) então
                              removerCarro()
                           fimse

                           se (op = 3) então
                              exibirEstacionamento()
                           fimse

                           se (op = 4) então
                              organizarEstacionamento()
                           fimse

                           se (op = 5) então
                              Escreval("Saindo do estacionamento...")
                              continuarNoEstacionamento <- falso
                           fimse

                           se (op < 1) ou (op > 5) então
                              escreval("Opção inválida.")
                           fimse
                        fimenquanto
                     senao
                        se (opcao = 7) entao
                           escreval("Leva-se em consideração o preço de custo do produto")
                           escreval("Preço de custo = 80% do valor de venda")
                           escreval("Custo total estimado para preenchimento de estoque: R$", custoTotalEstoque:0:2)
                        fimse
                     fimse
                  fimse
               fimse
            fimse
         fimse
      fimse
   fimenquanto

Fimalgoritmo