/*ESERCIZIO 2

Un Elemento Multimediale è una Immagine, un Filmato o una registrazione Audio identificato da un titolo (una stringa non vuota).

Un elemento è riproducibile se ha una durata (un valore positivo di tipo int) e un metodo play().
Una registrazione Audio è riproducibile e ha associato anche un volume (un valore positivo di tipo int) e i metodi weaker() e louder() per regolarlo. 

Se riprodotta, ripete per un numero di volte pari alla durata la stampa del titolo concatenato a una sequenza di punti esclamativi di lunghezza 
pari al volume (una stampa per riga).
Un Filmato è riproducibile e ha associato un volume regolabile analogo a quello delle registrazioni audio e anche una luminosità (un valore positivo 
di tipo int) e i metodi brighter() e darker() per regolarla. 
Se riprodotta, ripete per un numero di volte pari alla durata la stampa del titolo concatenato a una sequenza di punti esclamativi di lunghezza pari 
al volume e poi a una sequenza di asterischi di lunghezza pari alla luminosità (una stampa per riga).

Una Immagine non è riproducibile, ma ha una luminosità regolabile analoga a quella dei filmati e un metodo show() che stampa il titolo concatenato a 
una sequenza di asterischi di lunghezza pari alla luminosità.
Eseguire un oggetto multimediale significa invocarne il metodo show() se è un'immagine o il metodo play() se è riproducibile.


Organizzare opportunamente con classi astratte, interfacce e classi concrete il codice di un lettore multimediale che memorizza 5 elementi 
(creati con valori letti da tastiera) in un array e poi chiede ripetutamente all'utente quale oggetto eseguire 
(leggendo un intero da 1 a 5 oppure 0 per finire) e dopo ogni esecuzione fornisce la possibilità di regolarne eventuali parametri (volume / luminosità).
*/

import java.util.Scanner;

public class LettoreMultimediale {
	
	public static boolean isNumeric(String s) {
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
	
	public static int inserisciIntero() {
		Scanner k=new Scanner(System.in);
		String s;
		int n=0;
		boolean c=false;
		do {
			
			System.out.println("inserire valore intero: ");
			s=k.next();
			if(isNumeric(s)) {
				n=Integer.parseInt(s);
				c=true;
			}else {
				System.out.println("Errore: inserire un numero intero");
				c=false;
			}
		}while(c==false);
		return n;
	}

	public static void main(String [] args) {
		
		Scanner kb=new Scanner (System.in);
		
		String s;
		boolean controllo=false;
		int durata=0, volume=0, luminosita=0, scelta=0, sceltaOp=0;
		ElementoMultimediale [] em = new ElementoMultimediale[5];
		
		for(int i=0; i<5; i++) {
			
			do {
				System.out.println("Inserimento Elemento Multimediale n° " + i);
				System.out.println("Che tipo di elemento multimediale vuoi inserire? ");
				System.out.println("digitare il numero corrispondente ");
				System.out.println("1 - Immagine ");
				System.out.println("2 - Registrazione Audio");
				System.out.println("3 - Filmato");
				s=kb.next();
				if(isNumeric(s)) {
					scelta=Integer.parseInt(s);
						if(scelta>0 && scelta<=3)
							controllo=true;
						else {
							System.out.println("Errore: Inserire una delle scelte disponibili");
							controllo=false;
						}
				}else {
					System.out.println("Errore: Inserire una delle scelte disponibili");
					controllo=false;
				}
			}while(controllo==false);
			
			switch(scelta) {
			case 1 :						
					System.out.println("Inserire Titolo: ");
					s=kb.next();
					em[i]=new ElementoMultimediale(s);
					System.out.println("Inserire la luminosita' dell'immagine: ");
					luminosita=inserisciIntero();
					em[i] = new Immagine(s,luminosita);
					
					break;
					
			case 2:
					System.out.println("Inserire Titolo: ");
					s=kb.next();
					em[i]=new ElementoMultimediale(s);
					System.out.println("Inserire la durata della registrazione: ");
					durata=inserisciIntero();
					System.out.println("Inserire il volume della registrazione: ");
					volume=inserisciIntero();
					em[i] = new RegistrazioneAudio(s,durata,volume);
					break;
					
			case 3: 
					System.out.println("Inserire Titolo: ");
					s=kb.next();
					em[i]=new ElementoMultimediale(s);
					System.out.println("Inserire la durata del filmato: ");
					durata=inserisciIntero();
					System.out.println("Inserire il volume del filmato: ");
					volume=inserisciIntero();
					System.out.println("Inserire la luminosita' del filmato: ");
					luminosita=inserisciIntero();
					em[i] = new Filmato(s,durata,volume,luminosita);
					break;
					
			default: System.out.println("Scelta non disponibile");
					
			}
			
		}//fine for
		
		
		do {			
			System.out.println("Vuoi eseguire un elemento multimediale? ");
			System.out.println("Digitare un numero da 1 a 5 per il corrispondente Elemento Multimediale");
			System.out.println("Digita 0 per Terminare");
			System.out.println("Scelta: ");
			scelta=inserisciIntero();
			if(scelta<0 || scelta >5) 
				System.out.println("Scelta Errata");
			else
				if(scelta == 0) {
					System.out.println("Arrivederci");
				}else {
					String classe = em[scelta-1].getClass().toString();
					if(classe.equalsIgnoreCase("class Immagine")) {
						em[scelta-1].show();
						do {
							System.out.println("1 - Aumenta luminosità");
							System.out.println("2 - Diminuisci luminosità");
							System.out.println("0 - Esci");
							sceltaOp=inserisciIntero();
							if(sceltaOp<0 || sceltaOp>2)
							{
								System.out.println("Errore");
							}else {
								if(sceltaOp == 0)
									System.out.println("fine");
								else {
									switch(sceltaOp) {
									case 1: em[scelta-1].brighter();
											break;
									case 2: em[scelta-1].darker();
											break;
									}
								}
							}
						}while(sceltaOp!=0);
					}
					else {
						if(classe.equalsIgnoreCase("class RegistrazioneAudio")) {
							em[scelta-1].play();
							do {
								System.out.println("1 - Aumenta volume");
								System.out.println("2 - Diminuisci volume");
								System.out.println("0 - Esci");
								sceltaOp=inserisciIntero();
								if(sceltaOp<0 || sceltaOp>2)
								{
									System.out.println("Errore");
								}else {
									if(sceltaOp == 0)
										System.out.println("fine");
									else {
										switch(sceltaOp) {
										case 1: em[scelta-1].louder();
												break;
										case 2: em[scelta-1].weaker();
												break;
										}
									}
								}
							}while(sceltaOp!=0);
						}else {
							em[scelta-1].play();
							do {
								System.out.println("1 - Aumenta volume");
								System.out.println("2 - Diminuisci volume");
								System.out.println("3 - Aumenta luminosita");
								System.out.println("4 - Diminuisci luminosita");
								System.out.println("0 - Esci");
								sceltaOp=inserisciIntero();
								if(sceltaOp<0 || sceltaOp>4)
								{
									System.out.println("Errore");
								}else {
									if(sceltaOp == 0)
										System.out.println("fine");
									else {
										switch(sceltaOp) {
										case 1: em[scelta-1].louder();
												break;
										case 2: em[scelta-1].weaker();
												break;
										case 3: em[scelta-1].brighter();
												break;
										case 4: em[scelta-1].darker();
												break;
										}
									}
								}
							}while(sceltaOp!=0);
						}
					}
				}			
		}while(scelta!=0);
		
		kb.close();
	}
	
}
