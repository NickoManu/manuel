
public class Tessera {

	private int codice;
	private double credito;
	
	public int getCodice() {
		return codice;
	}
	public void setCodice(int codice) {
		this.codice = codice;
	}
	public double getCredito() {
		return credito;
	}
	public void setCredito(double credito) {
		this.credito = credito;
	}
	
	public String toString() {
		return "Codice: " + this.getCodice() + " Credito: " + this.getCredito(); 
	}
	
	public void caricaTessera(double c) {
		this.setCredito((this.getCredito())+c);
	}
	
	public void leggiCredito(int c) {
		if(this.getCodice()==c) {
			System.out.println("il credito e': " + this.getCredito());
		}
		else
			System.out.println("TesseraNonValida");
	}
	
}
