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
		
		Distributore [] distributore =  {d1,d2,d3,d4};
		
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
			System.out.println("0 - Termina");
			scelta=inserisciIntero();
			if(scelta>=0 && scelta<=4) {
				
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
							
					case 3: System.out.println("GESTIONE DISTRIBUTORE");
							break;
					
					case 4: System.out.println("EROGAZIONE");
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
