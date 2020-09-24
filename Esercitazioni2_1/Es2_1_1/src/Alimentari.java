import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.text.DateFormat;
import java.text.ParseException;
import java.util.Locale;
public class Alimentari extends Prodotti{

	private Date data;
	
	public Alimentari() {
		super();
		data=null;
	}
	
	public Alimentari(String cb, String d, double p, Date data) {
		super(cb, d, p);
		this.data = data;
	}
	
	public Alimentari(String cb, String d, double p, String da) {
		super(cb, d, p);
		this.data = this.setsData(da);
	}
	
	public void setData(String d) {
		try{
	           DateFormat formatoData = DateFormat.getDateInstance(DateFormat.SHORT, Locale.ITALY);     
	           formatoData.setLenient(false);           
	           data = formatoData.parse(d);
	       } catch (ParseException e) {
	           System.out.println("Formato data non valido.");
	       }
	}
	
	public Date setsData(String d) {
		try{
	           DateFormat formatoData = DateFormat.getDateInstance(DateFormat.SHORT, Locale.ITALY);     
	           formatoData.setLenient(false);           
	           data = formatoData.parse(d);
	       } catch (ParseException e) {
	           System.out.println("Formato data non valido.");
	       }
		return data;
	}
	
	public String getData() {
		DateFormat formatoData = DateFormat.getDateInstance(DateFormat.LONG, Locale.ITALY);
		String s = formatoData.format(this.data);
		return s;
	}
	
	@Override
	public double applicaSconto() {
		double prezzoScontato=0;
		Date d = new Date("20/09/2020");
		int difInDays = (int) ((this.data.getTime() - d.getTime())/(1000*60*60*24));
		if(difInDays<10) {
			System.out.println("Sconto del 20 %");
			prezzoScontato=this.getPrezzo()/100;
			prezzoScontato= prezzoScontato * 20;
			prezzoScontato = this.getPrezzo() - prezzoScontato;
		}
		else
			prezzoScontato=this.getPrezzo();
		return prezzoScontato;
	}
	
}
