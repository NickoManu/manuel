/*Esercizio 3
Definire una interfaccia 'operazione' e le sue classi derivate( sub. div, mul) in modo che da ciascuna sia possibile eseguire 
la corrispondente operazione aritmetica (di addizione, divisione, moltiplicazione) istanziando un oggetto di classe 'operazione' 
e due operandi. Realizzare anche, una classe astratta che implementi le funzionalità comuni come la stampa a video del risultato.
*/


import java.util.Scanner;
public class Es_I_3 {
	
	public static boolean isNumeric(String s) {
		if(s!=null) {
			
			try {
				Integer.parseInt(s);
				return true;
			}catch(Exception e) {
				return false;
			}
			
		}else
		{
			return false;
		}
	}
	
	public static void main(String [] args){
		
		Scanner kb=new Scanner (System.in);
		String s;
		boolean controllo=false;
		int a=0, b=0, scelta=0;
		
		do {
			System.out.println("Inserisci il primo numero ");
			s=kb.next();
			if(isNumeric(s)) {
				a=Integer.parseInt(s);
				controllo=true;
			}else {
				System.out.println("Errore: Inserire un numero");
				controllo=false;
			}
		}while(controllo==false);
		
		do {
			System.out.println("Inserisci il secondo numero ");
			s=kb.next();
			if(isNumeric(s)) {
				b=Integer.parseInt(s);
				controllo=true;
			}else {
				System.out.println("Errore: Inserire un numero");
				controllo=false;
			}
		}while(controllo==false);
		
		
		System.out.println("Quale operazione vuoi effettuare? ");
		System.out.println("1 - Addizione");
		System.out.println("2 - Moltiplicazione");
		System.out.println("3 - Divisione");
		do {
		System.out.println("Scelta: ");
		s=kb.next();
		if(isNumeric(s)) {
			if((Integer.parseInt(s))==1) {
				Sub su = new Sub(a,b);
				System.out.println("La somma e': ");
				su.stampaRisultato();
				controllo=true;
			}else {
				if((Integer.parseInt(s))==2) {
					Mul mu = new Mul(a,b);
					System.out.println("il prodotto e': ");
					mu.stampaRisultato();
					controllo=true;
				}else {
					if((Integer.parseInt(s))==3) {
						Div div = new Div(a,b);
						System.out.println("il quoziente e': ");
						div.stampaRisultato();
						controllo=true;
					}else {
						System.out.println("Errore: inserire il numero corrispondente all'operazione da effettuare");
						controllo=false;
					}
				}
			}
		}else {
			System.out.println("Errore: inserire il numero corrispondente all'operazione da effettuare");
			controllo=false;
		}
		}while(controllo==false);
		
	}

}
