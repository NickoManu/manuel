/*Esercizio 2 Con Classe Astratta
Scrivere un programma che simuli il lancio di un dado e di una moneta stampandone il risultato;
 con e senza l'utilizzo di una classe astratta che rappresenti i comportamenti comuni degli oggetti dado e moneta istanziati.
*/

public class Cl_As_2_con_CA {

	public static void main(String [] args) {
		Dado d= new Dado();
		System.out.println("Lancio dado: " + d.lancio());
		Moneta m= new Moneta();
		System.out.println("Lancio Moneta: " + m.lancio());
	}
	
}
