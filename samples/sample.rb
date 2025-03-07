require 'time'

def bubble_sort(arr)
  n = arr.length
  loop do
    swapped = false
    (n - 1).times do |i|
      if arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        swapped = true
      end
    end
    break unless swapped
  end
end

array = Array.new(16_000) { rand(1..100_000) }
start_time = Time.now
bubble_sort(array)
end_time = Time.now

puts ((end_time - start_time) * 1000).round(6)
