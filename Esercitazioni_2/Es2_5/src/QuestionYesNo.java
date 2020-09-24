import java.util.Scanner;
public class QuestionYesNo extends Question{

	public QuestionYesNo() {
		super();
	}
	
	public QuestionYesNo(String d, String r, int p) {
		super(d,r,p);
	}
	
	@Override
	public int ask() {
		System.out.println(this.getDomanda());
		Scanner kb=new Scanner (System.in);
		boolean controllo=false;
		String risposta;
		do {
			System.out.println("Puoi rispondere solo si o no");
			System.out.println("Risposta: ");
			risposta=kb.next();
			if(risposta!=null) {
				if(risposta.equalsIgnoreCase("si") || risposta.equalsIgnoreCase("no"))
					controllo=true;
				else
				{
					System.out.println("Errore: puoi rispondere solo si o no");
					controllo=false;
				}
			}else {
				System.out.println("inserire risposta");
				controllo=false;
			}
		}while(controllo==false);
		if(risposta.equalsIgnoreCase(this.getRispostaCorretta()))
			this.setPunteggio(this.getPunteggio());
		else
			this.setPunteggio(0);
		
		return this.getPunteggio();
	}
}
