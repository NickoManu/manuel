/*Esercizio 2
Realizzare il metodo static LinkedList<Integer> creaRandomCrescente(int n) che genera una lista collegata costituita da n valori random crescenti.
Suggerimento: il primo valore della lista viene generato casualmente (ad es nell’intervallo 0-100); i
valori successivi si ottengono sommando al corrispondente valore della cella precedente un nuovo
valore random intero (ad es. con intervallo 0-100).

Parte 2
Realizzare un metodo static LinkedList<Integer> parseString(LinkedList<String> a) che ritorna una lista  Collegata di interi ottenuti 
applicando il metodo Integer.parseInt(…) agli elementi dell’iteratore passato come parametro.

a. Per il test generare una lista di stringhe opportuna con almeno 10 elementi
b. Individuare almeno un input in cui il metodo genera una eccezione
3. Realizzare il metodo static void provaEx2() per il test dei metodi
*/
import java.util.*;
public class Es3_1_2 {

	public static LinkedList<Integer> creaRandomCrescente(int n){
		
		LinkedList<Integer> lista = new LinkedList<Integer>();
		Random ran = new Random();
		int num=ran.nextInt(100);
		lista.add(num);
		num=num+ran.nextInt(100);
		lista.add(num);
		//ListIterator <Integer> i = lista.listIterator();
		for(int j=(lista.size());j<n;j++) {
			num=(lista.get(j-1)) + (ran.nextInt(100));
			lista.add(num);
			//i=lista.listIterator();
		}
		return lista;
	}
	
	public static LinkedList<Integer> parseString(LinkedList<String> a){
		
		LinkedList<Integer> lista = new LinkedList<Integer>();
		
		for(int i=0; i<a.size(); i++) {
			lista.add(Integer.parseInt(a.get(i)));
		}		
		return lista;
	}
	
	public static void stampa(Iterator<Integer> i) {
		while(i.hasNext()) {
			System.out.print(i.next() + ",");
		}
		System.out.println("");
	}
	
	public static void provaEx2() {
		LinkedList<Integer> lista = creaRandomCrescente(10);
		Iterator<Integer> i = lista.iterator();
		System.out.println("Lista Random Crescente");
		stampa(i);
		System.out.println("Lista parseString");
		LinkedList<String> a = new LinkedList<String>();
		//genero 10 input opportuni per la lista a
		a.add("22");
		a.add("42");
		a.add("34");
		a.add("56");
		a.add("87");
		a.add("65");
		a.add("96");
		a.add("29");
		a.add("15");
		a.add("97");
		
		LinkedList<Integer> b = parseString(a);
		Iterator<Integer> ib = b.iterator();
		stampa(ib);
		
	}
	
	public static void main (String [] args) {
		provaEx2();
	}
	
}
