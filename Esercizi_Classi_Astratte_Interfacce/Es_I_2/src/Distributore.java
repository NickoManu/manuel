
public class Distributore implements Comparable{
	
	private String citta;
	private String proprietario;
	private int capacita;
	private double benzinaAttuale;
	
	public Distributore() {
		citta=null;
		proprietario=null;
		capacita=0;
		benzinaAttuale=0;
	}
	
	public Distributore(String citta, String proprietario, int capacita, double benzinaAttuale) {
		this.citta=citta;
		this.proprietario=proprietario;
		this.capacita=capacita;
		this.benzinaAttuale=benzinaAttuale;
	}

	public String getCitta() {
		return citta;
	}

	public void setCitta(String citta) {
		this.citta = citta;
	}

	public String getProprietario() {
		return proprietario;
	}

	public void setProprietario(String proprietario) {
		this.proprietario = proprietario;
	}

	public int getCapacita() {
		return capacita;
	}

	public void setCapacita(int capacita) {
		this.capacita = capacita;
	}

	public double getBenzinaAttuale() {
		return benzinaAttuale;
	}

	public void setBenzinaAttuale(double benzinaAttuale) {
		this.benzinaAttuale = benzinaAttuale;
	}
	
	public String toString() {
		return "Citta: "+ this.getCitta() + "Proprietario: " + this.getProprietario() 
		+ "Capacita: " + this.getCapacita() + "benzinaAttuale: " + this.getBenzinaAttuale();
	}
	
	public double erogazione(double litri) {
		double prezzo=1.5;
		if(this.getBenzinaAttuale()>=litri) {
			this.setBenzinaAttuale((this.getBenzinaAttuale())-litri);
			System.out.println("Il conto e': " + (prezzo*litri));
			return prezzo*litri;
			
		}else
		{
			System.out.println("Non c'e abbastanza benzina da erogare");
			return 0;
		}
	}
	
	
	//il compare ritorna 0 se i distributori hanno la stessa capacita, 1 se l'attuale ha una capacità maggiore di quello con
	//cui viene confrontato, -1 altrimenti
	public int compare(Distributore d) {
		if(this.getCapacita() > d.getCapacita())
			return 1;
		else
		{
			if(this.getCapacita() < d.getCapacita())
				return -1;
			else
				return 0;
		}
	}

}
