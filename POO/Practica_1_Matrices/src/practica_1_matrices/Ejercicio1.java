/*
 * To chan1- Escriba un programa que imprima en consola el factorial de un número N
(ingresado por teclado, N > 0). Ejemplo: para N=5 debería imprimir 5! = 120
 */
package practica_1_matrices;
import PaqueteLectura.Lector; 

/**
 *
 * @author juand
 */
public class Ejercicio1 {
    public static void main(String[] args) {
        System.out.print("Ingrese un numero: ");
        int num = Lector.leerInt();
        int factorial = 1;
        if (num > 0) {
            for (int i = 2; i <= num; i++) {
                factorial = factorial * i;
            }  
            System.out.println("El resultado del factorial de " + num + " es: " + factorial );
        }
    }
}
