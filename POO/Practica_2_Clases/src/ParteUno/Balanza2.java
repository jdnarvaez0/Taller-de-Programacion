/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParteUno;

/**
 *
 * @author juand
 */
public class Balanza2 {
    private double monto;
    private int cantItems;
    private String resumen;

    public Balanza2() {
        
    } 
 
    public void iniciarCompra(){
        monto = 0;
        cantItems = 0;
        resumen = "";
    }
    
    public void registrarProducto(double pesoKg, double precioPorKg){
        monto = monto + precioPorKg * pesoKg;
        cantItems++;
    }    
    public double devolerMontoAPagar(){
        return monto;
    }
    
    public String devolverResumenDeCompra(){
        String aux = "Total a pagar " + devolerMontoAPagar() + " por la compra de " + cantItems + " productos";
        return aux;
    }
}
