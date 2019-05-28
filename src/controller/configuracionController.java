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
import dao.PeliculaDAO;

/**
 * Servlet implementation class configuracionController
 */
@WebServlet(name = "configuracion", urlPatterns = { "/configuracion" })
public class configuracionController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public configuracionController() {
		super();
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String accion = request.getParameter("accion");
		PeliculaDAO dao = new PeliculaDAO();
		HeroeDAO daoH = new HeroeDAO();
		int id = Integer.parseInt(request.getParameter("id"));
		HttpSession inicio = request.getSession(true);

		switch (accion) {
		case "eliminarP":
			dao.delectPelicula(id);
			RequestDispatcher rd = request.getRequestDispatcher("tablas.jsp");
			inicio.setAttribute("tablaV", 2);
			rd.forward(request, response);

			break;
		case "eliminarH":
			daoH.delectHeroe(id);
			RequestDispatcher rdH = request.getRequestDispatcher("tablas.jsp");
			inicio.setAttribute("tablaV", 1);
			rdH.forward(request, response);
			break;
		default:
			break;
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);	
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

}
