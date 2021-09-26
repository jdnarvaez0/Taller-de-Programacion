/*
6- Escriba un programa que simule el ingreso de personas a un banco. Cada
persona que ingresa indica la operación que desea realizar (0: “cobro de cheque” 1:
“depósito/ extracción en cuenta” 2: “pago de impuestos o servicios” 3: “cobro de
jubilación” 4: “cobro de planes”). La recepción de personas culmina cuando un
empleado ingresa la operación 5 (cierre del banco). Informar la cantidad de
personas atendidas por cada operación y la operación más solicitada.
 */
package practica_1_matrices;
import PaqueteLectura.Lector;

/**
 *
 * @author juand
 */
public class Ejercicio6 {
    public static void main(String[] args) {
        int dimF = 5;
        int [] vContador = new int [dimF];
        
        System.out.println("|====Bienvenido al Banco de los suenos=====|");
        System.out.println("0: cobro de cheque");
        System.out.println("1: Deposito / Extraccion de cuenta");
        System.out.println("2: Pago de impuestos o Servicios");
        System.out.println("3: cobro de Jubilacion");
        System.out.println("4: Cobro de Planes");
        System.out.println("5: Cierre del banco");
        System.out.println("|--------------------------------------------|");
        
        System.out.print("Ingrese una opcion: ");
        int opcion = Lector.leerInt();
        
        while (opcion != 5) {            
            switch(opcion){
                case 0:  vContador[opcion] = vContador[opcion] + 1;
                    break;
                case 1:  vContador[opcion] = vContador[opcion] + 1;
                    break;
                case 2:  vContador[opcion] = vContador[opcion] + 1;
                    break;
                case 3:  vContador[opcion] = vContador[opcion] + 1;
                    break;
                case 4:  vContador[opcion] = vContador[opcion] + 1;
                    break;
                default:
            }
            
            System.out.println("0: cobro de cheque");
            System.out.println("1: Deposito / Extraccion de cuenta");
            System.out.println("2: Pago de impuestos o Servicios");
            System.out.println("3: cobro de Jubilacion");
            System.out.println("4: Cobro de Planes");
            System.out.println("5: Cierre del banco");
            System.out.println("|--------------------------------------------|");

            System.out.print("Ingrese una opcion: ");
            opcion = Lector.leerInt();
        }
        int max = -1;
        int posMax = 0;
        for (int i = 0; i < dimF; i++) {
            if (vContador[i] > max) {
                max = vContador[i];
                posMax = i;
            }
            System.out.println("La cantidad de personas atendidas por la operacion "+i+" son: "+vContador[i]);
        }
        System.out.println("La operacion mas solicitada es: "+posMax+" con "+max+" personas atendidas");
    }
}
