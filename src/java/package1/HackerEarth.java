package package1;

import java.util.*;


class TestClass {

    public static void main(String args[]) throws Exception {

        Scanner s = new Scanner(System.in);
        // Reading input from STDIN
        
        // Write your code here
        int seats = s.nextInt();

        int oppSeat = 0;
        for (int i = 0; i < seats; i++) {
            int num = s.nextInt();
            if (!(num > 108 || num < 1)) {
                if (num%12==0) {
                    oppSeat = (num-12) + 1;
                } else {
                    oppSeat = ((12 * (num / 12 + 1)) - (num % 12) + 1);
                }
                System.out.print(oppSeat);
                switch (oppSeat % 6) {
                    case 1:
                    case 6:
                        System.out.println(" WS");
                        break;
                    case 3:
                    case 4:
                        System.out.println(" AS");
                        break;
                    case 5:
                    case 2:
                        System.out.println(" MS");
                        break;
                    default:
                        System.out.println(" WS");
                        break;
                }
            } else {
                System.out.println("Seat number invalid");
            }
        }

    }
}
