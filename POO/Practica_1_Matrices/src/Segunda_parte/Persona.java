/*
1 – Se dispone de una clase Persona (ya implementada en la carpeta tema2). Un objeto
persona puede crearse sin valores iniciales o enviando en el mensaje de creación el
nombre, DNI y edad (en ese orden). Un objeto persona responde a los siguientes mensajes:
getNombre()
getDNI()
getEdad()
setNombre(X)
setDNI(X)
setEdad(X)
toString()
retorna el nombre (String) de la persona
retorna el dni (int) de la persona
retorna la edad (int) de la persona
modifica el nombre de la persona al “String” pasado por parámetro (X)
modifica el DNI de la persona al “int” pasado por parámetro (X)
modifica la edad de la persona al “int” pasado por parámetro (X)
retorna un String que representa al objeto. Ej: “Mi nombre es Mauro, mi DNI es
11203737 y tengo 70 años”
Realice un programa que cree un objeto persona con datos leídos desde teclado. Luego
muestre en consola la representación de ese objeto en formato String.
Piense y responda: ¿Qué datos conforman el estado del objeto persona? ¿Cómo se
implementan dichos datos? ¿Qué ocurre cuando se le envía un mensaje al objeto?

 */
package Segunda_parte;

/**
 *
 * @author juand
 */
public class Persona {
   
   //Son las caracteriasticas, variables
   private String nombre;
   private int DNI;
   private int edad;
   
   //constructor
   public Persona (String unNombre, int unDNI, int unaEdad){
       nombre = unNombre;
       DNI = unDNI;
       edad = unaEdad;
   }
   
   //Constructor vacio
   public Persona(){
       
   }
   
   //metodos

    public String getNombre() {
        return nombre;
    }

    public int getDNI() {
        return DNI;
    }

    public int getEdad() {
        return edad;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setDNI(int DNI) {
        this.DNI = DNI;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String toString(){
        String aux;
        aux = "Mi nombres es " + nombre + " mi DNI es: "+ DNI+ " y tengo "+ edad+"anios";
        return aux;
    }
}
