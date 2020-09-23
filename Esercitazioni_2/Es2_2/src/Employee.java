
public class Employee extends Person{
	
	private int annoAssunzione;
	private int stipendio;
	
	public Employee () {
		super();
		this.annoAssunzione=0;
		this.stipendio=0;
	}
	
	public Employee (String s, String n, String tc, String c, int aa, int st) {
		super(s,n,tc,c);
		this.annoAssunzione=aa;
		this.stipendio=st;
	}

	public int getAnnoAssunzione() {
		return annoAssunzione;
	}

	public void setAnnoAssunzione(int annoAssunzione) {
		this.annoAssunzione = annoAssunzione;
	}

	public int getStipendio() {
		return stipendio;
	}

	public void setStipendio(int stipendio) {
		this.stipendio = stipendio;
	}
	
	
	
	public String visualize() {
		return "Nome: " + getName() + " Cognome: " + getSurname() + " Codice Fiscale: " + getTaxCode() + " Citta: " + getCity() +
				" Anno Assunzione: " + getAnnoAssunzione() + " Stipendio: " + getStipendio();
	}
	
	
	public boolean gainsMore(Employee e) {
		if(this.getStipendio() > e.getStipendio())
			return true;
		else
			return false;
	}
	

}
