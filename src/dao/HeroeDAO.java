package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;
import entity.HeroeDTO;
import entity.PeliculaDTO;
import util.Conexion;

public class HeroeDAO {
	
	public List<HeroeDTO> heroes() {
		Conexion c = new Conexion();
		List<HeroeDTO> list = new ArrayList<>();
		ResultSet rs = null;
		String com = "select * from heroe";
		PreparedStatement ps = null;
		try {
			ps = c.getConexion().prepareStatement(com);
			rs = ps.executeQuery();
			while (rs.next()) {
				HeroeDTO e = new HeroeDTO();
				e.setId(rs.getInt(1));
				e.setNombre(rs.getString(2));
				e.setHeroe(rs.getString(3));
				e.setFechanacimiento(rs.getString(4));
				e.setFechaaparicion(rs.getString(5));
				e.setGenero(rs.getString(6));
				e.setEstado(rs.getString(7));
				e.setDescripcion(rs.getString(8));
				e.setArma(rs.getString(9));
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
	
	public HeroeDTO cargarHeroe(int id) {
		Conexion c = new Conexion();
		HeroeDTO e = new HeroeDTO();
		ResultSet rs = null;
		String com = "select * from heroe where id=" + id;
		PreparedStatement ps = null;
		try {
			ps = c.getConexion().prepareStatement(com);
			rs = ps.executeQuery();
			while (rs.next()) {
				e.setId(rs.getInt(1));
				e.setNombre(rs.getString(2));
				e.setHeroe(rs.getString(3));
				e.setFechanacimiento(rs.getString(4));
				e.setFechaaparicion(rs.getString(5));
				e.setGenero(rs.getString(6));
				e.setEstado(rs.getString(7));
				e.setDescripcion(rs.getString(8));
				e.setArma(rs.getString(9));
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
		return e;
	}
    
	public boolean delectParticipacion(int id) {
		Conexion c = new Conexion();
		PreparedStatement ps = null;
		String sql = "DELETE FROM participacion WHERE idheroe=" + id ;

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
	
	public boolean delectHeroe(int id) {
		Conexion c = new Conexion();
		PreparedStatement ps = null;
		String sql = "DELETE FROM heroe WHERE id=?";
        delectParticipacion(id);
		try {
			ps = c.getConexion().prepareStatement(sql);
			ps.setInt(1, id);
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
	
	public boolean SaveHeroe(HeroeDTO u) {
		Conexion c = new Conexion();
		PreparedStatement ps = null;
		String sql = "INSERT INTO heroe(nombre,heroe,fechanacimiento,fechaaparicion,genero,estado,descripcion,arma) VALUES (?,?,?,?,?,?,?,?)";
		try {
			ps = c.getConexion().prepareStatement(sql);
			ps.setString(1, u.getNombre());
			ps.setString(2, u.getHeroe());
			ps.setDate(3, Date.valueOf(u.getFechanacimiento()));
			ps.setDate(4,Date.valueOf(u.getFechaaparicion()));
			ps.setString(5, u.getGenero());
			ps.setString(6, u.getEstado());
			ps.setString(7, u.getDescripcion());
			ps.setString(8, u.getArma());
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
	
	public boolean ModificarHeroe(int id, HeroeDTO u) {
		Conexion c = new Conexion();
		PreparedStatement ps = null;
		String sql = "UPDATE heroe SET nombre=?, heroe=?, fechanacimiento=?, fechaaparicion=?,"
				+ "genero=?, estado=?, descripcion=?, arma=? WHERE id="+id;
		try {
			ps = c.getConexion().prepareStatement(sql);
			HeroeDTO tmp = cargarHeroe(id);
			ps.setString(1, (u.getNombre() != null) ? u.getNombre() : tmp.getNombre());
			ps.setString(2, (u.getHeroe() != null) ? u.getHeroe() : tmp.getHeroe());
			ps.setDate(3, (u.getFechanacimiento().length()>0) ? Date.valueOf(u.getFechanacimiento()) : Date.valueOf(tmp.getFechaaparicion()));
			ps.setDate(4, (u.getFechaaparicion().length()>0) ? Date.valueOf(u.getFechaaparicion()) : Date.valueOf(tmp.getFechaaparicion()));
			ps.setString(5, (u.getGenero() != null) ? u.getGenero() : tmp.getGenero());
			ps.setString(6, (u.getEstado() != null) ? u.getEstado() : tmp.getEstado());
			ps.setString(7, (u.getDescripcion() != null) ? u.getDescripcion() : tmp.getDescripcion());
			ps.setString(8, (u.getArma() != null) ? u.getArma() : tmp.getArma());
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
	
	public int conocerID(String nombre) {
		Conexion c = new Conexion();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT id FROM heroe WHERE nombre = ?";
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
}
