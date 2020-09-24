/*ESERCIZIO 1

Il gestore di un negozio associa a tutti i suoi Prodotti un codice a barre univoco, una descrizione sintetica del prodotto e 
il suo prezzo unitario. Realizzare una classe Prodotti con le opportune variabili d'istanza e metodi get.

Aggiungere alla classe Prodotti un metodo applicaSconto che modifica il prezzo del prodotto diminuendolo del 5%.

Aggiungere alla classe Prodotti un'implementazione specifica dei metodi ereditati dalla classe Object.

Il gestore del negozio vuole fare una distinzione tra i prodotti Alimentari e quelli Non Alimentari . Ai prodotti Alimentari
viene infatti associata una data di scadenza (si veda la classe Data), mentre a quelli Non Alimentari il materiale principale di cui sono fatti. 
Realizzare le sottoclassi Alimentari e NonAlimentari estendendo opportunamente la classe Prodotti.

Modificare le due sottoclassi dell'esercizio specializzando il metodo applicaSconto in modo che nel caso dei prodotti Alimentari
 venga applicato uno sconto del 20% se la data di scadenza è a meno di 10 giorni dalla data attuale (si usi il metodo getDifference della classe Data), 
 mentre nel caso dei prodotti Non Alimentari venga applicato uno sconto del 10% se il prodotto è composto da un materiale riciclabile (carta, vetro o plastica).

Realizzare una classe ListaSpesa che chieda all'utente di inserire i prodotti acquistati e calcoli il totale della spesa applicando gli opportuni
sconti se il cliente ha la tessera fedeltà.
*/


import java.util.Scanner;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.text.DateFormat;
import java.text.ParseException;
import java.util.Locale;
public class ListaSpesa {
	
	public static boolean isNumber(String s) {
		if(s!=null) {
			try {
				Integer.parseInt(s);
				return true;
			}catch(Exception e) {
				return false;
			}
		}else {
			System.out.println("Inserire valore");
			return false;
		}
	}

	public static void main(String [] args) {
		
		Scanner kb = new Scanner(System.in);
		int scelta=0, prodotto=0;
		double conto=0;
		boolean cartaFedelta=false, controllo=false;
		String s;
		Date d;
		
		
			
		//controllo carta fedeltà
		do {
			System.out.println("Hai la carta Fedelta' ? ");
			System.out.println("rispondere si o no");
			s=kb.next();
			if(s.equalsIgnoreCase("si")) {
				cartaFedelta=true;
				controllo=true;
			}else {
				if(s.equalsIgnoreCase("no")) {
					cartaFedelta=false;
					controllo=true;
				}
				else {
					System.out.println("Errore: puoi inserire solo si o no");
					controllo=false;
				}
			}
		}while(controllo == false);
		
		
		Alimentari a1 = new Alimentari("PRSCCRD", "Prosciutto Crudo", 10.5, "23/9/2020");
		Alimentari a2 = new Alimentari("PRSCCT", "Prosciutto Cotto", 10.7, "22/9/2020");
		Alimentari a3 = new Alimentari("MSSCL", "Mais in scatola", 10.5, "20/9/2020");
		NonAlimentari na1 = new NonAlimentari("BTTGLVTR", "Bottiglia di vetro", 1, "vetro");
		NonAlimentari na2 = new NonAlimentari("RSMCRT", "Risma Carta", 2.5, "carta");
		NonAlimentari na3 = new NonAlimentari("BSTNLGN", "Bastone di legno", 1.5, "legno");
		
			
		Prodotti [] p = {a1,a2,a3,na1,na2,na3};
		
		//inserimento prodotti da parte del cliente
		do {
			System.out.println("1 - Inserisci Prodotto");
			System.out.println("0 - Termina");
			
			//controllo che la scelta sia corretta
			do {
				s=kb.next();
				if(isNumber(s)) {
					scelta=Integer.parseInt(s);
					controllo=true;
				}else {
					System.out.println("Errore: inserire uno dei valori disponibili");
					controllo=false;
				}
				
			}while(controllo==false);
			
			if(scelta==1) {
				
			//stampo la lista dei prodotti disponibili	
			System.out.println("lista prodotti disponibili: ");
			for(int i=0; i<p.length; i++) {
				System.out.println("Prodotto n°: " + i + " Nome: " + p[i].getDescrizione() + " Prezzo: " + p[i].getPrezzo());			
			}
			
			//richiedo all'utente di inserire il numero corrispondente al prodotto
				
				do {
					System.out.println("inserire il numero del prodotto da 0 a " + (p.length-1));
					s=kb.next();
					if(isNumber(s)) {
						prodotto=Integer.parseInt(s);
						if(prodotto>=0 && prodotto<=(p.length-1))
							controllo=true;
						else {
							System.out.println("Errore: scegliere uno dei prodotti dalla lista");
							controllo=false;
						}
						
					}else {
						System.out.println("Errore: inserire una delle scelte disponibili");
						controllo=false;
					}
					
			}while(controllo==false);		
		
			//verifica sconto applicabile
			if(cartaFedelta)
				conto = conto + p[prodotto].applicaSconto();
			else
				conto= conto + p[prodotto].getPrezzo();			
			
		}else
		{
			if(scelta==0)
				System.out.println("il conto totale e': " + conto);
			else {
				System.out.println("Errore");
			}
		}
			
		}while(scelta!=0);
		
		kb.close();
	}
	
}
