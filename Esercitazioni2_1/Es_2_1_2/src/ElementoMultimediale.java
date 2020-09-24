
public class ElementoMultimediale {

	private String titolo;
	
	public ElementoMultimediale(String t){
		titolo=t;
	}

	public String getTitolo() {
		return titolo;
	}

	public void setTitolo(String titolo) {
		this.titolo = titolo;
	}
	
	public String toString() {
		return "Titolo: " + this.getTitolo();
	}
	
	public void show() {}	
	public void play() {}	
	public void brighter() {}
	public void darker(){}
	public void louder() {}
	public void weaker() {}
	
}
