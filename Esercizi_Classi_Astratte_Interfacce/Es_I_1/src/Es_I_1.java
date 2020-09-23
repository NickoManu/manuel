/*Esercizio 1
Scrivere un programma che dato un numero intero in ingresso vengano restituiti un oggetto rappresentativo del 
quadrato del numero dato e un oggetto rappresentativo del cubo del numero assegnato.
Implementa l'algoritmo attraverso l'uso di una interfaccia comune. 
*/

import java.util.Scanner;

public class Es_I_1 {

	public static void main(String [] args) {
	Scanner kb=new Scanner(System.in);
	String s;
	int n=0;
	boolean controllo = false;
	
	do {
	System.out.println("Inserisci un numero: ");
	s=kb.next();
	try {
		Integer.parseInt(s);
		controllo=true;
	}catch(Exception e) {
		System.out.println("Errore: Devi inserire un numero intero");
		controllo=false;
	}	
	}while(controllo == false);
	n=Integer.parseInt(s);
	
	Quadrato q = new Quadrato(n);
	Cubo c= new Cubo(n);
	
	System.out.println("Il Quadrato di " + n + " e': " + q.getRisultato());
	System.out.println("Il Cubo di " + n + " e': " + c.getRisultato());
	
	kb.close();
	
	}
	
}
