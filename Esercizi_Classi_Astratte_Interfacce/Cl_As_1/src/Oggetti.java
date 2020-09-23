
public abstract class Oggetti {
	
	private double area;
	private double altezza;
	
	public Oggetti() {
		area=0;
		altezza=0;
	}
	
	public Oggetti(double area, double altezza) {
		this.area=area;
		this.altezza=altezza;		
	}
	
	public double getArea() {
		return area;
	}
	public void setArea(double area) {
		this.area = area;
	}
	public double getAltezza() {
		return altezza;
	}
	public void setAltezza(double altezza) {
		this.altezza = altezza;
	}
	
	public double volume() {
		return area*altezza;
	}
	
	public void getVolume() {
		System.out.println("Volume: " + this.volume());
	}
	

}
