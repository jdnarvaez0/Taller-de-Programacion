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
public class Triangulo {
    double a;
    double b;
    double c;
    String relleno;

    public Triangulo(double a, double b, double c, String relleno) {
        this.a = a;
        this.b = b;
        this.c = c;
        this.relleno = relleno;
    }

    public double getA() {
        return a;
    }

    public double getB() {
        return b;
    }

    public double getC() {
        return c;
    }

    public String getRelleno() {
        return relleno;
    }

    public void setA(double a) {
        this.a = a;
    }

    public void setB(double b) {
        this.b = b;
    }

    public void setC(double c) {
        this.c = c;
    }

    public void setRelleno(String relleno) {
        this.relleno = relleno;
    }
    
    public double calcularPerimetro(){
        return a+b+c;
    }
    
    public double calcularArea(){
        double s = calcularPerimetro() / 2;
        return Math.sqrt((s*(s-a)*(s-b)*(s-c)));
    }
    
}
