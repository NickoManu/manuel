
public class Quadrato implements Operazione{
	
	private int n;
	
	public Quadrato() {
		this.n=0;
	}
	
	public Quadrato(int n) {
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
		return ris;
	}
		
}
