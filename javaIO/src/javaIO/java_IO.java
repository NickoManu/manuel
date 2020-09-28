package javaIO;
import java.io.*;
import java.util.Scanner;

public class java_IO {
	
	public static void main(String [] args) throws IOException{ 
		
		FileReader file = new FileReader("C:\\Users\\Manuel\\Desktop\\prova.txt");
	    BufferedReader b = new BufferedReader(file);	        
	    String s;
	    s=b.readLine();
	    System.out.println("Lettura da file: ");
	    while(s!=null) {	    	
	    	System.out.println(s);
	    	s=b.readLine();	    	
	    }	    
	    file.close();
	    
	    System.out.println("Scrittura di double su file");
	    OutputStream stream = new FileOutputStream("C:\\Users\\Manuel\\Desktop\\provaScrittura.txt");
	    PrintWriter pw = new PrintWriter(stream,true);
	    double num=42.42;
	    pw.println(num);
	    stream.close();
	    
	    System.out.println("lettura da file double: ");
	    FileReader fileR = new FileReader("C:\\Users\\Manuel\\Desktop\\provaScrittura.txt");
	    Scanner scan;
	    scan= new Scanner(fileR);	   
	    while(scan.hasNextDouble()) {
	    	System.out.println(scan.nextDouble());
	    }
	    fileR.close();
	    
	}
}

