/*Scrivere un programma / metodo che chiede all’utente di inserire una sequenza di caratteri 
 * (chiedendo prima quanti caratteri voglia inserire) e li ristampa man mano che vengono inseriti. 
 * L’intero procedimento (chiedere quanti caratteri voglia inserire, leggere i caratteri e man mano stamparli) 
 * dovrà essere ripetuto 5 volte. Risolvere questo esercizio senza usare array.
 */

import java.util.Scanner;

public class EsCicli3 {
  public static void main(String [] args) {
	  
	  Scanner kb = new Scanner(System.in);
	  
	  int i=0, max=0;
	  String c="";
	  char car;
	  
	  while(i<5){	  
		  System.out.println("Quanti caratteri vuoi inserire? ");
		  max=kb.nextInt();	
		  
		  while(max>0){
			 System.out.println("inserire carattere: ");
			 c = kb.next();
			 car=c.charAt(0);
			 System.out.println(car);
			 max--;
		  }
		  
		  i++;
	  }
	  
	  kb.close();
  }
}
