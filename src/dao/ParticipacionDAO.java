package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import entity.ParticipacionDTO;
import util.Conexion;

public class ParticipacionDAO {

	public boolean SaveParticipacion(ParticipacionDTO u) {
		Conexion c = new Conexion();
		PreparedStatement ps = null;
		String sql = "INSERT INTO participacion(idheroe,idpelicula) VALUES (?,?)";
		try {
			ps = c.getConexion().prepareStatement(sql);
			ps.setInt(1, u.getIdH());
			ps.setInt(2, u.getIdP());
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

	public List<ParticipacionDTO> participacion() {
		Conexion c = new Conexion();
		List<ParticipacionDTO> list = new ArrayList<>();
		ResultSet rs = null;
		String com = "select * from participacion";
		PreparedStatement ps = null;
		try {
			ps = c.getConexion().prepareStatement(com);
			rs = ps.executeQuery();
			while (rs.next()) {
				ParticipacionDTO e = new ParticipacionDTO();
				e.setIdH(rs.getInt(1));
				e.setIdP(rs.getInt(2));
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

	public String pelicula(int id) {
		String pelicula = null;
		Conexion c = new Conexion();
		ResultSet rs = null;
		String com = "select nombre from pelicula where id=" + id;
		PreparedStatement ps = null;
		try {
			ps = c.getConexion().prepareStatement(com);
			rs = ps.executeQuery();
			while (rs.next()) {
				pelicula = rs.getString(1);
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
		return pelicula;
	}

	public String heroe(int id) {
		String pelicula = null;
		Conexion c = new Conexion();
		ResultSet rs = null;
		String com = "select heroe from heroe where id=" + id;
		PreparedStatement ps = null;
		try {
			ps = c.getConexion().prepareStatement(com);
			rs = ps.executeQuery();
			while (rs.next()) {
				pelicula = rs.getString(1);
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
		return pelicula;
	}
	

	public boolean delectUbicacion(int id) {
		Conexion c = new Conexion();
		PreparedStatement ps = null;
		String sql = "DELETE FROM ubicacion WHERE idpelicula=" + id ;

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
	
	public boolean delectParticipacion(int id) {
		Conexion c = new Conexion();
		PreparedStatement ps = null;
		String sql = "DELETE FROM participacion WHERE idpelicula=" + id ;

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
}
