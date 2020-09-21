/*Scrivere un programma / metodo che data una stringa in input la stampi al contrario. 
 * Per esempio, se si immette la stringa "Viva Java", il programma stampa "avaJ aviV"
 */


import java.util.Scanner;

public class EsStringhe1 {
	
	public static void main(String [] args) {
		Scanner kb = new Scanner(System.in);
		
		String s;
		String b = "";
		System.out.print("inserisci una stringa: ");
		s = kb.nextLine();
		System.out.println("");
		
		for(int i=s.length()-1; i>=0; i--) {
			b = b + s.charAt(i);
		}
		
		System.out.println("stringa al contrario: " + b);
		
		kb.close();
		
	}

}
