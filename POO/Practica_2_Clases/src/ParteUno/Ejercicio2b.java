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
public class Ejercicio2b {
    public static void main(String[] args) {
           
        double pesoKg = -1;
        double precioEnKg = 0;
        
        Balanza unaBalanza = new Balanza();
        unaBalanza.iniciarCompra(); 
        
        while (pesoKg != 0) { 
          
            System.out.print("Ingrese el peso en Kg del item: "); 
            pesoKg = Lector.leerDouble();
            System.out.print("Ingrese el precio por Kg del item: ");
            precioEnKg = Lector.leerDouble();
            unaBalanza.registrarProducto(pesoKg, precioEnKg);
        }
        
         System.out.println(unaBalanza.devolverResumenDeCompra());  
        
    }
}
