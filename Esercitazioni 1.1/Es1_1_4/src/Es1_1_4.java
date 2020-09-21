/*Data una matrice effettuare la trasposta della stessa.*/

import java.util.Scanner;

public class Es1_1_4 {

	public static void main(String [] args) {
		
		Scanner kb =  new Scanner (System.in);
		
		int r=0, c=0, n=0;
		System.out.println("inserire il numero di righe della matrice: ");
		r = kb.nextInt();
		System.out.println("inserire il numero di colonne della matrice: ");
		c = kb.nextInt();
		int[][] matrix = new int[r][c];
		int[][] matrixT = new int [c][r];
		
		System.out.println("Riempimento Matrice");
		for(int i=0; i<r; i++) {
			
			for(int j=0; j<c; j++) {
			
				System.out.println("Riga: " + i + " Colonna: " + j);
				System.out.println("inserisci numero: ");
				n=kb.nextInt();
				matrix[i][j]=n;				
			}
		}
		
		System.out.println("");
		System.out.println("La Matrice inserita e': ");
		for(int i=0; i<r; i++) {
			System.out.println("");
			for(int j=0; j<c; j++) {			
				System.out.print(matrix[i][j] + " ");
			}
		}
		
		for(int i=0; i<r; i++) {
			for(int j=0;j<c;j++) {
				matrixT[j][i]=matrix[i][j];
			}
		}
		
		
		System.out.println("");
		System.out.println("La Matrice trasposta e': ");
		for(int i=0; i<c; i++) {
			System.out.println("");
			for(int j=0; j<r; j++) {			
				System.out.print(matrixT[i][j] + " ");
			}
		}
		
		kb.close();
		
	}
	
}
