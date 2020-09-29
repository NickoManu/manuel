import java.net.*;
import java.io.*;
import java.util.Scanner;

public class DatagramSender {
	public static void main(String [] args) {
		System.out.println("Client");
		try {
			InetAddress receiverHost = InetAddress.getByName("localhost");
			int receiverPort = 2000;
			String message = "messaggio protocollo udp";			
			DatagramSocket mySocket = new DatagramSocket();			
			byte [] buffer = message.getBytes();
			DatagramPacket datagram = new
					DatagramPacket(buffer, buffer.length,receiverHost,receiverPort);
		//	mySocket.send(datagram);
			
			Scanner k=new Scanner (System.in);
			String m=null;
			do {
			System.out.println("Inserisci messaggio da inviare al server:");
			m = k.next();
			buffer = m.getBytes();
			datagram = new
					DatagramPacket(buffer, buffer.length,receiverHost,receiverPort);
			mySocket.send(datagram);
			}while(m.equals("end"));
			
			k.close();
			mySocket.close();			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
