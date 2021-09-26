/*
4- Se realizará un casting para un programa de TV. El casting durará a lo sumo 5 días y en
cada día se entrevistarán a 8 personas en distinto turno.
a) Simular el proceso de inscripción de personas al casting. A cada persona se le pide
nombre, DNI y edad y se la debe asignar en un día y turno de la siguiente manera: las
personas primero completan el primer día en turnos sucesivos, luego el segundo día y así
siguiendo. La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los
40 cupos de casting.
Una vez finalizada la inscripción:
b) Informar para cada día y turno el nombre de la persona a entrevistar.
NOTA: utilizar la clase Persona y pensar en la estructura de datos a utilizar.

 */
package Segunda_parte;

import PaqueteLectura.Lector;

/**
 *
 * @author juand
 */
public class Ejercicio4 {
    public static void main(String[] args) {
        int cantParticipantes = 40;
        int inscriptos = 0;
        int dia = 0;
        int turno = 0;
        String nombre = "vacio";
//        int acuDia =0;
        Persona [][] vDiaTurno = new Persona [5][8];
        
        int dni,edad;
        
        
        while (( inscriptos < cantParticipantes ) && (!nombre.equals("ZZZ"))) {            
            System.out.print("Ingrese el nombre del participante: ");
            nombre = Lector.leerString();
            if (!nombre.equals("ZZZ")) {
                inscriptos++;
                
                System.out.print("Ingrese el DNI del participante: ");
                dni = Lector.leerInt();
                System.out.print("Ingrese la edad del participante: ");
                edad = Lector.leerInt();
                
                Persona unaPersona = new Persona();
                unaPersona.setNombre(nombre);
                unaPersona.setDNI(dni);
                unaPersona.setEdad(edad);
                
                vDiaTurno[dia][turno] = unaPersona;
                if (turno < 8) {
                    turno++;
                }else{
                    turno = 0;
                    dia++;
                }
            }
        }
        
        for (int i = 0; i < dia; i++) {
            for (int j = 0; j < turno; j++) {
                System.out.println(vDiaTurno[i][j].toString());
            }
            
        }
    }
}
