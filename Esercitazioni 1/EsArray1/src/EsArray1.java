
/*Scrivere un programma / metodo che preveda un array di 10 numeri interi contenente valori a piacere e ne stampa gli elementi 
 * secondo il seguente ordine: il primo, l’ultimo, il secondo, il penultimo, il terzo, il terz’ultimo, ecc. 
 */

public class EsArray1 {

	public static void main (String[] args) {
		int[] array =  {1,2,3,4,5,6,7,8,9,10};
		int j = array.length-1;
		for(int i=0; i<(array.length/2);i++) {
			System.out.print(array[i] + " " + array[j] + " ");
			j--;
		}
		
	}
	
}
