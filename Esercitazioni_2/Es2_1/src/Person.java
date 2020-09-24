public class Person {

	private String surname;
	private String name;
	private String taxCode;
	private String city;
	
	public Person () {
		surname=null;
		name=null;
		taxCode=null;
		city=null;
	}
	
	public Person (String s, String n, String tc, String c) {
		surname=s;
		name=n;
		taxCode=tc;
		city=c;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTaxCode() {
		return taxCode;
	}

	public void setTaxCode(String taxCode) {
		this.taxCode = taxCode;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}
	
	public String toString() {
		return "Nome: "+ this.getName() + " Cognome: " + this.getSurname() + " CodiceFiscale: " + this.getTaxCode() + " Citta': " + this.getCity();
	}
		
	public int bornYear () {
		int by=0;
		String age;
		if(taxCode != null) {		
			age = taxCode.substring(6, 8);
			by=Integer.parseInt(age);
			if(by>=0 && by <= 20)
				by=by+2000;
			else
				by=by+1900;
		}
		else {
			by=0;
			System.out.println("il codice fiscale non e' presente");
		}
		return by;
	}
	
}
