
/*Scrivere un programma / metodo che preveda un array di 10 numeri interi contenente valori random. 
 * Tale programma dovrà stampare la dicitura "Pari e dispari uguali" se la somma dei numeri in posizioni pari dell’array 
 * è uguale alla somma dei numeri in posizioni dispari, altrimenti il programma dovrà stampare la dicitura "Pari e dispari diversi".
 */


public class EsArray2 {

	public static void main(String[] args) {
		int sommaPari = 0, sommaDispari = 0, j = 1;
		int[] array = new int [10];
		
		for(int i=0; i<array.length; i++)
			array[i] = (int)(Math.random()*10);
		
		for(int i=0;i<((array.length)-1);i = i+2) {
			sommaPari = sommaPari+array[i];
			sommaDispari = sommaDispari+array[j];
			j=j+2;
		}
		
		//System.out.println("SommaPari: "+ sommaPari);
		//System.out.println("SommaDispari: "+ sommaDispari);
		
		if(sommaPari == sommaDispari)
			System.out.println("Pari e Dispari Uguali");
		else
			System.out.println("Pari e Dispari Diversi");
		
	}
	
}
