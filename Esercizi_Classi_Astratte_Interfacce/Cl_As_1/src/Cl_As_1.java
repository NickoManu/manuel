/*Esercizio 1
Realizzare un programma che sia in grado di valutare il volume di oggetti tridimensionali come cilindri e parallelepipedi 
basandosi sul valore della loro area e dell'altezza. Delegare i metodi comuni, come il calcolo e la stampa del volume ad una classe astratta.
*/
public class Cl_As_1 {

	public static void main(String [] args) {
		
		System.out.println("Cilindro: ");
		double area= (Math.random()*100);
		double altezza= (Math.random()*100);
		Cilindro d=new Cilindro (area, altezza);
		d.getVolume();
		area= (Math.random()*100);
		altezza= (Math.random()*100);
		System.out.println("Parallelepipedo: ");
		Parallelepipedo p=new Parallelepipedo (area, altezza);
		p.getVolume();
		
	}
	
}
