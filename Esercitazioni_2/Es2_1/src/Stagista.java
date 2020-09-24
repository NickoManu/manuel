
public class Stagista extends Person {
	
	private int numberOfPresence;
	private int idNumber;
	
	public Stagista() {
		super();
		numberOfPresence=0;
		idNumber=0;
	}
	
	public Stagista (String s, String n, String tc, String c, int nop, int id) {
		super(s,n, tc, c);
		numberOfPresence=nop;
		idNumber=id;
	}

	public int getNumberOfPresence() {
		return numberOfPresence;
	}

	public void setNumberOfPresence(int numberOfPresence) {
		this.numberOfPresence = numberOfPresence;
	}

	public int getIdNumber() {
		return idNumber;
	}

	public void setIdNumber(int idNumber) {
		this.idNumber = idNumber;
	}
	
	
	public String toString() {
		return super.toString() + " NumberOfPresence: " + this.getNumberOfPresence() + " IdNumber: " + this.getIdNumber();
	}
	
	
}
