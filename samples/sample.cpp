#include <iostream>
#include <vector>
#include <cstdlib>
#include <ctime>

void bubbleSort(std::vector<int>& arr) {
    int n = arr.size();
    bool swapped;
    do {
        swapped = false;
        for (int i = 0; i < n - 1; i++) {
            if (arr[i] > arr[i + 1]) {
                std::swap(arr[i], arr[i + 1]);
                swapped = true;
            }
        }
        n--;
    } while (swapped);
}

int main() {
    std::vector<int> array(16000);
    srand(time(0));
    for (int i = 0; i < 16000; i++) {
        array[i] = rand() % 100000;
    }

    clock_t start_time = clock();
    bubbleSort(array);
    clock_t end_time = clock();

    double elapsed_time = (double)(end_time - start_time) / CLOCKS_PER_SEC * 1000.0;
    std::cout << elapsed_time << std::endl;

    return 0;
}
