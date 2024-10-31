require '/home/doug/trabalho/passaporte/algoritmo.rb'
require '/home/doug/trabalho/passaporte/benchmark.rb'
require '/home/doug/trabalho/passaporte/gerador.rb'
require '/home/doug/trabalho/passaporte/plot.rb'

# Tamanhos dos arrays para o teste
array_sizes = (1..10).map { |i| i * 10_000 }

# Mutex para sincronização da saída
mutex = Mutex.new

# Executa a geração de amostras
comparativo(array_sizes, mutex)