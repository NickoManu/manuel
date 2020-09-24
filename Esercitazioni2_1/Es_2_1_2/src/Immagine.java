
public class Immagine extends ElementoMultimediale implements Luminosita{
	
	private int luminosita;
	
	public Immagine(String t, int l) {
		super(t);
		luminosita=l;
	}	
	
	
	public int getLuminosita() {
		return luminosita;
	}


	public void setLuminosita(int luminosita) {
		this.luminosita = luminosita;
	}
	
	
	public String toString() {
		return super.toString() + " Luminosita: " + this.getLuminosita(); 
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
	
	public void show() {
		System.out.print(this.getTitolo());
		for(int i=0;i<this.getLuminosita();i++)
			System.out.print("*");
		System.out.println(" ");
	}
		

}
