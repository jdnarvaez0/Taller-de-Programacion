/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParteUno;

import PaqueteLectura.Lector;

/**
 *
 * @author juand
 */
public class Ejercicio4b {
  public static void main(String[] args) {
        
        System.out.println("Ingrese el Radio del circulo: ");
        double radio = Lector.leerDouble();
        System.out.println("Ingrese el Relleno del circulo: ");
        String relleno = Lector.leerString();
        System.out.println("Ingrese el color de linea: ");
        String colorLinea = Lector.leerString();
        
        Circulo unCirculo = new Circulo(radio,relleno,colorLinea);
        
        System.out.println("El perimetro del circulo es: " + unCirculo.calcularPerimetro());  
        System.out.println("El area del circulo es: " + unCirculo.calcularArea() );
    }
}
