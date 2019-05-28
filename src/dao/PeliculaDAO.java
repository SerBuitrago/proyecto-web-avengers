package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import entity.PeliculaDTO;
import util.Conexion;

public class PeliculaDAO {

	public boolean ModificarPelicula(String user, PeliculaDTO u) {
		Conexion c = new Conexion();
		PreparedStatement ps = null;
		int id = conocerID(user);
		String sql = "UPDATE pelicula SET nombre=?,anolanzamiento=?,anosecuencia=?,sinopsis=?,clasificacion=? WHERE id ="
				+ id;
		try {
			ps = c.getConexion().prepareStatement(sql);
			PeliculaDTO tmp = cargarPelicula(id);
			ps.setString(1, (u.getNombre() != null) ? u.getNombre() : tmp.getNombre());
			ps.setFloat(2, (u.getAnolanzamiento() != 0) ? u.getAnolanzamiento() : tmp.getAnolanzamiento());
			ps.setFloat(3, (u.getAnosecuencia() != 0) ? u.getAnosecuencia() : tmp.getAnosecuencia());
			ps.setString(4, (u.getSinopsis() != null) ? u.getSinopsis() : tmp.getSinopsis());
			ps.setString(5, (u.getClasificacion() != null) ? u.getClasificacion() : tmp.getClasificacion());
			ps.executeUpdate();
			return true;
		} catch (SQLException ex) {
			System.out.println(ex.getMessage());
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			try {
				ps.close();
				c.cerrarConexion();
			} catch (Exception ex) {
			}
		}
		return false;
	}

	public boolean delectPelicula(int id) {
		Conexion c = new Conexion();
		PreparedStatement ps = null;
		ParticipacionDAO daoP= new ParticipacionDAO();
		daoP.delectParticipacion(id);
		daoP.delectUbicacion(id);
		String sql = "DELETE FROM pelicula WHERE pelicula.id="+id;
		try {
			ps = c.getConexion().prepareStatement(sql);
			if (ps.executeUpdate() > 0) {
				return true;
			}
		} catch (SQLException ex) {
			System.out.println(ex.getMessage());
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			try {
				ps.close();
				c.cerrarConexion();
			} catch (Exception ex) {
			}
		}
		return false;
	}

	public int conocerID(String nombre) {
		Conexion c = new Conexion();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT id FROM pelicula WHERE nombre = ?";
		try {
			ps = c.getConexion().prepareStatement(sql);
			ps.setString(1, nombre);
			rs = ps.executeQuery();
			while (rs.next()) {
				return rs.getInt(1);
			}

		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			try {
				ps.close();
				rs.close();
				c.cerrarConexion();
			} catch (Exception ex) {
			}
		}
		return -1;
	}

	public PeliculaDTO cargarPelicula(int id) {
		Conexion c = new Conexion();
		PeliculaDTO p = new PeliculaDTO();
		ResultSet rs = null;
		String com = "select * from pelicula where id=" + id;
		PreparedStatement ps = null;
		try {
			ps = c.getConexion().prepareStatement(com);
			rs = ps.executeQuery();
			while (rs.next()) {
				p.setId(rs.getInt(1));
				p.setNombre(rs.getString(2));
				p.setAnolanzamiento(rs.getFloat(3));
				p.setAnosecuencia(rs.getFloat(4));
				p.setSinopsis(rs.getString(5));
				p.setClasificacion(rs.getString(6));
			}
		} catch (SQLException ex) {
			System.out.println(ex.getMessage());
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			try {
				ps.close();
				rs.close();
				c.cerrarConexion();
			} catch (Exception ex) {
			}
		}
		return p;
	}

	public boolean SavePelicula(PeliculaDTO u) {
		Conexion c = new Conexion();
		PreparedStatement ps = null;
		String sql = "INSERT INTO pelicula(nombre,anolanzamiento,anosecuencia,sinopsis,clasificacion) VALUES (?,?,?,?,?)";
		try {
			ps = c.getConexion().prepareStatement(sql);
			ps.setString(1, u.getNombre());
			ps.setFloat(2, u.getAnolanzamiento());
			ps.setFloat(3, u.getAnosecuencia());
			ps.setString(4, u.getSinopsis());
			ps.setString(5, u.getClasificacion());
			ps.executeUpdate();
			return true;
		} catch (SQLException ex) {
			System.out.println("A " + ex.getMessage());
		} catch (Exception ex) {
			System.out.println("B " + ex.getMessage());
		} finally {
			try {
				ps.close();
				c.cerrarConexion();
			} catch (Exception ex) {
			}
		}
		return false;
	}

	public List<PeliculaDTO> peliculas() {
		Conexion c = new Conexion();
		List<PeliculaDTO> list = new ArrayList<>();
		ResultSet rs = null;
		String com = "select * from pelicula";
		PreparedStatement ps = null;
		try {
			ps = c.getConexion().prepareStatement(com);
			rs = ps.executeQuery();
			while (rs.next()) {
				PeliculaDTO e = new PeliculaDTO();
				e.setId(rs.getInt(1));
				e.setNombre(rs.getString(2));
				e.setAnolanzamiento(rs.getFloat(3));
				e.setAnosecuencia(rs.getFloat(4));
				e.setSinopsis(rs.getString(5));
				e.setClasificacion(rs.getString(6));
				list.add(e);
			}
		} catch (SQLException ex) {
			System.out.println(ex.getMessage());
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			try {
				ps.close();
				rs.close();
				c.cerrarConexion();
			} catch (Exception ex) {
			}
		}
		return list;

	}
}
