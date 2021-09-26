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
public class Producto {
    private double pesoEnKg;
    private String descripcion;

    public Producto() {
    }

    public Producto(double pesoEnKg, String descripcion) {
        this.pesoEnKg = pesoEnKg;
        this.descripcion = descripcion;
    }

    public double getPesoEnKg() {
        return pesoEnKg;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setPesoEnKg(double pesoEnKg) {
        this.pesoEnKg = pesoEnKg;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
}
