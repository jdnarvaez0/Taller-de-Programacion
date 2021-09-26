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
public class Circulo {
    private double radio;
    private String relleno;
    private String colorLinea;

    public Circulo() {
    }

    public Circulo(double radio, String relleno, String colorLinea) {
        this.radio = radio;
        this.relleno = relleno;
        this.colorLinea = colorLinea;
    }

    public double getRadio() {
        return radio;
    }

    public String getRelleno() {
        return relleno;
    }

    public String getColorLinea() {
        return colorLinea;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    public void setRelleno(String relleno) {
        this.relleno = relleno;
    }

    public void setColorLinea(String colorLinea) {
        this.colorLinea = colorLinea;
    }
    
    public double calcularArea(){
        return Math.PI * this.getRadio();
    }
    
    public double calcularPerimetro(){
        return 2 * Math.PI * this.getRadio();
    }
}
