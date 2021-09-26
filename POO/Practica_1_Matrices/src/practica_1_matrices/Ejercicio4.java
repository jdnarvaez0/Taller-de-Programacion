/*
  4- Escriba un programa que defina una matriz de enteros de tamaño 10x10.
Inicialice la matriz con números aleatorios entre 0 y 200.
Luego realice las siguientes operaciones:
- Mostrar el contenido de la matriz en consola.
- Calcular e informar la suma de todos los elementos almacenados entre las
filas 2 y 9 y las columnas 0 y 3
- Generar un vector de 10 posiciones donde cada posición i contiene la suma
de los elementos de la columna i de la matriz.
- Lea un valor entero e indique si se encuentra o no en la matriz. En caso de
encontrarse indique su ubicación (fila y columna) en caso contrario
imprima “No se encontró el elemento”.
 
 */
package practica_1_matrices;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
/**
 *
 * @author juand
 */
public class Ejercicio4 {
    
    public static void main(String[] args) {
        int [][] tabla = new int [10][10];
        int [] vSuma = new int [10];
        
        /*Inicializar matris*/
        for (int i = 0; i < 10; i++) {
            for (int j = 0; j < 10; j++) {
                tabla[i][j] = GeneradorAleatorio.generarInt(200);
            }
        }
        
        /*Imprimir matriz*/
        for (int i = 0; i < 10; i++) {
            for (int j = 0; j < 10; j++) {
                System.out.print(tabla[i][j] + " ");
            }
            System.out.println();
        }
        
        /*calacular suma*/
        int suma = 0;
        for (int i = 2; i < 9; i++) { //fila
            for (int j = 0; j < 3; j++) { //columnas
                suma = suma + tabla[i][j];
            }
        }
        System.out.println("La suma entre las filas 2 y 9 y columnas 0 y 3 es: " + suma);
        
        /*sumar la columna i de la matriz*/
        int sumaColumna = 0;
        for (int i = 0; i < 10; i++) {
            for (int j = 0; j < 10; j++) {
                sumaColumna = sumaColumna + tabla[j][i]; //hay que intercambiar las filas por columnas
            }
            vSuma[i] = sumaColumna;
            System.out.println("La suma de la columna "+i+" es: "+ vSuma[i]);
        }
        
        /*indicar si un numero esta en la matriz*/
        System.out.print("Ingrese un numero para buscar en la matriz: ");
        int numX = Lector.leerInt();
        for (int i = 0; i < 10; i++) {
            for (int j = 0; j < 10; j++) {
                if (numX == tabla[i][j]) {
                    System.out.println("El numero " +numX+ " se encuetra en las cordenadas: "+i +" "+j); 
                }else{
                    System.out.println("NO se encontro el elemento en la matriz");
                }
            }
        }
        
    }
}
