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
public class Ejercicio6 {
    public static void main(String[] args) {
        int dimF = 20;
        int dimL = 0;
        String nomVisitante = "";
        Partido [] vPartido = new Partido [dimF];
        
        while ((dimL < dimF) && (!nomVisitante.equals("ZZZ"))) {            
            
            System.out.print("Ingrese nombre del equipo visitante: ");
            nomVisitante = Lector.leerString();
            if (!nomVisitante.equals("ZZZ")) {
                                
                System.out.print("Ingrese los goles del equipo visitante: ");
                int golVisitante = Lector.leerInt();
                System.out.print("Ingrese nombre del equipo local: ");
                String nomLocal = Lector.leerString();
                System.out.println("Ingrese los goles del equipo local");
                int golLocal = Lector.leerInt();
                
                
                vPartido[dimL] = new Partido(nomLocal,nomVisitante,golLocal,golVisitante);
                dimL++;
            }  
        }
        
        int cantRiver = 0;
        int cantGolBoca = 0;
        int cantEmpates = 0;
        for (int i = 0; i < dimL; i++) {
            if (((vPartido[i].hayGanador() && (vPartido[i].getGanador().equals("River"))))) {
                cantRiver++;
            }else{
                cantEmpates++;
            }
            
            if (vPartido[i].getLocal().equals("Boca")) {
                cantGolBoca += vPartido[i].getGolesLocal();
            }
        }
    }
}
