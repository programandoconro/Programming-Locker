
import java.util.Scanner;  

class HolaMundo { 
    public static void main(String[] args) { 
        System.out.println(" "); 

        Scanner myObj = new Scanner(System.in); 
        System.out.println("Por favor, ingrese su nombre:");

        String userName = myObj.nextLine();  
        System.out.println("Bienvenido " + userName);  


     } 
} 


