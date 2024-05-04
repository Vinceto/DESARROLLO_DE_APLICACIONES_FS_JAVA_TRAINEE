package cl.desafiolatam;

import static java.lang.System.*;
import java.util.Scanner;

public class MiPrimerPrograma {
    public static void main(String[] args) {
        //TODO Auto-generated method stub
        System.out.println("Hola Mundo!");
        /*Se imprimirá Ingrese un número: por pantalla */
        System.out.printf("Ingrese un número: ");
        /* La clase Scanner se utiliza para leer por consola un valor ingresado por el usuario */
        Scanner sc = new Scanner(System.in);
        /* número, recibe el valor ingresado por el usuario. nextLong devuelve un tipo de dato primitivo long */
        long numero = sc.nextLong();
        /* result, recibe el resultado del método sqrt de la clase Math, la cual calcula la raíz cuadrada de un número */
        double result = Math.sqrt(numero);
        /* finalmente, se imprime el resultado por pantalla con System.out */
        System.out.printf("La raíz cuadrada es: %f", result);
        /* Cerramos la clase Scanner */
        sc.close();

    }
}
