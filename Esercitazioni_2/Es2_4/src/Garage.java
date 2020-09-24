//NB lo scopo del meccanico e' quello di farti pagare sempre quindi che il veicolo sia guasto o meno tu paghi qualcosa sempre
public class Garage {

	public double repair(Vehicle v) {
		double prezzo=0;
		String classe = v.getClass().toString();
		
		//imposto dei prezzi di base a seconda del tipo di veicolo
		if(classe.equals("class Car")) {
			prezzo = prezzo + 50;
		}else
		{
			if(classe.equals("class Motocycle"))
				prezzo = prezzo + 30;
			else
				System.out.println("il veicolo non e' ne un auto ne una moto");
		}
		
		if(v.getGuasto()) {
			v.setGuasto(false);
			prezzo = prezzo + 100;
		}else
			prezzo=prezzo+20;
		
		return prezzo;
	}
	
}
