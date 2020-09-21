/*Scrivere un programma / metodo che data una sequenza di interi stampi la media di tutti i numeri inseriti 
 * che siano divisibili per tre. Per esempio, se si immettono i valori 5, 8, 9, 12, 7, 6 ,1 il risultato 
 * stampato dovrà essere 9. Risolvere questo esercizio senza usare array.
 */

import java.util.Scanner;

public class EsCicli2 {

	public static void main (String [] args) {
		
		Scanner kb = new Scanner (System.in);
		int somma=0, n=0, num=0;
		double media=0;
		
		System.out.println("Per terminare inserire 0");
		
		do {
			System.out.println("Inserire un numero: ");
			num=kb.nextInt();
			if(num%3==0 && num!=0) {
				somma=somma + num;
				n++;
			}
		}while(num!=0);
		
		media = somma / n;
		System.out.println(media);
		
		kb.close();
	}
	
}
