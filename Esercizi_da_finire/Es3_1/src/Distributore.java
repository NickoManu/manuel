
public class Distributore {
	
	private int colonna;
	private Bevanda bevanda;
	private int numeroLattine;
	
	public Distributore() {
		colonna=0;
		bevanda=null;
		numeroLattine=0;
	}
	
	public Distributore(int c, Bevanda b,  int num) {
		colonna=c;
		bevanda=b;
		numeroLattine=num;		
	}
	
	public int getColonna() {
		return colonna;
	}
	public void setColonna(int colonna) {
		this.colonna = colonna;
	}
	public Bevanda getBevanda() {
		return bevanda;
	}
	public void setBevanda(Bevanda b) {
		this.bevanda = b;
	}
	public int getNumeroLattine() {
		return numeroLattine;
	}
	
	public void setNumeroLattine(int numeroLattine) {
		this.numeroLattine = numeroLattine;
	}
	
	public void aggiornaColonna(int n, Bevanda b, int num) {
		if(n>0 && n<=4) {
			this.setColonna(n);
			this.setBevanda(b);
			this.setNumeroLattine(num);
			System.out.println("Colonna Aggiornata");
		}else {
			System.out.println("colonna non esistente");
		}
	}
	
	public int lattineDisponibili(String codice) {
		return this.getNumeroLattine();
	}

}
