package Fibonacci;
public class Helper {

    public static long fibonacci(int n, int prev, int current) {
        if (n < 2 ) {
            return current;
        }
        System.out.print(current + ", ");
        return fibonacci(n - 1, current, current + prev);
    }

}
