package entity;

public class HeroeDTO {
	private int id;
	private String nombre;
	private String heroe;
	private String fechanacimiento;
	private String fechaaparicion;
	private String genero;
	private String estado;
	private String descripcion;
	private String arma;

	public HeroeDTO() {

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getHeroe() {
		return heroe;
	}

	public void setHeroe(String heroe) {
		this.heroe = heroe;
	}

	public String getFechanacimiento() {
		return fechanacimiento;
	}

	public void setFechanacimiento(String fechanacimiento) {
		this.fechanacimiento = fechanacimiento;
	}

	public String getFechaaparicion() {
		return fechaaparicion;
	}

	public void setFechaaparicion(String fechaaparicion) {
		this.fechaaparicion = fechaaparicion;
	}

	public String getGenero() {
		return genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getArma() {
		return arma;
	}

	public void setArma(String arma) {
		this.arma = arma;
	}

}
