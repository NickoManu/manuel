/*Scrivere un metodo che mostri i primi 50 numeri della serie di fibonacci 
 * (i primi due numeri di fibonacci sono 0 e 1 i successivi si calcolano come somma dei 2 precedenti).
 */
public class Es1_1_3 {

	public static void main(String [] args) {
		int a=0, b=1, c=0, i=0;
		System.out.print(0 + " " + 1 + " ");
		do {
			c=a+b;
			System.out.print(c + " ");
			a=b;
			b=c;
			i++;
		}while(i<=50);
		
	}
	
}
