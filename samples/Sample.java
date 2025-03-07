import java.util.Random;

public class Sample {
  public static void bubbleSort(int[] arr) {
    int n = arr.length;
    boolean swapped;
    do {
      swapped = false;
      for (int i = 0; i < n - 1; i++) {
        if (arr[i] > arr[i + 1]) {
          int temp = arr[i];
          arr[i] = arr[i + 1];
          arr[i + 1] = temp;
          swapped = true;
        }
      }
      n--;
    } while (swapped);
  }

  public static void main(String[] args) {
    int[] array = new int[16000];
    Random rand = new Random();
    for (int i = 0; i < 16000; i++) {
      array[i] = rand.nextInt(100000);
    }

    long startTime = System.nanoTime();
    bubbleSort(array);
    long endTime = System.nanoTime();

    double elapsedTime = (endTime - startTime) / 1_000_000.0;
    System.out.printf("%.6f%n", elapsedTime);
  }
}
