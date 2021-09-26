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
public class Balanza {
    private double monto;
    private int cantItems;

    public Balanza() {
        
    }
 
    public void iniciarCompra(){
        monto = 0;
        cantItems = 0;
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
