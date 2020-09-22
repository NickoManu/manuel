import java.util.Scanner;
public class NumericQuestion extends Question{
	
	public NumericQuestion() {
		super();
	}
	
	public NumericQuestion(String d, String r, int p) {
		super(d,r,p);
	}
	
	public int ask() {
		System.out.println(this.getDomanda());
		Scanner kb=new Scanner (System.in);
		boolean controllo=false;
		String risposta;
		do {
			System.out.println("Inserisci il risultato numerico intero");
			System.out.print("Risposta: ");
			risposta=kb.next();
			System.out.println(" ");
			if(risposta!=null) {
				try {
					Integer.parseInt(risposta);
					controllo=true;
				}
				catch(Exception e) {
					System.out.println("Errore: inserire un valore numerico intero");
					controllo=false;
				}
			}else {
				System.out.println("Inserire un valore numerico intero");
				controllo=false;
			}
		}while(controllo==false);
		if(risposta.equals(this.getRispostaCorretta()))
			this.setPunteggio(this.getPunteggio());
		else
			this.setPunteggio(0);
		
		return this.getPunteggio();
	}

}
