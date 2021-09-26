/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Segunda_parte;

import PaqueteLectura.Lector;

/**
 *
 * @author juand
 */
public class Ejercicio2 {
    public static void main(String[] args) {
        Persona [] vPersona = new Persona [15];
        
        int minDNI = 9999;
        int cantMayores = 0;
        int pos = -1;
        
        for (int i = 0; i < 15; i++) {
            System.out.print("Ingrese su nombre: ");
            String nombre = Lector.leerString();
            System.out.print("Ingrese su DNI: ");
            int dni = Lector.leerInt();
            System.out.print("Ingrese su edad: ");
            int edad = Lector.leerInt();
            
            Persona unaPersona = new Persona();
            unaPersona.setNombre(nombre);
            unaPersona.setDNI(dni);
            unaPersona.setEdad(edad);
            
            if (dni < minDNI){
                minDNI = dni;
                pos = i;
            }
            
            if (edad > 65) 
                cantMayores++;
            
            vPersona[i] = unaPersona;
        }
        System.out.println("La cantidad de personas mayores a 65 son: "+cantMayores);
        System.out.println("La persona con el menor DNI es: "+vPersona[pos].toString());
        
    }
}
