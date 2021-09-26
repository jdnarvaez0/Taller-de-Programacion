/*
3- A- Definir una clase para representar entrenadores de un club de fútbol. Un entrenador
se caracteriza por su nombre, sueldo básico y la cantidad de campeonatos ganados.
▪ Defina métodos para obtener/modificar el valor de cada atributo.
▪ Defina el método calcularSueldoACobrar que calcula y devuelve el sueldo a cobrar por
el entrenador. El sueldo se compone del sueldo básico, al cual se le adiciona un plus por
campeonatos ganados (5000$ si ha ganado entre 1 y 4 campeonatos; $30.000 si ha
ganado entre 5 y 10 campeonatos; 50.000$ si ha ganado más de 10 campeonatos).
*/
package ParteUno;

/**
 *
 * @author juand
 */
public class Entrenador {
    private String nombre;
    private double sueldoBasico;
    private int cantCampeonatosGanados;

    public Entrenador() {
    }

    public Entrenador(String nombre, double sueldoBasico, int cantCampeonatosGanados) {
        this.nombre = nombre;
        this.sueldoBasico = sueldoBasico;
        this.cantCampeonatosGanados = cantCampeonatosGanados;
    }

    public String getNombre() {
        return nombre;
    }

    public double getSueldoBasico() {
        return sueldoBasico;
    }

    public int getCantCampeonatosGanados() {
        return cantCampeonatosGanados;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setSueldoBasico(double sueldoBasico) {
        this.sueldoBasico = sueldoBasico;
    }

    public void setCantCampeonatosGanados(int cantCampeonatosGanados) {
        this.cantCampeonatosGanados = cantCampeonatosGanados;
    }
    
    public double calcularSueldoACobrar(){
        if (((getCantCampeonatosGanados() >= 1)) && (getCantCampeonatosGanados() <= 4)) {
            return getSueldoBasico() + 5000;
        }else if(((getCantCampeonatosGanados() >= 5)) && (getCantCampeonatosGanados() <= 10)){
            return getSueldoBasico() + 30000;
        }else if(getCantCampeonatosGanados() >= 10){
            return getSueldoBasico() + 50000;
        }else{
            return 0;
        }
    }}
    
    

        

