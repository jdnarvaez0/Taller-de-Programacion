/*
5- Realice un programa que cargue un vector con 10 strings leídos desde teclado. El vector
generado tiene un mensaje escondido que se forma a partir de la primera letra de cada
string. Muestre el mensaje escondido en consola.
NOTA: La primera letra de un string se obtiene enviándole el mensaje charAt(0) al objeto
string. Probar con: humo oso lejos ala menos usado nene de ocho ! Debería imprimir:
holamundo!

 */
package Segunda_parte;
//import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author juand
 */
public class Ejercicio5 {
    public static void main(String[] args) {
        String [] vector = new String [10];
        
        /*cargar Vector*/
        GeneradorAleatorio.iniciar();
        for (int i = 0; i < 10; i++) {
            vector[i] = GeneradorAleatorio.generarString(5);
        }
        
        String mensaje="";
        for (int i = 0; i < 10; i++) {
            mensaje += vector[i].charAt(0);
        }
        
        System.out.println("El mensaje es: " + mensaje);
    }
}
