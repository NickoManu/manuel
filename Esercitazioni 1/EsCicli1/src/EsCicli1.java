/*Scrivere un programma / metodo che data una sequenza di interi stampi "Tutti positivi e pari" se i numeri inseriti 
 * sono tutti positivi e pari, altrimenti stampa "NO". Risolvere questo esercizio senza usare array.
 */

import java.util.Scanner;

public class EsCicli1 {

	public static void main(String [] args) {
		
		Scanner kb = new Scanner (System.in);
		boolean pp = true;
		int num=0;
		System.out.println("Per terminare inserire 0");
		do {
			System.out.println("inserisci un numero: ");
			num = kb.nextInt();
			if(num < 0 || num%2 != 0)
				pp=false;			
		}while(num!=0);
		
		if(pp)
			System.out.println("Tutti positivi e pari");
		else
			System.out.println("NO");
		
		kb.close();
	
	}
}
