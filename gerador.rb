# gerador.rb

require 'json'

# Função para gerar um array aleatório de tamanho especificado
def generate_random_array(size)
  Array.new(size) { rand(1..1_000_000) }
end

# Função para verificar e criar a base de dados se não existir
def verificar_ou_gerar_base
  nome_arquivo = "amostras_de_dados.txt"

  if File.exist?(nome_arquivo)
    puts "Carregando amostras do arquivo #{nome_arquivo}..."
  else
    puts "Arquivo de amostras não encontrado. Gerando novas amostras..."
    
    # Tamanhos dos arrays para o teste
    array_sizes = (1..10).map { |i| i * 10_000 }

    # Gera e salva as amostras no arquivo txt
    File.open(nome_arquivo, "w") do |file|
      array_sizes.each do |size|
        array = generate_random_array(size)
        file.puts(array.to_json) # Salvando o array em formato JSON
      end
    end

    puts "Amostras geradas e salvas no arquivo #{nome_arquivo}."
  end
end
