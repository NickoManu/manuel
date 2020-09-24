/*Esercizio - 1.

Creare una classe di nome Person con le variabili di istanza: surname, name, tax code e city di tipo stringa.

La classe deve contenere un costruttore di default che inizializzi le variabili di istanza con NULL; un costruttore parametrico; 
i metodi set e get ed un metodo chiamato bornYear che a partire dal codice fiscale ricavi e restituisca l'anno di nascita di una persona. 

Creare un'applicazione Java che istanzi un oggetto della classe Person e ne visualizzi in seguito nome, cognome ed anno di nascita.

Costruire una sottoclasse di Person, chiamata Stagista, che contiene 2 variabili di istanza entrambe di tipo intero: 

•	numberOfPresence, che registra il numero di ore di presenza
•	idNumber (numero identificativo). 

La sottoclasse deve contenere un costruttore parametrico ed i metodi set e get. 

Creare tre oggetti di tipo Stagista memorizzarli in un array e visualizzare lo Stagista più giovane.
*/

import java.util.Scanner;

public class Es2_1 {
	
	//con il metodo isNumeric verifico se la stringa s contiene un numero
	private static boolean isNumeric(String s) {
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
		Scanner kb=new Scanner (System.in);
		//istanzio oggetto della classe Person e ne visualizzo nome,cognome e anno di nascita
		Person p = new Person ("Rossi","Luca","RSSLCA97T06F205S","Milano");
		System.out.println("Nome: " + p.getName());
		System.out.println("Cognome: " + p.getSurname());
		System.out.println("Anno di nascita: " + p.bornYear());
		System.out.println(" ");
		String name, surname, tc, city, str;
		int st=0;
		boolean control=false;
		Stagista [] arrayS = new Stagista [3];		
		int j=0,age=0,aM=0;
	
		for(int i=0; i<arrayS.length; i++) {
			arrayS[i]=new Stagista();
			System.out.println("Inserimento stagista n°" + (i+1));			
			System.out.println("Nome: ");
			name = kb.next();			
			arrayS[i].setName(name);
			System.out.println("Cognome: ");
			surname = kb.next();
			arrayS[i].setSurname(surname);
			do {
				System.out.println("CodiceFiscale: ");
				tc = kb.next();
				if(tc.length()==16 && isNumeric(tc.substring(6, 8)) )
					control = true;
				else {
					control=false;
					System.out.println("il codice fiscale non e' corretto.");
					System.out.println("inserire il codice fiscale reale di 16 caratteri alfanumerici");
					}
			}while(control != true);
			arrayS[i].setTaxCode(tc);
			System.out.println("Citta': ");
			city = kb.next();
			arrayS[i].setCity(city);
			do {
			System.out.println("Numero ore di presenza: ");
			str=kb.next();
			if(isNumeric(str)) {
				arrayS[i].setNumberOfPresence(Integer.parseInt(str));
				control=true;
			}
			else {
				System.out.println("Le ore inserite devono essere un numero intero");
				control=false;
			}
			}while(control != true);
			
			
			do {
				System.out.println("Numero identificativo: ");
				str=kb.next();
				if(isNumeric(str)) {
					arrayS[i].setIdNumber(Integer.parseInt(str));
					control=true;
				}
				else {
					System.out.println("l'ID deve essere un numero intero");
					control=false;
				}
				}while(control != true);
		}
		
		j=1;
		aM=arrayS[0].bornYear();
		st=0;
		while(j<arrayS.length) {
			age=arrayS[j].bornYear();
			if(aM<age) {
				aM=age;
				st=j;
			}
			j++;
		}
		
		System.out.println("lo stagista più giovane e': ");
		System.out.println("Cognome: " + arrayS[st].getSurname());
		System.out.println("Nome: " + arrayS[st].getName());
		System.out.println("Anno: " + arrayS[st].bornYear());
		
		kb.close();
	}
	
}
