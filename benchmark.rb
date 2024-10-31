require 'benchmark'
require 'csv'

def comparativo(array_sizes, mutex)
  CSV.open("resultados.csv", "w") do |csv|
    csv << ["Tamanho do Array", "Algoritmo", "Tempo de User", "Tempo de System", "Tempo Total"]
    
    array_sizes.each do |size|
      puts "\n=== Testando com array de tamanho #{size} ==="

      # Gerando um array aleatório para o tamanho atual
      array = generate_random_array(size)
    
      # Usando Benchmark e threads para cada algoritmo
      Benchmark.bm(20) do |x|  # Define a largura do label para alinhamento
        threads = []
    
        # Threads para cada algoritmo
        threads << Thread.new do
          mutex.synchronize do
            x.report("Bubble Sort (#{size}):") { bubble_sort(array.dup) }
            csv << [size, "Bubble Sort", x.real, x.utime, x.stime]  
          end
        end
    
        threads << Thread.new do
          mutex.synchronize do
            x.report("Quick Sort (#{size}): ") { quick_sort(array.dup) }
            csv << [size, "Quick Sort", x.real, x.utime, x.stime]
          end
        end
    
        threads << Thread.new do
          mutex.synchronize do
            x.report("Merge Sort (#{size}): ") { merge_sort(array.dup) }
            csv << [size, "Merge Sort", x.real, x.utime, x.stime]
          end
        end

        threads.each(&:join)
      end
    end
  end
end