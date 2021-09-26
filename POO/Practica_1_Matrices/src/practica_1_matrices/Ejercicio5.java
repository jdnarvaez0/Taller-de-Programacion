/*
 5- Un edificio de oficinas está conformado por 8 pisos y 4 oficinas por piso. Realice
un programa que permita informar la cantidad de personas que concurrieron a
cada oficina de cada piso. Para esto, simule la llegada de personas al edificio de la
siguiente manera: a cada persona se le pide el nro. de piso y nro. de oficina a la cual
quiere concurrir. La llegada de personas finaliza al indicar un nro. de piso 9. Al
finalizar la llegada de personas, informe lo pedido.
 */
package practica_1_matrices;
import PaqueteLectura.Lector;

/**
 *
 * @author juand
 */
public class Ejercicio5 {
    public static void main(String[] args) {
        int piso = 9;
        int ofi = 4;
        int [][] vEdificio = new int [piso][ofi];
        
        System.out.println("Bienvenido a Google");
        System.out.print("Ingrese numero de piso: ");
        int nPiso = Lector.leerInt();
        System.out.print("Ingrese el numero de la oficina: ");
        int nOficina = Lector.leerInt();
        
        while(nPiso != 9){
            vEdificio[nPiso][nOficina] = vEdificio[nPiso][nOficina] + 1;
            
            System.out.print("Ingrese numero de piso: ");
            nPiso = Lector.leerInt();
            System.out.print("Ingrese el numero de la oficina: ");
            nOficina = Lector.leerInt();
        }
        
        
        /*imprimo matriz 'edificio'*/
        System.out.println("#### imprimo edificion ####");
        for (int i = 0; i < piso; i++) {
            for (int j = 0; j < ofi; j++) {
                if (vEdificio[i][j] == 0 ) {
                    System.out.print(" * ");
                }else{
                    System.out.print(vEdificio[i][j]+" ");
                }
            }
            System.out.println();
        }
        
        /*Imprimo el total de las oficinas*/
        System.out.println("#### imprimo total por oficinas ####");
        for (int i = 0; i < piso; i++) {
            for (int j = 0; j < ofi; j++) {
                System.err.println("El numero de personas que estuvieron en las oficinas "+i+" "+j+" son: " +vEdificio[i][j]);
            }
        }
        
        
        
    }
}
