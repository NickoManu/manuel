/*dato un array di interi, popolato casualmente, ordinarlo in ordine crescente e stampare a video
 *  il risultato di tale ordinamento.
 */

public class Es1_1_1 {

	public static void main(String [] args) {
		
		int [] array = new int [20];
		int supp=0;
		
		for(int i=0; i<array.length; i++)
			array[i]=(int)(Math.random()*100);
		
		for(int i=0; i<array.length-1; i++) {
			for(int j=i+1; j<array.length; j++) {
				if(array[i]>array[j]) {
					supp=array[i];
					array[i]=array[j];
					array[j]=supp;
				}
			}
		}
		
		for(int i=0; i<array.length; i++)
			System.out.print(array[i] + " ");
		
	}

	
}
