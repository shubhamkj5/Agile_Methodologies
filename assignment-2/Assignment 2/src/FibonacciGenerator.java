import java.util.Scanner;


public class FibonacciGenerator {
	
	  public static int calculateNthValue(int number){
	        if(number == 1 || number == 2){
	            return 1;
	        }
	      
	        return calculateNthValue(number-1) + calculateNthValue(number -2); 
	  }
	  
	  public static boolean validateN(int number) 
	  {  String data=""+number; 	
		 String regex = "[1-9]+"; 
	     if(number>0 || data.matches(regex)) {
	    	 return true;
	     }
	       return false;
	  } 
	  
	  public static void main(String args[]) {
		  int number = 0;
	        System.out.println("Enter number upto which Fibonacci series to print: ");
	        try {
	        number = new Scanner(System.in).nextInt();
	        if(validateN(number)==true) {
	            System.out.println(number + " is a valid integer number"); 
	            System.out.println("Fibonacci series upto " + number +" numbers : ");
		            System.out.print(calculateNthValue(number) +" ");
		       
	            }
	        else {  
	        	throw new Exception();
	          
	        }
	      
	        }
	        catch(Exception e) {
	        	System.out.println(number+" is either 0 or negative or not a valid integer number");
	        }
	       
	       
	    }
}
