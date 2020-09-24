
public class RegistrazioneAudio extends ElementoMultimediale implements Riproducibile{
	
	private int durata;
	private int volume;
	
	public RegistrazioneAudio(String t, int d, int v) {
		super(t);
		durata=d;
		volume=v;
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
	
	public String toString() {
		return super.toString() + " Durata: " + this.getDurata() + " Volume: " + this.getVolume();
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
			System.out.println(" ");
		}

}
