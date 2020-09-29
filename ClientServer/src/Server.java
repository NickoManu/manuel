import java.net.*;
import java.io.*;

//stampa le linee di testo ricevute dal client
public class Server {
	public static void main (String [] args) {
		try {
			ServerSocket acceptSocket = new ServerSocket(5200);
			while(true) {
				//attesa richiesta di connessione
				Socket clientSock = acceptSocket.accept();
				InputStream s = clientSock.getInputStream();
				BufferedReader input = new BufferedReader(new InputStreamReader(s));
				String line;
				while((line = input.readLine()) != null)
					System.out.println(line);
				input.close();
				s.close();
				clientSock.close();
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
}
