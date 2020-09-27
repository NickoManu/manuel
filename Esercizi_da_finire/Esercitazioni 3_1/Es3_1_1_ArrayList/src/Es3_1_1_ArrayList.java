/*Esercizio 1

Realizzare il metodo static LinkedList<Integer> creaRandom(int n, int max) che genera una lista costituita da n valori interi random tra 0 e max-1. 
Suggerimento : Per la generazione dei valori casuali far riferimento alla classe java.util.Random ed in particolare al metodo nextInt(int). 
In alternativa si può usare il metodo Math.random() che però restituisce un valore double tra 0 e 1 che andrà opportunamente scalato e convertito ad intero.
Parte 2
Realizzare il metodo static void stampa(Iterator<Integer> i) che stampa gli elementi dell’iteratore nella forma <elem1>,<elem2>,…., <elemN>
Parte 3
Realizzare il metodo static void provaEx1() che, utilizzando i metodi appena creati, crei un vettore di 20 elementi random (sia ordinato che non) 
e li stampa. Questo metodo andrà poi chiamato dal main per i test di correttezza.
Riassunto :
ripetere gli esercizi utilizzando l’ArrayList al posto della LinkedList. 
*/
import java.util.*;

public class Es3_1_1_ArrayList {
	
	public static ArrayList<Integer> creaRandom(int n, int max){
		
		ArrayList<Integer> lista = new ArrayList<Integer>();
		int num=0;
		Random ran = new Random();
		for(int i=0; i<n; i++) {
			num=ran.nextInt(max-1);
			lista.add(num);
		}		
		return lista;
		
	}
	
	public static void stampa(Iterator<Integer> i) {
		while(i.hasNext()) {
			System.out.print(i.next() + ",");
		}
		System.out.println(" ");
	}
	
	public static void provaEx1() {
		ArrayList<Integer> lista = creaRandom(20, 100);
		Iterator<Integer> i = lista.iterator();
		//stampa lista non ordinata
		System.out.println("Lista Non Ordinata");
		stampa(i);
		//ordina lista e stampa lista ordinata
		System.out.println("Lista Ordinata");
		Collections.sort(lista);
		i=lista.iterator();
		stampa(i);
	}
	
	public static void main(String [] args) {	
		provaEx1();
	}

}