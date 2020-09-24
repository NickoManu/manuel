/*Esercizio - 2.
Scrivere una classe Employee (dipendente) che estende la classe Person. 
Ogni dipendente ha un proprio anno di assunzione e un proprio stipendio. Si definiscano costruttori e vari metodi get e set opportuni. Si ridefinisca inoltre il metodo visualize() opportunamente. 
Si definisca inoltre un metodo gainsMore che prende come parametro un altro oggetto Employee e restituisce true se l’oggetto corrente ha uno stipendio maggiore di quello ricevuto come parametro, o false altrimenti. 
Per testare la classe, scrivere un programma TestEmployee che crea tre oggetti della classe Employee e li visualizza in ordine di stipendio (usando il nuovo metodo per confrontare gli stipendi). 
*/
import java.util.Scanner;

public class TestEmployee {
	
	
	//controllo che la stringa inserita è un numero intero
	public static boolean isNumeric(String s) {
		
		if(s != null) {
			try {
				Integer.parseInt(s);
				return true;
			}
			catch(Exception e) {
				return false;
			}
		}
		else
			return false;
		
	}
	
	
	public static void main (String [] args) {
		
		Scanner kb = new Scanner(System.in);
		Employee [] e= new Employee [3];
		String s;
		boolean control=false;
		
		System.out.println("Inserimento di 3 Dipendenti");
		for(int i=0; i<e.length; i++) {
			e[i]=new Employee();
			System.out.println("Inserimento Dipendente n°" + (i+1));			
			System.out.println("Nome: ");
			s = kb.next();
			e[i].setName(s);
			System.out.println("Cognome: ");
			s = kb.next();
			e[i].setSurname(s);
			do {
				System.out.println("CodiceFiscale: ");
				s = kb.next();
				if(s.length()==16 && isNumeric(s.substring(6, 8)) )
					control = true;
				else {
					control=false;
					System.out.println("Errore: il codice fiscale non e' corretto.");
					System.out.println("inserire il codice fiscale reale di 16 caratteri alfanumerici");
					}
			}while(control != true);
			e[i].setTaxCode(s);
			System.out.println("Citta': ");
			s = kb.next();
			e[i].setCity(s);
			do {
			System.out.println("Anno di Assunzione: ");
			s=kb.next();
			if(isNumeric(s)) {
				e[i].setAnnoAssunzione(Integer.parseInt(s));
				control=true;
			}
			else {
				System.out.println("Errore: L'anno di assunzione deve essere un numero intero");
				control=false;
			}
			}while(control != true);
			
			
			do {
				System.out.println("Stipendio: ");
				s=kb.next();
				if(isNumeric(s)) {
					e[i].setStipendio(Integer.parseInt(s));
					control=true;
				}
				else {
					System.out.println("Errore: Lo stipendio deve essere un numero intero");
					control=false;
				}
				}while(control != true);
		}
		
		
		//ordinamento crescente dei dipendenti in base allo stipendio 
		Employee supp=new Employee();
		for(int i=0; i<e.length-1;i++) {
			for(int j=i+1; j<e.length;j++) {
				if(e[i].gainsMore(e[j])) {
					supp=e[i];
					e[i]=e[j];
					e[j]=supp;
				}
			}
		}
		
		System.out.println("La lista dei dipendenti in ordine di stipendio: ");
		for(int i=0; i<e.length; i++){
			System.out.println(e[i].visualize());
		}
		
		kb.close();
	}

}
