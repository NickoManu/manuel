/*Scrivere un programma / metodo che data una stringa in input ne stampi le sole vocali. 
 * Per esempio, se si immette la stringa "Viva Java", il programma stampa "iaaa".
 */

import java.util.Scanner;

public class EsStringhe2 {

	public static void main(String[] args) {
		
		String s;
		
		Scanner kb = new Scanner (System.in) ;
		System.out.println("Inserisci una stringa: ");
		s = kb.nextLine();
		s = s.toLowerCase();
		for(int i = 0; i<s.length(); i++) {
			if((s.charAt(i) == 'a') || (s.charAt(i) == 'e') || (s.charAt(i) == 'i') || (s.charAt(i) == 'o') || (s.charAt(i) == 'u'))
				System.out.print(s.charAt(i));
		}
		
		kb.close();
 		
	}
	
}
