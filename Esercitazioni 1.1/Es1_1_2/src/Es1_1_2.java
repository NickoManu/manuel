/*Scrivere un metodo che verifichi se una data stringa inserita in input è palindroma, tale metodo dovrà restituire un booleano.*/

import java.util.Scanner;

public class Es1_1_2 {

	public static void main (String [] args) {
		
		String s;
		int f=0;
		boolean t=true;
		Scanner kb = new Scanner (System.in);
		System.out.println("Inserisci una stringa: ");
		s=kb.nextLine();
		f=s.length()-1;
		for(int i=0; i<f; i++) {
			if(s.charAt(i)!=s.charAt(f)) {
				t=false;
				break;
			}
			f--;
		}
		
		System.out.println(t);
		
		kb.close();
		
	}
	
}
