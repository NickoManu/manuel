
public class NonAlimentari extends Prodotti{

	private String materiale;
	
	public NonAlimentari() {
		super();
		materiale=null;
	}
	
	public NonAlimentari(String cb, String d, double p, String m){
		super(cb,d,p);
		materiale=m;
	}

	public String getMateriale() {
		return materiale;
	}

	public void setMateriale(String materiale) {
		this.materiale = materiale;
	}
	
	@Override
	public double applicaSconto() {
		double differenza=0, prezzoScontato=0;
		int sconto=10;
		if(this.materiale.equalsIgnoreCase("plastica") || 
				this.materiale.equalsIgnoreCase("vetro") || 
				this.materiale.equalsIgnoreCase("carta")) {
		differenza=this.getPrezzo()/100;
		differenza=differenza*sconto;
		prezzoScontato=this.getPrezzo()-differenza;
		}
		else {
			prezzoScontato=this.getPrezzo();
		}
		System.out.println("il prezzo scontato e': " + prezzoScontato);
		return prezzoScontato;
	}
	
}
