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
public class Practica1_2 {
    public static void main(String[] args) {
        Persona unaPersona = new Persona();
        
        System.out.print("Ingrese su nombre: ");
        String nombre = Lector.leerString();
        System.out.print("Ingrese su DNI: ");
        int dni = Lector.leerInt();
        System.out.print("Ingrese su edad: ");
        int edad = Lector.leerInt();
        
        unaPersona.setNombre(nombre);
        unaPersona.setDNI(dni);
        unaPersona.setEdad(edad);
        System.out.println(unaPersona.toString());
    }
}
