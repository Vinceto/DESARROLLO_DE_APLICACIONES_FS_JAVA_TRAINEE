package Ejercicios;
import java.util.Scanner;
public class Promedio_Final {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Ingresar información del estudiante
        System.out.println("Ingrese el nombre completo del estudiante:");
        String nombreEstudiante = scanner.nextLine();

        System.out.println("Ingrese la asignatura:");
        String asignatura = scanner.nextLine();

        System.out.println("Ingrese el nombre del docente:");
        String nombreDocente = scanner.nextLine();

        System.out.println("Ingrese la nota 1:");
        double nota1 = scanner.nextDouble();

        System.out.println("Ingrese la nota 2:");
        double nota2 = scanner.nextDouble();

        System.out.println("Ingrese la nota 3:");
        double nota3 = scanner.nextDouble();

        // Calcular el promedio
        double promedio = (nota1 + nota2 + nota3) / 3;

        // Mostrar hoja de calificaciones
        System.out.println("\nHoja de Calificaciones");
        System.out.println("----------------------");
        System.out.println("Nombre del Estudiante: " + nombreEstudiante);
        System.out.println("Asignatura: " + asignatura);
        System.out.println("Docente: " + nombreDocente);
        System.out.println("Nota 1: " + nota1);
        System.out.println("Nota 2: " + nota2);
        System.out.println("Nota 3: " + nota3);
        System.out.println("Promedio Final: " + promedio);
    }

}
