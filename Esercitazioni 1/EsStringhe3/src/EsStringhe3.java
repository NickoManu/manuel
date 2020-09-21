/* Scrivere un programma / metodo che data una sequenza di stringhe, conclusa dalla stringa vuota,  
 * stampi la somma delle lunghezze delle stringhe che iniziano con una lettera maiuscola. Per esempio, 
 * se si immettono le stringhe "Albero", "foglia", "Radici", "Ramo", "fiore" (e poi "" per finire), il programma stampa 16. 
 */

import java.util.Scanner;

public class EsStringhe3 {

	public static void main(String [] args) {
		Scanner kb = new Scanner (System.in) ;
		String[] array = new String [20];
		String s = "";
		int i = 0, lunghezza=0, n=0;
		System.out.println("Il numero massimo di stringhe inseribili e' 20");
		System.out.println("Per terminare premere invio");
		System.out.println("inserisci una stringa: ");
		s = kb.nextLine();
		
		while(s.length()!=0 && i<array.length) {
			n++; //incremento n ogni volta che inserisce una stringa diversa da quella vuota
			array[i] = s;
			i++;
			System.out.println("inserisci una stringa: ");
			s = kb.nextLine();
			}
	
		
		for(int j=0; j <n; j++){
			if(Character.isUpperCase(array[j].charAt(0))) {
				lunghezza = lunghezza + (array[j].length());
			}
			
		}
		
		System.out.println(lunghezza);
		
		kb.close();
	}
	
}
