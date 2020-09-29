import java.net.*;
import java.io.*;
//il client invia le linee di testo digitate dall'utente al server
public class Client {
	public static void main(String [] args) {
		try {
			Socket sock=new Socket("123.05.26.3", 5200);
			PrintWriter out= new PrintWriter(sock.getOutputStream(),true);
			InputStreamReader isr = new InputStreamReader(System.in);
			BufferedReader stdIn = new BufferedReader(isr);
			String userInput;
			while((userInput = stdIn.readLine()) != null)
				out.println(userInput);
			stdIn.close();
			out.close();
			sock.close();
			
		}catch(Exception e) {
		System.out.println(e.getMessage());
		}
	}
}
