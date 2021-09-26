/*
2- Escriba un programa que imprima en consola el factorial de todos los números
entre 1 y 9. ¿Qué modificación debe hacer para imprimir el factorial de los
números impares solamente?
*/
package practica_1_matrices;
/**
 *
 * @author juand
 */
public class Ejercicio2 {
    public static void main(String[] args) {
        int num = 2;
        int factorial = 1;
        if (num > 0) {
            while(num <= 9){
                for (int i = 2; i <= num; i++) {
                    factorial = factorial * i;
                }
                System.out.println("El factorial de "+ num +" es: " + factorial);
                
//                if (num % 2 != 0) {
//                    for (int i = 2; i <= num; i++) {
//                        factorial = factorial * i;
//                    }
//                    System.out.println("Imprimo factorial de numero impar");
//                    System.out.println("El factorial de "+ num +" es: " + factorial);
//                }
                
                num++;
                factorial = 1;
            }
        }
    }
}
