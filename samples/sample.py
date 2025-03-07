import time
import random

def bubble_sort(arr):
    n = len(arr)
    for i in range(n):
        swapped = False
        for j in range(0, n - i - 1):
            if arr[j] > arr[j + 1]:
                arr[j], arr[j + 1] = arr[j + 1], arr[j]
                swapped = True
        if not swapped:
            break

array = [random.randint(1, 100000) for _ in range(16000)]
start_time = time.time()
bubble_sort(array)
end_time = time.time()

print(round((end_time - start_time) * 1000, 6))
