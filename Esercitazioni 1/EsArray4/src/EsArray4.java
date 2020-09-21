/* Scrivere un programma / metodo che date due sequenze di stringhe, ciascuna di 5 elementi, 
 * stampi il messaggio "OK" se almeno una stringa della prima sequenza compare anche nella seconda, 
 * altrimenti sarà stampato il messaggio "KO". Qualora vengano trovate due stringhe uguali i confronti tra le sequenze 
 * devono essere interrotti.
 */


public class EsArray4 {
	
	public static void main (String [] args) {
		
		String[] s1 = {"ciao" , " mare" , "casa" , "giardino" , "fiori"};
		String[] s2 = {"sole" , "estate", "casa" , "parco" , "ciaof" };
		int n=0;
		
		for(int i = 0; i < s1.length; i++) {
			for(int j = 0; j < s2.length; j++) {
				if(s1[i].equals(s2[j])) {
					n = 1;
					break;
				}
			}
		}
		
		if(n==1)
			System.out.println("OK");
		else
			System.out.println("KO");
		
	}
	
}
