import java.net.*;
import java.io.*;

public class DatagramReceiver {
	public static void main(String [] args) {
		
		System.out.println("server");
		int port=2000;
		final int MAX_LEN = 1500;
		try {
			DatagramSocket mySocket= new DatagramSocket(port);
			byte [] buffer = new byte[MAX_LEN];
			DatagramPacket datagram = new DatagramPacket(buffer, MAX_LEN);
			String message;
			
			do {
			mySocket.receive(datagram);
			message = new String(buffer);
			System.out.println("Ricezione: " + message.trim());
			}while(message.equals("end"));
			
			mySocket.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
