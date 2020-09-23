//Esercizio 2 senza Classe Astratta
public class Cl_As_2_no_CA {

	public static void main(String [] args) {
		Dado d= new Dado();
		System.out.println("Lancio dado: " + d.lancio());
		Moneta m= new Moneta();
		System.out.println("Lancio Moneta: " + m.lancio());
	}
	
}
