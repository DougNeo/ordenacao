# Algoritmo de Bubble Sort
def bubble_sort(array)
 n = array.length
 loop do
   swapped = false
   (n-1).times do |i|
     if array[i] > array[i+1]
       array[i], array[i+1] = array[i+1], array[i]
       swapped = true
     end
   end
   break unless swapped
 end
 array
end


# Algoritmo de Quick Sort
def quick_sort(array)
 return array if array.length <= 1
 pivot = array.delete_at(rand(array.length))
 left, right = array.partition { |x| x < pivot }
 [*quick_sort(left), pivot, *quick_sort(right)]
end



# Algoritmo de Merge Sort
def merge_sort(array)
 return array if array.length <= 1
 mid = array.length / 2
 left = merge_sort(array[0...mid])
 right = merge_sort(array[mid..-1])
 merge(left, right)
end

def merge(left, right)
 sorted = []
 until left.empty? || right.empty?
   sorted << (left.first <= right.first ? left.shift : right.shift)
 end
 sorted + left + right
end