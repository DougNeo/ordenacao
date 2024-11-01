# plot.rb

require 'csv'
require 'gruff'

def gerar_graficos
  tempos_por_algoritmo = Hash.new { |hash, key| hash[key] = [] }
  tamanhos = []

  CSV.foreach("resultados.csv", headers: true) do |row|
    tamanho = row["Tamanho do Array"].to_i
    algoritmo = row["Algoritmo"]
    tempo_total = row["Tempo Total"].to_f

    tamanhos << tamanho unless tamanhos.include?(tamanho)
    tempos_por_algoritmo[algoritmo] << tempo_total
  end

  grafico = Gruff::Line.new
  grafico.title = "Comparação de Desempenho dos Algoritmos de Ordenação"
  grafico.labels = tamanhos.each_with_index.to_h

  tempos_por_algoritmo.each do |algoritmo, tempos|
    grafico.data(algoritmo, tempos)
  end

  grafico.write("grafico.png")
  puts "Gráfico gerado com sucesso!"
end
