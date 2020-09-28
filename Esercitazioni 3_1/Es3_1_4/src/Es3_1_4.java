/*Esercizio 4 
1. Realizzare il metodo static LinkedList<LinkedList<Integer> insiemeDiInsiemi(int n) che costruisce una lista di liste così definita:

a. Il primo elemento della lista contiene una lista con il solo valore 0;
b. Il secondo elemento contiene una lista con gli elementi 0 e 1
c. Il terzo contiene una lista con gli elementi 0,1,2
d. … e così via fino ad n-1

2. Realizzare il metodo static void stampa(LinkedList <LinkedList<Integer>> a) in grado di stampare il contenuto della lista
*/
import java.util.*;
public class Es3_1_4 {

	public static LinkedList<LinkedList<Integer>> insiemeDiInsiemi(int n){
		LinkedList<LinkedList<Integer>> lista = new LinkedList<LinkedList<Integer>>();
		
		for(int i=0;i<n;i++) {
			LinkedList<Integer> a = new LinkedList<Integer>();
			for(int j=0;j<=i;j++) {
				a.add(j);
			}
			lista.add(a);
		}
		
		return lista;
	}
	
	public static void stampa(LinkedList<LinkedList<Integer>> a) {
		for(int i=0;i<a.size();i++) {
			System.out.print("[ ");
			for(int j=0;j<a.get(i).size();j++) {
				System.out.print(a.get(i).get(j) + " ");
			}
			System.out.print("],");
		}
		System.out.println(" ");
	}
	
	public static void main(String [] args) {
		LinkedList<LinkedList<Integer>> m =insiemeDiInsiemi(10);
		stampa(m);
	}
	
}
