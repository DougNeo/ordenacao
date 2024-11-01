# Projeto de Comparação de Algoritmos de Ordenação

Este projeto tem como objetivo comparar o desempenho de três algoritmos de ordenação — Bubble Sort, Quick Sort e Merge Sort — usando diferentes tamanhos de arrays gerados aleatoriamente. O programa mede o tempo de execução de cada algoritmo em paralelo, salva os resultados em um arquivo CSV e gera um gráfico visual dos tempos para análise de desempenho.

## Estrutura do Projeto

- **desafio.rb**: Arquivo principal do projeto. Controla o fluxo de execução:
  1. Gera uma base de dados (amostras de arrays) caso não exista.
  2. Executa os algoritmos de ordenação nas amostras.
  3. Salva os resultados de desempenho em um arquivo CSV.
  4. Gera um gráfico de comparação.
- **algoritmo.rb**: Contém as implementações dos algoritmos de ordenação.
- **benchmark.rb**: Responsável por executar o comparativo e salvar os resultados no CSV.
- **gerador.rb**: Gera amostras de dados aleatórias e salva em um arquivo de texto para uso posterior.
- **plot.rb**: Lê os dados do CSV gerado e cria um gráfico para visualização dos tempos de execução de cada algoritmo.

## Pré-requisitos

- **Ruby**: Certifique-se de ter o Ruby instalado (>= 2.7).
- **Gemas necessárias**: Execute o seguinte comando para instalar as dependências do projeto:
```bash
gem install benchmark csv json gruff
```

## Instalação
- Clone este repositório e entre no diretorio:
```bash
git clone https://github.com/DougNeo/ordenacao.git
cd projeto-ordenacao
```

## Execução do Projeto
- Para rodar o programa principal e gerar o comparativo de desempenho:
```bash
ruby desafio.rb
```

## Estrutura dos Resultados
Após a execução, os seguintes arquivos serão gerados:
  - **resultados.csv**: Contém os tempos de execução de cada algoritmo em diferentes tamanhos de array.
  - **grafico.png**: Gráfico que compara os tempos de execução de cada algoritmo.

## Como Funciona o Projeto

### Algoritmos de Ordenação (algoritmo.rb)
  - **Bubble Sort**: Algoritmo de ordenação simples e ineficiente para grandes conjuntos de dados.
  - **Quick Sort**: Algoritmo eficiente baseado na técnica de divisão e conquista.
  - **Merge Sort**: Algoritmo eficiente e estável que também usa divisão e conquista.

### Comparativo (benchmark.rb)
  - Executa os algoritmos em arrays de tamanhos variados, capturando os tempos de execução usando `Benchmark`.

### Gráfico (plot.rb)
  - Gera um gráfico com o tempo de execução de cada algoritmo para os diferentes tamanhos de array, facilitando a análise visual.

