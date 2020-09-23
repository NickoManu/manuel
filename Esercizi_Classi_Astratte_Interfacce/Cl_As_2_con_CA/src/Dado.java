
public class Dado extends Sorte{
	
	public int lancio() {
		int l= 1 + (int)(Math.random()*6);
		return l;
	}

}
