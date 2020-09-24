
public class Filmato extends ElementoMultimediale implements Riproducibile, Luminosita{

	private int durata;
	private int volume;
	private int luminosita;
	
	public Filmato(String t, int d, int v, int l) {
		super(t);
		durata=d;
		volume=v;
		luminosita=l;
	}
	
	public int getDurata() {
		return durata;
	}
	public void setDurata(int durata) {
		this.durata = durata;
	}
	public int getVolume() {
		return volume;
	}
	public void setVolume(int volume) {
		this.volume = volume;
	}
	public int getLuminosita() {
		return luminosita;
	}
	public void setLuminosita(int luminosita) {
		this.luminosita = luminosita;
	}
	
	public String toString() {
		return super.toString() + " Durata: " + this.getDurata() + " Volume: " + this.getVolume() + " Luminosita': " + this.getLuminosita(); 
	}
	
	//suppongo che la luminosità sia un valore intero compreso tra 0 e 100
	//i metodi brighter e darker rispettivamente aumentano e diminuiscono il
	//valore della luminosità di 1;
	public void brighter() {
		if(this.getLuminosita()<100)
			this.setLuminosita((this.getLuminosita())+1);
		else
			System.out.println("La luminosita' è al massimo");
		System.out.println("La luminosita' e': " + this.getLuminosita());
	}
	
	public void darker() {
		if(this.getLuminosita()>0)
			this.setLuminosita((this.getLuminosita())-1);
		else
			System.out.println("La luminosita' è al minimo");
		System.out.println("La luminosita' e': " + this.getLuminosita());
	}
	
	
	//suppongo che il volume sia un valore compreso tra 0 e 100
	//i metodi louder e weaker rispettivamente aumentano e diminuiscono il
	//valore del volume di 1;
	public void weaker() {
		if(this.getVolume()>0)
			this.setVolume((this.getVolume())-1);
		else
			System.out.println("Il volume e' al minimo");
		System.out.println("Il volume attuale e': " + this.getVolume());
	}
	
	public void louder() {
		if(this.getVolume()<100)
			this.setVolume((this.getVolume())+1);
		else
			System.out.println("Il volume e' al massimo");
		System.out.println("Il volume attuale e': " + this.getVolume());
	}
	
	public void play() {
		for(int i=0; i<this.getDurata(); i++) {
			System.out.print(this.getTitolo());
		}
		for(int i=0; i<this.getVolume(); i++) {
			System.out.print("!");
		}
		for(int i=0; i<this.getLuminosita(); i++) {
			System.out.print("*");
		}
		System.out.println(" ");
	}
}
