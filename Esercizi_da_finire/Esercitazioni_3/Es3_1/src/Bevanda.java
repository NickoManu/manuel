
public class Bevanda {

	private String codice;
	private String nome;
	private double prezzo;
	
	
	public Bevanda() {
		codice=null;
		nome=null;
		prezzo=0;
	}
	
	public Bevanda (String c, String n , double p) {
		codice=c;
		nome=n;
		prezzo=p;
	}
	
	public String getCodice() {
		return codice;
	}
	public void setCodice(String codice) {
		this.codice = codice;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public double getPrezzo() {
		return prezzo;
	}	
	
	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}
	
	public String getName() {
		return this.getNome();
	}
	
	public String getName(String code) {
		return this.getNome();
	}
	
	public double getPrice() {
		return this.getPrezzo();
	}
	
	public String toString() {
		return "Codice: " + this.getCodice() + " Nome: " + this.getNome() + " Prezzo: " + this.getPrezzo();
	}
	
	public void aggiungiBevanda(String c, String b, double p) {
		this.setCodice(c);
		this.setNome(b);
		this.setPrezzo(p);
	}
	
}
