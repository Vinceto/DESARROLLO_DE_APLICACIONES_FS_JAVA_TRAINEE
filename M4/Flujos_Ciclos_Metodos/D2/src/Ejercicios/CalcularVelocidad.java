package Ejercicios;
import java.util.Scanner;
public class CalcularVelocidad {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        // Declarar las variables
        float distancia;
        float tiempo;

        // Solicitar entrada de datos
        System.out.println("Ingresa la distancia en km: ");
        distancia = sc.nextFloat();

        System.out.println("Ingresa el tiempo en horas: ");
        tiempo = sc.nextFloat();

        // Calcular velocidad
        float velocidad = distancia / tiempo;

        // Mostrar resultado
        System.out.printf("La velocidad es: %.2f km/h%n", velocidad);
        sc.close();
    }
}
