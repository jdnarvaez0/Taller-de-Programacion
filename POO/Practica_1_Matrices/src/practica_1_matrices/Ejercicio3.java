/*
 3- Escriba un programa que lea las alturas de los 15 jugadores de un equipo de
básquet y las almacene en un vector. Luego informe:
- la altura promedio
- la cantidad de jugadores con altura por encima del promedio

 */
package practica_1_matrices;
import PaqueteLectura.Lector;

/**
 *
 * @author juand
 */
public class Ejercicio3 {
    public static void main(String[] args) {
        int dimF = 15;
        double vAltura  [] = new double [dimF];
        
        double sumaAltura = 0;
        
        for (int i = 0; i < dimF; i++) {
            System.out.print("Ingrese la altura del jugador "+i+" : ");
            double altura = Lector.leerDouble();
            vAltura[i] = altura;
            sumaAltura = sumaAltura + altura;
        }
        
        double promAltura = sumaAltura / dimF;
        System.out.println("La latura promedio es: " + promAltura);
        
        int cant = 0;
        for (int i = 0; i < dimF; i++) {
            if (vAltura[i] > promAltura) {
                cant++;
            }
        }
        System.out.println("La cantidad de juagadores por encima de la altura proemdio es: "+ cant);
    }
}
