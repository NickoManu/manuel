
public class Prodotti {
	
	private String codiceABarre;
	private String descrizione;
	private double prezzo;
	
	public Prodotti() {
		this.codiceABarre=null;
		this.descrizione=null;
		this.prezzo=0;
	}
	
	public Prodotti(String cb, String d, double p) {
		this.codiceABarre=cb;
		this.descrizione=d;
		this.prezzo=p;
	}

	public String getCodiceABarre() {
		return codiceABarre;
	}

	public void setCodiceABarre(String codiceABarre) {
		this.codiceABarre = codiceABarre;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	public double getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}
	
	public double applicaSconto() {
		double differenza=0, prezzoScontato=0;
		int sconto=5;
		differenza=this.prezzo/100;
		differenza=differenza*sconto;
		prezzoScontato=this.prezzo-differenza;
		System.out.println("il nuovo prezzo e': " + prezzoScontato);
		return prezzoScontato;
	}

}
