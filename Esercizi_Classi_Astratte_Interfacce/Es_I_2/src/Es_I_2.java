/*
 Esercizio 2
Scrivere un programma che sia in grado di istanziare degli oggetti 'distributori di benzina' di cui sia nota la città,
 il proprietario, la capacità e la benzina attualmente contenuta nel distributore.
  Dell'oggetto Distributore, deve essere possibile simulare le operazioni di erogazione del carburante e dei corrispondenti incassi. 
  Implementa una interfaccia Comparable, in modo da consentire il confronto tra 2 distributori in base alla capacità del serbatoio di carburante.

 */
import java.util.Scanner;

public class Es_I_2 {

	public static void main (String [] args) {
		
		Scanner kb = new Scanner(System.in);
		double litri=0;
		String s;
		boolean controllo=false;
		
		Distributore d=new Distributore("Milano", "Esso", 2000, 1500);
		
		do {			
			System.out.println("Inserire numero di litri");
			s=kb.next();
			
			try {
				Double.parseDouble(s);
				controllo=true;
			}catch(Exception e) {
				System.out.println("Errore: inserire un numero");
				controllo=false;
			}			
		}while(controllo == false);
		litri = Double.parseDouble(s);
			d.erogazione(litri);
		
		System.out.println("dati distributore: " + d.toString());
		System.out.println("Confronto Distributori");
		Distributore d2=new Distributore ("Roma", "Q8", 3000, 1750);
		int conf= d.compare(d2);
		if(conf==1)
			System.out.println("il distributore di" + d.getCitta() + " ha una capacita' maggiore di quello di "+ d2.getCitta());
		else {
			if(conf<0)
				System.out.println("il distributore di " + d.getCitta() + " ha una capacita' minore di quello di "+ d2.getCitta());
			else
				System.out.println("il distributore di " + d.getCitta() + " ha la stessa capacita' di quello di "+ d2.getCitta());
		}
		
		kb.close();
	}
	
}
