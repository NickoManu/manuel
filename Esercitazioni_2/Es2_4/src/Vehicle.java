
public class Vehicle {

	private String targa;
	private String marca;
	private String modello;
	private boolean guasto;
	
	public Vehicle() {
		targa=null;
		marca=null;
		modello=null;
		guasto=false;
	}
	
	public Vehicle(String t, String m, String mo, boolean g) {
		targa=t;
		marca=m;
		modello=mo;
		guasto=g;
	}

	public String getTarga() {
		return targa;
	}

	public void setTarga(String targa) {
		this.targa = targa;
	}

	public String getMarca() {
		return marca;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}

	public String getModello() {
		return modello;
	}

	public void setModello(String modello) {
		this.modello = modello;
	}

	public boolean getGuasto() {
		return guasto;
	}

	public void setGuasto(boolean guasto) {
		this.guasto = guasto;
	}
	
	public String toString() {
		return "Targa: " + this.getTarga() + " Marca: " + this.getMarca() + " Modello: " + this.getModello() + " Guasto: " + this.getGuasto();
	}
	
}

