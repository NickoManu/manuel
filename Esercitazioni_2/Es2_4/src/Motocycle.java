
public class Motocycle extends Vehicle{

	private int cilindrata;
	
	public Motocycle() {
		super();
		this.cilindrata=0;
	}
	
	public Motocycle(String t, String m, String mo, boolean g, int c) {
		super(t,m,mo,g);
		this.cilindrata=c;		
	}

	public int getCilindrata() {
		return cilindrata;
	}

	public void setCilindrata(int cilindrata) {
		this.cilindrata = cilindrata;
	}
	
	
}
