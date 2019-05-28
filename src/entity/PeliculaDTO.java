package entity;

public class PeliculaDTO {
	private int id;
	private String nombre;
	private float anolanzamiento;
	private float anosecuencia;
	private String sinopsis;
	private String clasificacion;
	
	public PeliculaDTO() {
		
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id=id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public float getAnolanzamiento() {
		return anolanzamiento;
	}

	public void setAnolanzamiento(float anolanzamiento) {
		this.anolanzamiento = anolanzamiento;
	}

	public float getAnosecuencia() {
		return anosecuencia;
	}

	public void setAnosecuencia(float anosecuencia) {
		this.anosecuencia = anosecuencia;
	}

	public String getSinopsis() {
		return sinopsis;
	}

	public void setSinopsis(String sinopsis) {
		this.sinopsis = sinopsis;
	}

	public String getClasificacion() {
		return clasificacion;
	}

	public void setClasificacion(String clasificacion) {
		this.clasificacion = clasificacion;
	}
}
