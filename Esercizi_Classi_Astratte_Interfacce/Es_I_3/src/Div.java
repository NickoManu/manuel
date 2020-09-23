
public class Div extends OperazioniComuni implements Operazione{

	private int numA;
	private int numB;

	public Div() {
		numA=0;
		numB=0;
	}
	
	public Div(int a, int b) {
		numA=a;
		numB=b;
	}
	
	
	public int getNumA() {
		return numA;
	}



	public void setNumA(int numA) {
		this.numA = numA;
	}



	public int getNumB() {
		return numB;
	}



	public void setNumB(int numB) {
		this.numB = numB;
	}



	public void stampaRisultato() {
		System.out.println((this.getNumA())/(this.getNumB()));
	}
	
}
