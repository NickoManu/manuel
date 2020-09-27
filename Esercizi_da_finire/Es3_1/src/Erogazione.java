import java.util.*;
public class Erogazione {
	
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
	
	public static double inserisciDouble() {
		Scanner k=new Scanner(System.in);
		String s;
		double n=0;
		boolean c=false;
		do {
			
			System.out.println("inserire valore double: ");
			s=k.next();
			try {
				Double.parseDouble(s);
				c=true;
			}catch(Exception e) {
				System.out.println("Errore: inserire un numero double");
				c=false;
			}
			
		}while(c==false);
		n=Double.parseDouble(s);
		return n;
	}

	public static void main(String [] args) {
		
		Scanner kb=new Scanner(System.in);
		
		ArrayList <Bevanda> bevande = new ArrayList <Bevanda>();
		ArrayList <Tessera> tessere = new ArrayList <Tessera>();
				
		//inizializzo le colonne del distributore
		Distributore d1= new Distributore();
		Distributore d2= new Distributore();
		Distributore d3= new Distributore();
		Distributore d4= new Distributore();
		
		//inizializzo 4 bevande predefinite da inserire nel distributore		
		Bevanda b1 = new Bevanda("B1", "Acqua", 0.20);
		Bevanda b2 = new Bevanda("B2", "Thè", 0.40);
		Bevanda b3 = new Bevanda("B3", "Succo d'Arancia", 0.60);
		Bevanda b4 = new Bevanda("B4", "Cola", 0.50);
		
		bevande.add(b1);
		bevande.add(b2);
		bevande.add(b3);
		bevande.add(b4);
		
		Distributore [] distributore =  {d1,d2,d3,d4};
		
		//riempio il distributore
		d1.setColonna(1);
		d1.setBevanda(b1);
		d1.setNumeroLattine(20);
		
		d2.setColonna(2);
		d2.setBevanda(b2);
		d2.setNumeroLattine(15);
		
		d3.setColonna(3);
		d3.setBevanda(b3);
		d3.setNumeroLattine(20);
		
		d4.setColonna(4);
		d4.setBevanda(b4);
		d4.setNumeroLattine(25);
		
		String s, codice, nome;
		int scelta=0,sceltaSottomenu=0, codiceT=0;
		double prezzo=0, credito=0;
		boolean controllo=false;
		
		do {//menu principale
			
			System.out.println("MENU");
			System.out.println("1 - Gestione Bevande");
			System.out.println("2 - Gestione Tessere");
			System.out.println("3 - Gestione Distributore");
			System.out.println("4 - Erogazione");
			System.out.println("5 - Help");
			System.out.println("0 - Termina");
			scelta=inserisciIntero();
			if(scelta>=0 && scelta<=5) {
				
				switch(scelta) {
				
					case 1:	do {
								System.out.println("GESTIONE BEVANDE");
								System.out.println("1 - Inserisci nuova bevanda");
								System.out.println("2 - Visualizza bevanda per Codice");
								System.out.println("3 - Visualizza bevanda per Prezzo");
								System.out.println("4 - Visualizza bevanda per Nome");
								System.out.println("5 - Visualizza tutte le bevande presenti");
								System.out.println("0 - Indietro");
								sceltaSottomenu=inserisciIntero();
								if(sceltaSottomenu>=0 && sceltaSottomenu<=5) {
									switch(sceltaSottomenu) {
										case 1:	System.out.println("Inserimento nuova bevanda");
													//inserimento del codice
												do {
													System.out.println("Inserisci codice bevanda: ");
													codice=kb.next();
													//controllo che il codice bevanda sia univoco;
													if(bevande.isEmpty())
														controllo=true;	
													else {
															Bevanda b = new Bevanda();
															for(int i=0; i<bevande.size(); i++) {
																b = bevande.get(i);
																if(b.getCodice().equalsIgnoreCase(codice))
																{
																	controllo=false;
																	break;
																}else
																	controllo=true;
															}
														}
													if(controllo)								
														System.out.println("Codice Accettabile");
													else
														System.out.println("Codice già Presente, inserire un altro codice");
											
												}while(controllo == false);
												System.out.println("Inserisci nome bevanda: ");
												nome=kb.next();
												do {
													System.out.println("Inserisci prezzo bevanda: ");
													prezzo=inserisciDouble();
													if(prezzo<0)
														System.out.println("Errore: Non puoi inserire un prezzo negativo");
												}while(prezzo<0);
												Bevanda b = new Bevanda(codice, nome, prezzo);
												//aggiungo la nuova bevanda all'arraylist
												bevande.add(b);
											break;
											
										case 2:	System.out.println("Visualizza benvanda per codice");												
												System.out.println("Inserisci codice bevanda: ");
												codice=kb.next();
												//controllo che il codice bevanda sia presente;
												if(bevande.isEmpty()) {
													System.out.println("La lista delle bevande e' vuota");
												}
												else{
														Bevanda be = new Bevanda();
														for(int i=0; i<bevande.size(); i++) {
															be = bevande.get(i);
															if(be.getCodice().equalsIgnoreCase(codice))
															{
																System.out.println("Nome: " + be.getName() + " Prezzo: " + be.getPrice());
																controllo=true;
																break;	
															}else
																controllo=false;
														}
												}
												
												if(controllo==false)
													System.out.println("BevandaNonValida");
												
										break;
										
										case 3:	System.out.println("Visualizza benvanda per Prezzo");												
												System.out.println("Inserisci prezzo bevanda: ");
												prezzo=inserisciDouble();												
												//controllo che la bevanda sia presente;
												if(bevande.isEmpty()) {
													System.out.println("La lista delle bevande e' vuota");
												}
												else{
													Bevanda be = new Bevanda();
													for(int i=0; i<bevande.size(); i++) {
														be = bevande.get(i);
														if(be.getPrezzo()==prezzo)
														{
															System.out.println("Nome: " + be.getName() + " Prezzo: " + be.getPrice());
															controllo=true;
															break;	
														}else
															controllo=false;
													}
												}
										
												if(controllo==false)
													System.out.println("BevandaNonValida");
										
										break;
										
										case 4:	System.out.println("Visualizza benvanda per Nome");												
												System.out.println("Inserisci nome bevanda: ");
												nome=kb.next();												
												//controllo che la bevanda sia presente;
												if(bevande.isEmpty()) {
													System.out.println("La lista delle bevande e' vuota");
												}
												else{
													Bevanda be = new Bevanda();
													for(int i=0; i<bevande.size(); i++) {
														be = bevande.get(i);
														if(be.getNome().equalsIgnoreCase(nome))
														{
															System.out.println("Nome: " + be.getName() + " Prezzo: " + be.getPrice());
															controllo=true;
															break;	
														}else
															controllo=false;
													}
												}
								
												if(controllo==false)
													System.out.println("BevandaNonValida");
								
										break;
										
										case 5: System.out.println("Le bevande presenti sono");
												if(bevande.isEmpty()) {
													System.out.println("La lista delle bevande e' vuota");
												}
												else{
													Bevanda be = new Bevanda();
													for(int i=0; i<bevande.size(); i++) {
														be = bevande.get(i);
														System.out.println("Nome: " + be.getName() + " Prezzo: " + be.getPrice());
														
													}
												}
										break;
											
										default:System.out.println("Menu Principale");
									}
								}else 
									System.out.println("Errore: inserire una delle scelte disponibili");
								
							}while(sceltaSottomenu!=0);
							break;
					
					case 2:	do {
								 System.out.println("GESTIONE TESSERE");
								 System.out.println("1 - Carica Tessera");
								 System.out.println("2 - Visualizza Credito");
								 System.out.println("3 - Inserisci Nuova Tessera");
								 System.out.println("0 - Indietro");
								 sceltaSottomenu=inserisciIntero();
								 
								 if(sceltaSottomenu>=0 && sceltaSottomenu<=3) {
									 switch(sceltaSottomenu) {
									 
									 case 1: System.out.println("Inserire codice tessera");
									 		 codiceT=inserisciIntero();									 		
									 		 controllo=false;
									 		 for(int i=0; i<tessere.size();i++) {									 			
									 			 if(tessere.get(i).getCodice()==codiceT) {
									 				 do {
									 				 System.out.println("Inserire l'importo da caricare");
									 				 credito=inserisciDouble();
									 				 if(credito<0)
									 					 System.out.println("Errore: Non puoi inserire un credito negativo");
									 				 }while(credito<0);
									 				 tessere.get(i).caricaTessera(credito);
									 				 controllo=true;
									 				 break;
									 			 }
									 			 else
									 				 controllo=false;
									 		 }
									 		 
									 		 if(controllo==false)
									 			 System.out.println("la tessera non e' presente");
										 	
										 break;
										 
									 case 2: System.out.println("Visualizzazione Credito");
									 		 System.out.println("Inserisci codice tessera:");
									 		 codiceT=inserisciIntero();									 		
									 		 controllo=false;
									 		 for(int i=0; i<tessere.size();i++) {									 			
									 			 if(tessere.get(i).getCodice()==codiceT) {
									 				 System.out.println("Il credito della tessera e': ");
									 				 tessere.get(i).leggiCredito(codiceT);
									 				 controllo=true;
									 				 break;
									 			 }
									 			 else
									 				 controllo=false;
									 		 }
									 		 
									 		 if(controllo==false)
									 			 System.out.println("la tessera non e' presente");
								 	
									 break;
									 
									 case 3: System.out.println("Inserimento Nuova Tessera");							 		 								 		
							 		 		 controllo=false;
							 		 		 //inserimento del codice
							 		 		 do {
							 		 			 System.out.println("Inserisci codice tessera: ");
							 		 			 codiceT=inserisciIntero();
							 		 			 //controllo che il codice tessera sia univoco;
							 		 			 if(tessere.isEmpty())
							 		 				 controllo=true;	
							 		 			 else {
							 		 				 for(int i=0; i<tessere.size(); i++) {
														if(tessere.get(i).getCodice()==codiceT)
														{
															controllo=false;
															break;
														}else
															controllo=true;
													}
												}
							 		 			 if(controllo)								
							 		 				 System.out.println("Codice Accettabile");
							 		 			 else
							 		 				 System.out.println("Codice già Presente, inserire un altro codice");
									
							 		 		 }while(controllo == false);
							 		 		 
							 		 		 do {
							 		 		 System.out.println("Inserire il credito della tessera: ");
							 		 		 credito=inserisciDouble();
							 		 		 	if(credito<0)
							 		 		 		System.out.println("Errore: non puoi inserire un credito negativo");
							 		 		 }while(credito<0);
							 		 		 Tessera te = new Tessera();
							 		 		 te.setCodice(codiceT);
							 		 		 te.setCredito(credito);
							 		 		 tessere.add(te);
							 		 		 System.out.println("Inserimento avvenuto con successo");
						 	
									break;
										 
									default: System.out.println("Menu Principale");
									 
									 }
								 }else
									 System.out.println("Errore: inserire una delle scelte disponibili");
								 
							}while(sceltaSottomenu!=0);//fine sottomenu gestione tessere
							break;
							
					case 3: do {//menu gestione distributore
							System.out.println("GESTIONE DISTRIBUTORE");
							System.out.println("1 - Aggiorna Colonna Distributore");
							System.out.println("2 - Visualizza Contenuto Distributore");
							System.out.println("3 - Visualizza Lattine Disponibili");
							System.out.println("0 - Indietro");
							sceltaSottomenu=inserisciIntero();
							if(sceltaSottomenu>=0 && sceltaSottomenu<=3) {
								switch(sceltaSottomenu) {
								case 1:	System.out.println("Aggiornamento colonna Distributore");										
										int colonna=0;
										do {
											System.out.println("Inserisci numero colonna (da 1 a 4)");
											colonna=inserisciIntero();
										if(colonna<1 || colonna>4)
											System.out.println("Errore: inserire colonna da 1 a 4");
										}while(colonna<1 || colonna>4);									
										
										System.out.println("Le bevande disponibili sono: ");
										if(bevande.isEmpty()) {
											System.out.println("La lista delle bevande e' vuota");
										}
										else{
											Bevanda be = new Bevanda();
											for(int i=0; i<bevande.size(); i++) {
												be = bevande.get(i);
												System.out.println("Codice: " + be.getCodice() +" Nome: " + be.getName() + " Prezzo: " + be.getPrice());
												
											}
										}										
										
										Bevanda b = new Bevanda();
										String codiceC="";
										System.out.println("Inserire il codice della bevanda che vuoi inserire nella colonna");
										System.out.println("se la bevanda che vorresti inserire non è presente inserisci un valore qualsiasi");
										codice=kb.next();										
										if(bevande.isEmpty()) {
											codiceC="nonpresente";											
										}
										else {												
												for(int i=0; i<bevande.size(); i++) {
														b = bevande.get(i);																												
														if((b.getCodice()).equalsIgnoreCase(codice)) {
															codiceC="presente";
															System.out.println("codice accettato");
															break;
														}
														else															
															codiceC="nonpresente";														
												}
											}
										if(codiceC.equals("nonpresente"))								
											System.out.println("La bevanda non è presente");
										else {
												System.out.println("Bevanda scelta: " + b.getNome());
												System.out.println("Quante lattine vuoi inserire?");
												int numeroLattine=0;
												do {
													System.out.println("Inserire il numero di lattine");
													numeroLattine=inserisciIntero();
													if(numeroLattine<=0)
														System.out.println("Errore: il numero di lattine deve essere un intero superiore a 0");
												}while(numeroLattine<=0);												
												distributore[colonna-1]=new Distributore(colonna, b, numeroLattine);
												System.out.println("Bevanda inserita: " + b.getNome());
											}
										break;
										
								case 2: System.out.println("Contenuto Distributore:");
										for(int i=0; i<distributore.length; i++) {
											System.out.println(distributore[i].toString());
										}
										break;
										
								case 3: System.out.println("Inserire il codice della bibita");									
										codice=kb.next();
										int somma=0;
										for(int i=0; i<distributore.length;i++) {
											if(distributore[i].getBevanda().getCodice().equalsIgnoreCase(codice)) {
												somma = somma + distributore[i].lattineDisponibili(codice);
											}
										}
										System.out.println("Il numero di lattine e': " + somma);
										break;
										
								default: System.out.println("Menu Principale");
								}
							}else
								System.out.println("Errore: inserire una delle scelte disponibili");
							
							}while(sceltaSottomenu!=0);//fine sottomenu gestione distributore
							break;
					
					case 4: System.out.println("EROGAZIONE");
							System.out.println("Le bevande disponibili sono:");
							for(int i=0; i<distributore.length;i++) {
								System.out.println(distributore[i].toString());
							}
							System.out.println("Inserire il codice della bibita che desideri");
							codice=kb.next();
							controllo=false;
							for(int i=0; i<distributore.length;i++) {
								if(distributore[i].getBevanda().getCodice().equalsIgnoreCase(codice)) {
									controllo=true;
									break;
								}else
									controllo=false;
							}
							if(controllo) {
								System.out.println("Inserire il codice della tua tessera: ");
								codiceT=inserisciIntero();
								controllo=false;
								Tessera te= new Tessera();
								for(int i=0; i<tessere.size(); i++) {
									te=tessere.get(i);
									if(te.getCodice()==codiceT) {
										controllo=true;
										credito=te.getCredito();
										break;
									}else
										controllo=false;
								}
								boolean controlloL=false;
								if(controllo) {
									controllo=false;
									for(int i=0; i<distributore.length; i++) {
										if(distributore[i].getBevanda().getCodice().equalsIgnoreCase(codice)) {
											if(distributore[i].getNumeroLattine()>0) {
												controlloL=true;
												if(distributore[i].getBevanda().getPrezzo()<=credito) {
													distributore[i].setNumeroLattine((distributore[i].getNumeroLattine())-1);
													te.setCredito((te.getCredito())-(distributore[i].getBevanda().getPrezzo()));
													System.out.println("Erogazione avvenuta con successo");
													controllo=true;
													break;
												}else {
													System.out.println("CreditoInsufficiente");
													controllo=false;
													break;
												}
											}else
												controlloL=false;											
										}
									}
									if(controlloL==false)
										System.out.println("BevandaEsaurita");
									
								}else
									System.out.println("la tessera non e' presente");
							}else
								System.out.println("Codice errato o  bevanda non presente");
							break;
					
					case 5: System.out.println("HELP");
							System.out.println("Come faccio a prendere una bibita?");
							System.out.println("Per poter prendere una bibita è necessario avere una tessera");
							System.out.println("se la tua tessera non è presente allora devi prima inserirla");
							System.out.println("Per inserire una nuova tessera vai nel menu gestione tessere e inserisci una nuova tessera");
							break;
					default: System.out.println("Arrivederci");
				
				}
				
			}else {
				System.out.println("Errore: Inserire una delle scelte disponibili");
			}
		}while(scelta!=0);//fine menu principale
		
		
		kb.close();
	}
	
}
