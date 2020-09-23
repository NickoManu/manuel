
public class Cubo {

	private int n;
	
	public Cubo() {
		this.n=0;
	}
	
	public Cubo(int n) {
		this.n=n;
	}

	public int getN() {
		return n;
	}

	public void setN(int n) {
		this.n = n;
	}
	
	public String toString() {
		return "Numero: " + this.getN();
	}
	
	public int getRisultato() {
		int ris = n * n;
		ris=ris * n;
		return ris;
	}
	
}
