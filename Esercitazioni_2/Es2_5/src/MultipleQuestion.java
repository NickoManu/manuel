import java.util.Scanner;

//suppongo che il numero di opzioni è 3
public class MultipleQuestion extends NumericQuestion{
	
	private int op1;
	private int op2;
	private int op3;
	
	public MultipleQuestion() {
		super();
		this.op1=0;
		this.op2=0;
		this.op3=0;
	}
	
	public MultipleQuestion(String d, String rc, int p, int o1, int o2, int o3) {
		super(d, rc, p);
		this.op1=o1;
		this.op2=o2;
		this.op3=o3;
	}

	public int getOp1() {
		return op1;
	}

	public void setOp1(int op1) {
		this.op1 = op1;
	}

	public int getOp2() {
		return op2;
	}

	public void setOp2(int op2) {
		this.op2 = op2;
	}

	public int getOp3() {
		return op3;
	}

	public void setOp3(int op3) {
		this.op3 = op3;
	}
	
	@Override
	public int ask() {
		System.out.println(this.getDomanda());
		System.out.println("Opzione 1: " + this.getOp1());
		System.out.println("Opzione 2: " + this.getOp2());
		System.out.println("Opzione 3: " + this.getOp3());
		Scanner kb=new Scanner (System.in);
		boolean controllo=false;
		String risposta;
		int r=0;
		do {
			System.out.println("Inserisci il risultato numerico intero");
			System.out.print("Risposta: ");
			risposta=kb.next();
			System.out.println(" ");
			if(risposta!=null) {
				try {
					Integer.parseInt(risposta);					
					r=Integer.parseInt(risposta);
					if(r==this.getOp1() || r==this.getOp2() || r==this.getOp3()) {
						controllo=true;
					}else {
						System.out.println("Devi inserire una delle opzioni disponibili");
						controllo=false;
					}					
				}
				catch(Exception e) {
					System.out.println("Errore: inserire un valore numerico intero presente tra le opzioni");
					controllo=false;
				}
			}else {
				System.out.println("Inserire un valore numerico intero");
				controllo=false;
			}
		}while(controllo==false);
		if(risposta.equals(this.getRispostaCorretta()))
			this.setPunteggio(this.getPunteggio());
		else
			this.setPunteggio(0);
		
		return this.getPunteggio();
	}

}
