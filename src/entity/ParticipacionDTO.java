package entity;

public class ParticipacionDTO {
	private int idH;
	private int idP;
	private String pelicula;
	private String Heroe;

	public int getIdH() {
		return idH;
	}

	public void setIdH(int idH) {
		this.idH = idH;
	}

	public int getIdP() {
		return idP;
	}

	public String getPelicula() {
		return pelicula;
	}

	public void setPelicula(String pelicula) {
		this.pelicula = pelicula;
	}

	public String getHeroe() {
		return Heroe;
	}

	public void setHeroe(String heroe) {
		Heroe = heroe;
	}

	public void setIdP(int idP) {
		this.idP = idP;
	}

}
