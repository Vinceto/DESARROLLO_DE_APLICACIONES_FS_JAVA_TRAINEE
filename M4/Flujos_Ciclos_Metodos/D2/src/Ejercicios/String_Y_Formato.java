package Ejercicios;
import java.util.Scanner;
public class String_Y_Formato {
    /*
    Scanner sc = new Scanner(System.in);
    public String nombre = sc.nextLine(); //Carmen
    public String apellido = sc.nextLine(); //Silva
    public String direccion = sc.nextLine(); //Los aguiluchos
    public int numeroDireccion = sc.nextInt(); //43
    public String ciudad = sc.nextLine(); //Concepción
    public int telefono = sc.nextInt(); //562264895
     */
    private String nombre;
    private String apellido;
    private String direccion;
    private int numeroDireccion;
    private String ciudad;
    private int telefono;

    public void leerDatos() {
        Scanner sc = new Scanner(System.in);
        System.out.print("Nombre: ");
        this.nombre = sc.nextLine();
        System.out.print("Apellido: ");
        this.apellido = sc.nextLine();
        System.out.print("Dirección: ");
        this.direccion = sc.nextLine();
        System.out.print("Número de Dirección: ");
        this.numeroDireccion = sc.nextInt();
        sc.nextLine(); // Consumir el salto de línea pendiente
        System.out.print("Ciudad: ");
        this.ciudad = sc.nextLine();
        System.out.print("Teléfono: ");
        this.telefono = sc.nextInt();
    }
    public void mostrarDatos() {
        System.out.print("Nombre: "+getNombre()+"\nApellido: "+getApellido()+"\nDireccion: "+getDireccion()+" "+getNumeroDireccion()+"\nCiudad: "+getCiudad()+"\nTelefono: "+getTelefono());
        System.out.print("Nombre: "+nombre+"\nApellido: "+apellido+"\nDireccion: "+direccion+" "+numeroDireccion+"\nCiudad: "+ciudad+"\nTelefono: "+telefono);
    }
    public boolean datosIngresados() {
        return nombre != null && !nombre.isEmpty() &&
                apellido != null && !apellido.isEmpty() &&
                direccion != null && !direccion.isEmpty() &&
                ciudad != null && !ciudad.isEmpty() &&
                telefono != 0; // Suponiendo que 0 no es un valor válido para telefono
    }
    // Métodos para acceder a los datos desde fuera de la clase
    public String getNombre() {
        return nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public String getDireccion() {
        return direccion;
    }

    public int getNumeroDireccion() {
        return numeroDireccion;
    }

    public String getCiudad() {
        return ciudad;
    }

    public int getTelefono() {
        return telefono;
    }
}
