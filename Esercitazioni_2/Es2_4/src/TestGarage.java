/*Esercizio - 4.
Scrivere una classe Garage che prevede solo un metodo repair() che utilizza veicoli (come definiti nell’esercizio precedente). 
Tale metodo prende un veicolo come parametro, ne cambia (se necessario) il valore della variabile booleana che descrive lo stato 
di guasto e restituisce come risultato il prezzo dell’intervento. Il prezzo deve variare a seconda che il veicolo fosse guasto o meno, 
e a seconda della tipologia di veicolo. 
Per testare le classi, scrivere un programma TestGarage che crea un certo numero di veicoli e un oggetto di tipo Garage, e usa il metodo
 repair() varie volte su oggetti diversi (guasti o meno) stampando i prezzi ottenuti.
*/

import java.util.Scanner;

public class TestGarage {
	
	public static boolean isNumber(String s) {
		if(s!=null) {
			try {
				Integer.parseInt(s);
				return true;
			}catch(Exception e) {
				return false;
			}
		}else
			return false;
	}
	
	public static void main(String [] args) {
		
		Scanner kb = new Scanner(System.in);
		
		int scelta=0,cilindrata=0, m=10;
		boolean controllo=false, guasto=false;
		String targa,marca,modello,tipologia,s;
		
		do {
			System.out.println("Quanti veicoli vuoi inserire? - puoi inserire al max 10 veicoli");
			s=kb.next();
			if(isNumber(s)) {
				m=Integer.parseInt(s);
				if(m>0 && m<=10)
					controllo=true;
				else {
					System.out.println("Errore: puoi inserire da 1 a 10 veicoli");
					controllo=false;
				}
			}else
			{
				System.out.println("Errore: il valore deve essere un numero intero");
				controllo=false;
			}
		}while(controllo==false);
		
		Vehicle [] v= new Vehicle[m];
		
		for(int i=0;i<v.length;i++) {
			do {
				System.out.println("che tipo di veicolo vuoi inserire?");
				System.out.println("1 - Car");
				System.out.println("2 - Motocycle");
				s=kb.next();
				if(isNumber(s)) {
					scelta=Integer.parseInt(s);
					if(scelta>0 && scelta<=2)
						controllo=true;
					else
					{
						System.out.println("Errore: scelta non disponibile");
						controllo=false;
					}
				}else{
					controllo=false;
					System.out.println("Errore: scelta errata, inserire scelta corretta");
				}
			}while(controllo==false);
			System.out.println("Targa: ");
			targa=kb.next();
			System.out.println("Marca: ");
			marca=kb.next();
			System.out.println("Modello: ");
			modello=kb.next();
			do {
			System.out.println("Guasto? - inserire true o false ");
			s=kb.next();
			if(s.equalsIgnoreCase("true")) {
				guasto=true;
				controllo=true;
			}
			else {
				if(s.equalsIgnoreCase("false")) {
					guasto=false;
					controllo=true;
				}
				else {
					System.out.println("Errore: inserire true o false");
					controllo=false;
				}
			}
			}while(controllo==false);
			switch(scelta) {
			case 1: 
				System.out.println("Tipologia: ");
				tipologia=kb.next();
				v[i] = new Car(targa,marca,modello,guasto,tipologia);	
				break;
			case 2:
				do {
				System.out.println("Cilindrata: ");
				s=kb.next();
				if(isNumber(s)) {
					controllo=true;
					cilindrata=Integer.parseInt(s);
				}else {
					System.out.println("Errore: La cilindrata deve essere un numero intero");
					controllo=false;
				}
				}while(controllo==false);
				v[i] = new Motocycle(targa,marca,modello,guasto,cilindrata);
				break;
				default: 
					System.out.println("scelta non consentita");
			}
		}
		
		Garage g=new Garage();
		//applico il metodo repair di Garage su tutti i veicoli
		for(int i=0; i<v.length;i++) {
			System.out.println("VEICOLO N° :" + i);
			System.out.println("Marca: " + v[i].getMarca());
			System.out.println("Modello: " + v[i].getModello());
			System.out.println("Targa: " + v[i].getTarga());
			System.out.println("Guasto: " + v[i].getGuasto());
			System.out.println("Costo riparazione veicolo: " + g.repair(v[i]));
		}
		
		kb.close();
		
	}

}
