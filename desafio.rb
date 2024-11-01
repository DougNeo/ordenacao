require_relative 'algoritmo'
require_relative 'benchmark'
require_relative 'gerador'
require_relative 'plot'

# Tamanhos dos arrays para o teste
# array_sizes = (1..10).map { |i| i * 10_000 }

# Gerando e salvando as amostras em um arquivo txt
generate_random_array()

# Executa a geração de amostras
# comparativo(array_sizes)