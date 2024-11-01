# desafio.rb

require_relative 'algoritmo'
require_relative 'benchmark'
require_relative 'gerador'
require_relative 'plot'

# Passo 1: Verificar e gerar a base de dados caso não exista
verificar_ou_gerar_base

# Tamanhos dos arrays para o teste
array_sizes = (1..10).map { |i| i * 10_000 }

# Passo 2: Realizar o comparativo com esta base de dados e salvar os resultados em CSV
comparativo(array_sizes)

# Passo 3: Gerar o gráfico com base nos resultados do CSV
gerar_graficos

puts "Processo completo! O gráfico e os resultados foram gerados com sucesso."
