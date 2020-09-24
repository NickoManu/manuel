
public class Motocycle extends Vehicle{

	private int cilindrata;
	
	public Motocycle() {
		super();
		cilindrata=0;
	}
	
	public Motocycle(String t, String m, String mo, boolean g, int c) {
		super(t,m,mo,g);
		cilindrata=c;		
	}

	public int getCilindrata() {
		return cilindrata;
	}

	public void setCilindrata(int cilindrata) {
		this.cilindrata = cilindrata;
	}
	
	public String toString() {
		return super.toString() + " Cilindrata: " + this.getCilindrata();
	}
	
}
