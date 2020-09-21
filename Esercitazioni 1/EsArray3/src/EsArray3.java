
/*Scrivere un programma / metodo che preveda un array di 10 numeri interi contenente valori random e 
 * che stampi la dicitura "Tre valori consecutivi uguali" contiene tre valori uguali in tre posizioni 
 * consecutive,qualora la condizione non dovesse essere verificata dovrà stampare "NO". 
 */

public class EsArray3 {
	
	public static void main(String[] args) {
		int[] array = new int [10];
		int n=1; //n incrementa ogni volta che il valore successivo è uguale a quello precedente
		
		for(int i = 0; i < array.length ; i++)
			array[i] = (int)(Math.random()*10);
		
		//for(int i = 0; i < array.length ; i++)
			//System.out.println(array[i]);
		
		//int[] array= {1,2,3,4,4,5,5,7,6,7,8};
		
		for(int i=0; i < array.length - 1; i++) {
				if(array[i]==array[i+1])
					n++;
				else
					n=1;
				if(n==3)  //quando trovo 3 elementi consecutivi mi fermo
					break;
			
		}
		
		if(n==3)
			System.out.println("Tre valori consecutivi uguali");
		else
			System.out.println("NO");
	}

}
