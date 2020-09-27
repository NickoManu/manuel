/*Esercizio 3 
1. Realizzare il metodo static LinkedList<Integer> mergeOrdinato(Iterator<Integer> a, Iterator<Integer> b) 
che effettua il merge ordinato degli elementi dei due iteratori, ritornando il risultato in una lista collegata.
In particolare il merge di due liste ordinate (qui rappresentate dai corrispondenti iteratori, da assumere
come già ordinati) restituisce una nuova lista ordinata contente tutti gli elementi appartenenti alle due liste
di input.

2. Realizzare il metodo static void provaEx3() che crea due liste random ordinate e restituisce il merge
ordinato delle due. Il risultato così ottenuto dovrà essere stampata, insieme ai corrispondenti vettori di input.
*/
import java.util.*;

public class Es3_1_3 {

	public static LinkedList<Integer> mergeOrdinato(Iterator<Integer> a, Iterator<Integer> b){
		LinkedList<Integer> lista = new LinkedList<Integer>();
		
		while(a.hasNext()) {
			lista.add(a.next());			
		}
		while(b.hasNext()) {
			lista.add(b.next());
		}
		
		Collections.sort(lista);
		
		return lista;
	}
	
	public static void stampa(Iterator<Integer> i) {
		while(i.hasNext()) {
			System.out.print(i.next() + ",");
		}
		System.out.println("");
	}
	
	public static void provaEx3() {
		LinkedList<Integer> a = new LinkedList<Integer>();
		LinkedList<Integer> b = new LinkedList<Integer>();
		Random ran=new Random();
		for(int i=0;i<10;i++) {
			a.add(ran.nextInt(100));
		}
		for(int i=0;i<10;i++) {
			b.add(ran.nextInt(100));
		}
		Iterator<Integer> ia = a.iterator();
		System.out.println("Lista a");
		stampa(ia);
		Iterator<Integer> ib = b.iterator();
		System.out.println("Lista b");
		stampa(ib);
		System.out.println("Lista Merge Ordinato");
		LinkedList<Integer> ordinato = mergeOrdinato(a.iterator(), b.iterator());		
		Iterator<Integer> im = ordinato.iterator();		
		stampa(im);
		
	}
	
	public static void main(String [] args) {
		provaEx3();
	}
	
}
