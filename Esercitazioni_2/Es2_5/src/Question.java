import java.util.Scanner;
public class Question {
	
	private String domanda;
	private String rispostaCorretta;
	private int punteggio;
	
	public Question() {
		domanda=null;
		rispostaCorretta=null;
		punteggio=0;
	}
	
	public Question(String s, String c, int p) {
		domanda=s;
		rispostaCorretta=c;
		punteggio=p;
	}

	public String getDomanda() {
		return domanda;
	}

	public void setDomanda(String domanda) {
		this.domanda = domanda;
	}

	public String getRispostaCorretta() {
		return rispostaCorretta;
	}

	public void setRispostaCorretta(String rispostaCorretta) {
		this.rispostaCorretta = rispostaCorretta;
	}

	public int getPunteggio() {
		return punteggio;
	}

	public void setPunteggio(int punteggio) {
		this.punteggio = punteggio;
	}
	
	public int ask() {
		System.out.println(this.getDomanda());
		Scanner kb=new Scanner (System.in);
		System.out.println("Inserisci la Risposta: ");
		String risposta=kb.next();
		if(risposta.equalsIgnoreCase(this.rispostaCorretta))
			this.punteggio=this.punteggio;
		else
			this.punteggio=0;
		kb.close();
		return this.punteggio;
	}
}
