/*Esercizio - 3.
 Scrivere una classe Vehicle (veicolo) che prevede una targa, una marca e un modello. 
La classe prevede anche una variabile booleana che descrive se il veicolo è guasto. 
Aggiungere un costruttore opportuno e vari metodi get e set opportuni. 
Scrivere la classi Car e Motocycle che estendono la classe Vehicle. La classe Car prevede una stringa che ne descrive la tipologia ("utilitaria","station wagon", "SUV",....) mentre la classe Motocycle prevede un numero che ne descrive la cilindrata (50, 125, ....). 
Per testare le classi, scrivere un programma TestVehicles che crea un array inizializzato con veicoli delle varie tipologie. Alcuni dei veicoli inseriti nell’array dovranno diventare guasti. Il programma deve stampare la lista delle targhe dei veicoli guasti. 
*/

import java.util.Scanner;
public class TestVehicles {
	
	
	//verifico se una stringa passata come input è un numero
	public static boolean isNumber(String s) {
		if(s != null) {
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
		int scelta=0,cilindrata=0, m=10,pos=0;
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
					else {
						System.out.println("Errore: inserire o 1 o 2");
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
		
		
		
		//l'utente può scegliere quale veicolo rendere guasto o no
		do {
			do {
				System.out.println("Vuoi cambiare lo stato ''Guasto'' di un veicolo? ");
				System.out.println("1 - si");
				System.out.println("2 - no");
				s=kb.next();
				if(isNumber(s)) {
					scelta=Integer.parseInt(s);
					if(scelta==1) {
						do {
						System.out.println("Inserire la posizione del veicolo da modificare");
						s=kb.next();
						if(isNumber(s)) {
							pos=Integer.parseInt(s);
							if(pos>=0 && pos<m) {
								System.out.println("lo stato del veicolo alla posizione " + pos + " e': " + v[pos].getGuasto());
								if(v[pos].getGuasto())
									v[pos].setGuasto(false);
								else
									v[pos].setGuasto(true);
								System.out.println("Il nuovo stato del veicolo alla posizione " + pos + " e': " + v[pos].getGuasto());
								controllo=true;
							}else {
								System.out.println("Errore: inserire un numero intero da 0 a " + (m-1));
								controllo=false;
							}
						}else
						{
							System.out.println("Errore: inserire un numero intero da 0 a " + (m-1));
							controllo=false;
						}
						}while(controllo==false);
					}else {
						if(scelta==2) {
							System.out.println("Fine");
							controllo=true;
						}
						else {
							System.out.println("Errore: Scelta non accettabile");
							controllo=false;
						}
					}
				}else
				{
					System.out.println("Errore: la scelta deve essere 1 o 2");
					controllo=false;
				}
			}while(controllo==false);
		}while(scelta!=2);
		
		
		//stampa la lista dei veicoli guasti
		System.out.println("Lista dei veicoli guasti: ");
		for(int i=0;i<v.length;i++) {
			if(v[i].getGuasto()) {
				System.out.println("Targa: " + v[i].getTarga());
				System.out.println("Marca: " + v[i].getMarca());
				System.out.println("Modello: " + v[i].getModello());
			}
		}
		
		kb.close();
	}
	
}
