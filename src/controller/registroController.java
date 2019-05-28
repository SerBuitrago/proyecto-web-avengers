package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.HeroeDAO;
import dao.ParticipacionDAO;
import dao.PeliculaDAO;
import entity.HeroeDTO;
import entity.ParticipacionDTO;
import entity.PeliculaDTO;

/**
 * Servlet implementation class registroController
 */
@WebServlet(name = "registro", urlPatterns = { "/registro" })
public class registroController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public registroController() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String accion = request.getParameter("accion");
		switch (accion) {
		case "tablaS":
			int numero = Integer.parseInt(request.getParameter("tablaN"));
			if (numero == 0 || numero >3) {
				RequestDispatcher rdT = request.getRequestDispatcher("index.jsp");
				rdT.forward(request, response);
			} else {
				RequestDispatcher rdT = request.getRequestDispatcher("tablas.jsp");
				HttpSession inicio = request.getSession(true);
				inicio.setAttribute("tablaV", numero);
				rdT.forward(request, response);
			}
			break;
		case "seleccion":
			RequestDispatcher rdT = request.getRequestDispatcher("mostrar.jsp");
			HttpSession inicio = request.getSession(true);
			inicio.setAttribute("id", Integer.parseInt(request.getParameter("id")));
			inicio.setAttribute("result", Integer.parseInt(request.getParameter("result")));
			rdT.forward(request, response);
			break;
		case "registroFS":
			
			int id=Integer.parseInt(request.getParameter("r"));
				RequestDispatcher rdR = request.getRequestDispatcher("formulario.jsp");
				HttpSession inicioS = request.getSession(true);
				inicioS.removeAttribute("error");
				inicioS.removeAttribute("mensaje");
				inicioS.setAttribute("formm", id);
				rdR.forward(request, response);
			break;
		default:
			break;
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String accion = request.getParameter("accion");
		HttpSession inicio = request.getSession(true);
		PeliculaDAO dao = new PeliculaDAO();
		PeliculaDTO dto = new PeliculaDTO();
		HeroeDAO daoH = new HeroeDAO();
		HeroeDTO dtoH = new HeroeDTO();
		boolean resultado = false;

		switch (accion) {
		case "registroPelicula":
			String nombre = request.getParameter("nombreP");
			float anoLa = Float.parseFloat(request.getParameter("anoLP"));
			float anoSa = Float.parseFloat(request.getParameter("anoSP"));
			String clasificacion = request.getParameter("clasificacionP");
			String sinopsis = request.getParameter("sinopsisP");

			dto.setNombre(nombre);
			dto.setAnolanzamiento(anoLa);
			dto.setAnosecuencia(anoSa);
			dto.setClasificacion(clasificacion);
			dto.setSinopsis(sinopsis);

			RequestDispatcher rd = request.getRequestDispatcher("formulario.jsp");

			resultado = dao.SavePelicula(dto);
			inicio.setAttribute("formm", 2);
			if (resultado) {
				inicio.removeAttribute("error");
				inicio.setAttribute("mensaje", "Pelicula Registrada Correctamente");
			} else {
				inicio.setAttribute("error", "Error al registrar Pelicula");
				inicio.removeAttribute("mensaje");
			}
			rd.forward(request, response);
			break;
		case "registroHeroe":
			String nombres = request.getParameter("nombreH");
			String heroe = request.getParameter("heroeH");
			String fechanacimiento = request.getParameter("anoNH");
			String fechaapericion = request.getParameter("anoAH");
			String genero = request.getParameter("generoH");
			String estado = request.getParameter("estadoH");
			String descripcion = request.getParameter("descripcionH");
			String arma = request.getParameter("armaH");

			dtoH.setNombre(nombres);
			dtoH.setHeroe(heroe);
			dtoH.setFechanacimiento(fechanacimiento);
			dtoH.setFechaaparicion(fechaapericion);
			dtoH.setGenero(genero);
			dtoH.setEstado(estado);
			dtoH.setDescripcion(descripcion);
			dtoH.setArma(arma);

			resultado = daoH.SaveHeroe(dtoH);
			RequestDispatcher rh = request.getRequestDispatcher("formulario.jsp");
			inicio.setAttribute("formm", 1);
			if (resultado) {
				inicio.removeAttribute("error");
				inicio.setAttribute("mensaje", "Heroe Registrado Correctamente");
			} else {
				inicio.setAttribute("error", "Error al registrar Heroe");
				inicio.removeAttribute("mensaje");
			}
			rh.forward(request, response);
			break;
		case "actualizarP":
			String nombrep = request.getParameter("nombrePA");
			float anoLap = Float.parseFloat(request.getParameter("anoLPA"));
			float anoSap = Float.parseFloat(request.getParameter("anoPPA"));
			String clasificacionp = request.getParameter("clasificacionAP");
			String sinopsisp = request.getParameter("sinopsisAP");
			String user = request.getParameter("user");
			dto.setNombre(nombrep);
			dto.setAnolanzamiento(anoLap);
			dto.setAnosecuencia(anoSap);
			dto.setClasificacion(clasificacionp);
			dto.setSinopsis(sinopsisp);
			dao.ModificarPelicula(user, dto);
			RequestDispatcher rad = request.getRequestDispatcher("tablas.jsp");
			inicio.setAttribute("tablaV", 2);
			rad.forward(request, response);
			break;
		case "actualizarH":
			String nombresh = request.getParameter("nombreHA");
			String heroeh = request.getParameter("heroeHA");
			String fechanacimientoh = request.getParameter("fechaNHA");
			String fechaapericionh = request.getParameter("fechaAHA");
			String generoh = request.getParameter("generoHA");
			String estadoh = request.getParameter("estadoHA");
			String descripcionh = request.getParameter("descripcionHA");
			String armah = request.getParameter("armaHA");

			dtoH.setNombre(nombresh);
			dtoH.setHeroe(heroeh);
			dtoH.setFechanacimiento(fechanacimientoh);
			dtoH.setFechaaparicion(fechaapericionh);
			dtoH.setGenero(generoh);
			dtoH.setEstado(estadoh);
			dtoH.setDescripcion(descripcionh);
			dtoH.setArma(armah);

			int id = Integer.parseInt(request.getParameter("id"));

			daoH.ModificarHeroe(id, dtoH);
			RequestDispatcher rah = request.getRequestDispatcher("tablas.jsp");
			inicio.setAttribute("tablaV", 1);
			rah.forward(request, response);

			break;
		case "registroParticipacion":
			int idH= Integer.parseInt(request.getParameter("idHeroe"));
			int idP=Integer.parseInt(request.getParameter("idP"));
			
		    ParticipacionDAO daoPP= new ParticipacionDAO();
		    ParticipacionDTO dtoPP= new ParticipacionDTO();
		    dtoPP.setIdH(idH);
		    dtoPP.setIdP(idP);
		    resultado =  daoPP.SaveParticipacion(dtoPP);
		    RequestDispatcher rhs = request.getRequestDispatcher("formulario.jsp");
			inicio.setAttribute("formm", 3);
		    if (resultado) {
				inicio.removeAttribute("error");
				inicio.setAttribute("mensaje", "Participacion Registrada Correctamente");
			} else {
				inicio.setAttribute("error", "Error al registrar Participacion");
				inicio.removeAttribute("mensaje");
			}
			rhs.forward(request, response);
			break;
		default:
			inicio.removeAttribute("mensaje");
			inicio.removeAttribute("error");
			break;

		}
	}

}
