/*
B- Realizar un programa principal que instancie un entrenador, cargándole datos leídos
desde teclado. Pruebe el correcto funcionamiento de cada método implementado.
*/
package ParteUno;
import PaqueteLectura.Lector;
/**
 *
 * @author juand
 */
public class Ejercicios3b {
    public static void main(String[] args) {
        System.out.print("Ingrese el nombre del entreandor: ");
        String nombre = Lector.leerString();
        System.out.print("Ingrese el sueldo basico del entreandor: ");
        double sueldoBasico = Lector.leerDouble();
        System.out.println("Ingrese la cantidad de campeonatos ganados: ");
        int cantCampeonatosGanados = Lector.leerInt();
        
        Entrenador unEntreando = new Entrenador(nombre, sueldoBasico,cantCampeonatosGanados);
        
        System.out.println("### IMPRIMO ENTRENADOR ###");
        System.out.println("Nombre: " + unEntreando.getNombre());
        System.out.println("Sueldo Basico: " +  unEntreando.getSueldoBasico());
        System.out.println("Cantidad de campeonatos ganados: " + unEntreando.getCantCampeonatosGanados());
        
        System.out.println("### IMRPRIMO SUELDO A COBRAR ###");
        System.out.println("El sueldo total a cobar es: " + unEntreando.calcularSueldoACobrar());
    }
}
