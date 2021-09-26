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
public class Ejercicio1b {
    public static void main(String[] args) {
        
        
        System.out.print("Ingrese el lado 'a' del triangulo:  ");
        double a = Lector.leerDouble();
        System.out.print("Ingrese el lado 'b' del triangulo: ");
        double b = Lector.leerDouble();
        System.out.print("Ingrese el lado 'c' del triangulo: ");
        double c = Lector.leerDouble();
        System.out.print("Ingrese el lel color de relleno: ");
        String relleno = Lector.leerString();
        
        Triangulo unTriangulo = new Triangulo(a,b,c,relleno);
        
        System.out.println("El Area del trinaulo es: " + unTriangulo.calcularArea());
        System.out.println("El Perimetro del triangulo es: "+ unTriangulo.calcularPerimetro());
    }
}
