
public class Car extends Vehicle{
	
	private String tipologia;
	
	public Car() {
		super();
		tipologia=null;
	}
	
	public Car(String t, String m, String mo, boolean g, String tipo) {
		super(t,m,mo,g);
		tipologia=tipo;
	}

	public String getTipologia() {
		return tipologia;
	}

	public void setTipologia(String tipologia) {
		this.tipologia = tipologia;
	}
	
	public String toString() {
		return super.toString() + " Tipologia: " + this.getTipologia();
	}

}
