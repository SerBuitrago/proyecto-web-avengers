<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Mostrar</title>
</head>
<body>
	<c:if test="${result==1}">
	<style>	
	   body{
	    background-image: url("https://emtstatic.com/2019/03/5bba8fcd64d8b.jpeg");
	   }
	</style>
		<jsp:useBean id="p" class="dao.PeliculaDAO" scope="page"></jsp:useBean>
		<c:set var="e" scope="session" value="${p.cargarPelicula(id)}" />

		<c:if test="${e!=null }">
			<div class="container">
				<div class="row my-5">
					<section
						class="col-12 col-md-6 mx-auto my-5  border border-light text-center"
						style="background: white;">
						<h1>PELICULA</h1>
						<a href="index.jsp" class="btn btn-info btn-block p-2">Volver</a>
						<div class="form-row mb-4">
							<div class="col m-4">
								<label> Id Pelicula: </label>
							</div>
							<div class="col m-4">${e.getId()}</div>
						</div>
						<div class="form-row mb-4">
							<div class="col m-4">
								<label> Nombre Pelicula: </label>
							</div>
							<div class="col m-4">${e.getNombre()}</div>
						</div>
						<div class="form-row mb-4">
							<div class="col m-4">
								<label> Año Lanzamiento: </label>
							</div>
							<div class="col m-4">${e.getAnolanzamiento()}</div>
						</div>
						<div class="form-row mb-4">
							<div class="col m-4">
								<label> Año Secuencia: </label>
							</div>
							<div class="col m-4">${e.getAnosecuencia()}</div>
						</div>
						<div class="form-row mb-4">
							<div class="col m-4">
								<label> Sinopsis: </label>
							</div>
							<div class="col m-4">${e.getSinopsis()}</div>
						</div>
						<div class="form-row mb-4">
							<div class="col m-4">
								<label> Clasificacion: </label>
							</div>
							<div class="col m-4">${e.getClasificacion()}</div>
						</div>
					</section>
				</div>
			</div>
		</c:if>
		<c:if test="${e.getId()==0 }">
			<%
				response.sendRedirect("registro?accion=tablaS&tablaN=2");
			%>
		</c:if>
	</c:if>
	<c:if test="${result==2}">
		<jsp:useBean id="pp" class="dao.HeroeDAO" scope="page"></jsp:useBean>
		<c:set var="ee" scope="session" value="${pp.cargarHeroe(id)}" />

		<c:if test="${ee!=null }">
			<div class="container">
				<div class="row my-5">
					<section
						class="col-12 col-md-6 mx-auto my-5  border border-light text-center"
						style="background: white;">
						<h1>HEROE</h1>
						<a href="index.jsp" class="btn btn-info btn-block p-2">Volver</a>
						<div class="form-row mb-4">
							<div class="col m-4">
								<label> Id Heroe: </label>
							</div>
							<div class="col m-4">${ee.getId()}</div>
						</div>
						<div class="form-row mb-4">
							<div class="col m-4">
								<label> Nombre Heroe: </label>
							</div>
							<div class="col m-4">${ee.getNombre()}</div>
						</div>
						<div class="form-row mb-4">
							<div class="col m-4">
								<label> Heroe: </label>
							</div>
							<div class="col m-4">${ee.getHeroe()}</div>
						</div>
						<div class="form-row mb-4">
							<div class="col m-4">
								<label> Fecha Nacimiento: </label>
							</div>
							<div class="col m-4">${ee.getFechanacimiento()}</div>
						</div>
						<div class="form-row mb-4">
							<div class="col m-4">
								<label> Fecha Aparicion: </label>
							</div>
							<div class="col m-4">${ee.getFechaaparicion()}</div>
						</div>
						<div class="form-row mb-4">
							<div class="col m-4">
								<label> Genero: </label>
							</div>
							<div class="col m-4">${ee.getGenero()}</div>
						</div>
						<div class="form-row mb-4">
							<div class="col m-4">
								<label> Estado: </label>
							</div>
							<div class="col m-4">${ee.getEstado()}</div>
						</div>
						<div class="form-row mb-4">
							<div class="col m-4">
								<label> Descripcion: </label>
							</div>
							<div class="col m-4">${ee.getGenero()}</div>
						</div>
						<div class="form-row mb-4">
							<div class="col m-4">
								<label> Arma: </label>
							</div>
							<div class="col m-4">${ee.getArma()}</div>
						</div>
					</section>
				</div>
			</div>
		</c:if>
		<c:if test="${e.getId()==0 }">
			<%
				response.sendRedirect("registro?accion=tablaS&tablaN=1");
			%>
		</c:if>
	</c:if>
	

	<link rel="stylesheet" href="css/mostrar.css">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>
</html>