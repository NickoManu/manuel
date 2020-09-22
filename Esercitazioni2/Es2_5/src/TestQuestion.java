/*Esercizio - 5.
Scrivere la classe Question i cui oggetti rappresentano domande di esami orali. Ogni quesito si compone di una domanda, 
di una risposta corretta e di un punteggio, e mette a disposizione un metodo ask() che stampa la domanda, legge la risposta 
dell’utente e restituisce il punteggio conseguito (0 se la risposta dell’utente `e sbagliata). 
Scrivere la classe QuestionYesNo che estende la classe Question in modo da rappresentare domande a cui possa essere risposto 
solo si o no. Sovrascrivere il metodo ask() in modo da garantire che l’utente risponda si o no (prima che venga restituito il 
punteggio conseguito). 
Scrivere la classe NumericQuestion che estende la classe Question in modo da rappresentare domande a cui possa essere risposto 
solo con un valore intero. Sovrascrivere il metodo ask() in modo da garantire che l’utente risponda con un valore intero 
(prima che venga restituito il punteggio conseguito). 
Scrivere la classe MultipleQuestion che estende la classe NumericQuestion in modo da rappresentare domande che offrono un certo 
numero di opzioni (prefissato) e alle quali possa essere risposto solo con un valore intero positivo minore o uguale al numero di
opzioni disponibili. 
Sovrascrivere il metodo ask() in modo da garantire che l’utente risponda con un valore consentito (prima che venga restituito il 
punteggio conseguito). 
Scrivere il programma TestQuestion che riempie un array con quesiti di diversa natura e poi simula un’interrogazione calcolando il 
punteggio totale ottenuto. A scelta, l’interrogazione può essere fatta estraendo in modo casuale tre quesiti dall’array. 
Per l’estrazione casuale usare il metodo nextInt(int n) della classe Random (importare java.util.Random). 
*/
import java.util.Scanner;
import java.util.Random;
public class TestQuestion {
	
	public static void main(String [] args) {
		
		Scanner kb = new Scanner(System.in);
		int r=0, punteggio=0, punteggioTot=0;
		
		//definizione quesiti
		QuestionYesNo qyn1 = new QuestionYesNo("1+1 fa 3?","no",1);
		QuestionYesNo qyn2 = new QuestionYesNo("Il vesuvio e' a Napoli?","si",1);
		QuestionYesNo qyn3 = new QuestionYesNo("Phil Collin e' inglese?","si",1);
		QuestionYesNo qyn4 = new QuestionYesNo("Il protagonista di Top Gun e' Maverick?","si",1);
		QuestionYesNo qyn5 = new QuestionYesNo("Another Day in Paradise e' di Rod Stewart?","no",1);
		QuestionYesNo qyn6 = new QuestionYesNo("Bohemian Rhapsody è dei Pink Floyd?","no",1);
		QuestionYesNo qyn7 = new QuestionYesNo("Poison e' di Alice Cooper?","si",1);
		NumericQuestion nq1 = new NumericQuestion("Quanto fa 4/2 ?", "2", 1);
		NumericQuestion nq2 = new NumericQuestion("Quanto fa 2X2 ?", "4", 1);
		NumericQuestion nq3 = new NumericQuestion("Quanto fa 2^3 ?", "8", 1);
		NumericQuestion nq4 = new NumericQuestion("Quanto fa 40+2 ?", "42", 1);
		NumericQuestion nq5 = new NumericQuestion("Quanto fa 600/2", "300", 1);
		MultipleQuestion mq1 = new MultipleQuestion("Quanto fa 7X8 ?","56",1,78,48,56);
		MultipleQuestion mq2 = new MultipleQuestion("Quanto fa 9X3 ?","27",1,27,93,12);
		MultipleQuestion mq3 = new MultipleQuestion("Quanto fa 6X7 ?","42",1,43,67,42);
		MultipleQuestion mq4 = new MultipleQuestion("La risposta a tutto e' ?","42",1,43,67,42);
		
		Question [] q = {qyn1,qyn2,qyn3,qyn4,qyn5,qyn6,qyn7,nq1,nq2,nq3,nq4,nq5,mq1,mq2,mq3,mq4};
		
		Random rand = new Random ();
		
		//interrogazione
		System.out.println("Interrogazione");
		for(int i=0;i<3;i++) {
			System.out.println("Domanda n° " + (i+1));
			r=rand.nextInt(q.length-1);
			punteggio = q[r].ask();
			System.out.println("punteggio: " + punteggio);
			punteggioTot=punteggioTot+punteggio;
		}
		
		System.out.println("Il tuo punteggio totale e': " + punteggioTot);
		
		kb.close();
	}

}
