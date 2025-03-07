function bubbleSort(arr) {
    let n = arr.length;
    let swapped;
    do {
        swapped = false;
        for (let i = 0; i < n - 1; i++) {
            if (arr[i] > arr[i + 1]) {
                [arr[i], arr[i + 1]] = [arr[i + 1], arr[i]];
                swapped = true;
            }
        }
        n--;
    } while (swapped);
}

let array = Array.from({ length: 16000 }, () => Math.floor(Math.random() * 100000));
let startTime = performance.now();
bubbleSort(array);
let endTime = performance.now();

console.log((endTime - startTime).toFixed(6));
