# benchmark.rb

require 'benchmark'
require 'csv'

def comparativo(array_sizes)
  mutex = Mutex.new
  resultado = "resultados_#{DateTime.now.to_time.to_i}.csv"
  CSV.open(resultado, "w") do |csv|
    csv << ["Tamanho do Array", "Algoritmo", "Tempo de User", "Tempo de System", "Tempo Total"]

    array_sizes.each do |size|
      puts "\n=== Testando com array de tamanho #{size} ==="
      array = generate_random_array(size)

      Benchmark.bm(20) do |x|
        threads = []

        # threads << Thread.new do
        #   mutex.synchronize do
        #     tempo = x.report("Bubble Sort (#{size}):") { bubble_sort(array.dup) }
        #     csv << [size, "Bubble Sort", tempo.utime, tempo.stime, tempo.total]
        #   end
        # end

        threads << Thread.new do
          mutex.synchronize do
            tempo = x.report("Quick Sort (#{size}):") { quick_sort(array.dup) }
            csv << [size, "Quick Sort", tempo.utime, tempo.stime, tempo.total]
          end
        end

        threads << Thread.new do
          mutex.synchronize do
            tempo = x.report("Merge Sort (#{size}):") { merge_sort(array.dup) }
            csv << [size, "Merge Sort", tempo.utime, tempo.stime, tempo.total]
          end
        end

        threads.each(&:join)
      end
    end
  end
  resultado
end
