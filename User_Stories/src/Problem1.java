import java.util.Scanner;

public class Problem1 {
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc=new Scanner(System.in);
		System.out.println("Please Enter your name");
		String name=sc.next();
		if(name=="") {
			System.out.println("Please Enter your name");
		}
		else if( name.matches(".*\\d+.*")) {
			System.out.println("Please Enter Only Characters");
		}
		else {
			System.out.println("Name is: "+name);
		}

	}

}
