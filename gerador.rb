require 'json'
require 'date'

# Função para gerar arrays aleatórios
def generate_random_array(size)
  Array.new(size) { rand(1..1_000_000) }
end

# Tamanhos dos arrays para o teste
array_sizes = (1..10).map { |i| i * 10_000 }

# Gerando e salvando as amostras em um arquivo txt
File.open("amostras_de_#{DateTime.now}.txt", "w") do |file|
  array_sizes.each do |size|
    array = generate_random_array(size)
    file.puts(array.to_json) # Salvando o array em formato JSON
  end
end
puts "Amostras geradas e salvas no arquivo amostras.txt."