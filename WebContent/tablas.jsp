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
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Tabla</title>
</head>
<body>
	<div class="container">
		<div class="row my-5 p-4" style="background: white;">
			<div class=" mx-auto">
				<div class="col">
					<c:if test="${tablaV==1}">
						<h1 class="text-center py-4">Heroes</h1>
					</c:if>
					<c:if test="${tablaV==2}">
						<h1 class="text-center py-4">Peliculas</h1>
					</c:if>
					<c:if test="${tablaV==3}">
						<h1 class="text-center py-4">Participacion</h1>
					</c:if>
				</div>
			</div>
			<div class="searchbar my-4 mx-auto">
				<input id="searchTerm" class="search_input" type="text" name=""
					onkeyup="doSearch()" placeholder="Buscar..."> <a href="#"
					class="search_icon"><i class="fas fa-search"></i></a>
			</div>
			<!-- Clase table-reponsive muestra un scroll cuando la pantalla es muy pequeña -->
			<div class="table-responsive  text-center">
				<table
					class="table table-striped table-bordered table-hover table-condensed"
					id="datos">
					<thead>
						<tr>
							<c:if test="${tablaV==1}">
								<th scope="col">id</th>
								<th scope="col">Nombre</th>
								<th scope="col">Heroe</th>
								<th scope="col">Fecha Nacimiento</th>
								<th scope="col">Fecha Aparicion</th>
								<th scope="col">Genero</th>
								<th scope="col">Estado</th>
								<th scope="col">Descripcion</th>
								<th scope="col">Arma</th>
								<th scope="col">Eliminar</th>
								<th scope="col">Modificar</th>
							</c:if>
							<c:if test="${tablaV==2}">
								<th scope="col">id</th>
								<th scope="col">Nombre</th>
								<th scope="col">Año lanzamiento</th>
								<th scope="col">Año Prueba</th>
								<th scope="col">Sinopsis</th>
								<th scope="col">Clasificacion</th>
								<th scope="col">Eliminar</th>
								<th scope="col">Modificar</th>
							</c:if>
							<c:if test="${tablaV==3}">
								<th scope="col" colspan="2">id Heroe</th>
								<th scope="col" colspan="2">Id Pelicula</th>
							</c:if>
						</tr>
					</thead>
					<tbody>
						<c:if test="${tablaV==1}">
							<jsp:useBean id="p" class="dao.HeroeDAO" scope="page"></jsp:useBean>
							<c:set var="lista" scope="session" value="${p.heroes()}" />
							<c:forEach var="e" items="${lista}">
								<tr>
									<td><a href="registro?accion=seleccion&id=${e.getId()}&result=2">${e.getId()}</a></td>
									<td>${e.getNombre()}</td>
									<td>${e.getHeroe()}</td>
									<td>${e.getFechanacimiento()}</td>
									<td>${e.getFechaaparicion()}</td>
									<td>${e.getGenero()}</td>
									<td>${e.getEstado()}</td>
									<td>${e.getDescripcion()}</td>
									<td>${e.getArma()}</td>
									<td><a
										href="configuracion?accion=eliminarH&id=${e.getId()}"
										class="btn btn-info btn-block p-2 text-light bg-danger"> <i
											class="far fa-trash-alt"></i>
									</a></td>
									<td><a class="btn btn-info btn-block p-2 text-light"
										href="" target="_blank" data-toggle="modal"
										data-target="#exampleModalScrollable${e.getId()}"><i
											class="fas fa-pen"></i> </a></td>

									<div class="modal fade" id="exampleModalScrollable${e.getId()}"
										tabindex="-1" role="dialog"
										aria-labelledby="exampleModalScrollableTitle"
										aria-hidden="true">
										<div class="modal-dialog modal-dialog-scrollable"
											role="document">
											<div class="modal-content">
												<div class="modal-header text-center"
													style="background: #1ab188; text-align: center">
													<h5 class="modal-title" id="exampleModalScrollableTitle"
														style="color: white">Actualizar Informacion</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<c:set var="pel" scope="session"
													value="${p.cargarHeroe(e.getId())}" />
												<div class="modal-body">
													<form class="text-center"
														action="registro?accion=actualizarH&id=${pel.getId()}"
														method="post">
														<h1 class="mb-4">Heroe ID.${e.getId()}</h1>
														<div class="form-row mb-4">
															<div class="col">
																<label>Nombre: </label>
															</div>
															<div class="col">
																<input type="text" name="nombreHA" class="form-control"
																	value="${pel.getNombre()}">
															</div>
														</div>
														<div class="form-row mb-4">
															<div class="col">
																<label>Heroe</label>
															</div>
															<div class="col">
																<input type="text" name="heroeHA" class="form-control"
																	value="${pel.getHeroe()}">
															</div>
														</div>
														<div class="form-row mb-4">
															<div class="col">
																<label>Fecha Nacimiento</label>
															</div>
															<div class="col">
																<input type="date" name="fechaNHA" class="form-control"
																	value="${pel.getFechanacimiento()}">
															</div>
														</div>
														<div class="form-row mb-4">
															<div class="col">
																<label>Fecha Aparicion</label>
															</div>
															<div class="col">
																<input type="date" name="fechaAHA" class="form-control"
																	value="${pel.getFechaaparicion()}">
															</div>
														</div>
														<div class="form-row mb-4">
															<div class="col">
																<label>Genero</label>
															</div>
															<div class="col">
																<input type="text" name="generoHA" class="form-control"
																	value="${pel.getGenero()}">
															</div>
														</div>
														<div class="form-row mb-4">
															<div class="col">
																<label>Estado</label>
															</div>
															<div class="col">
																<input type="text" name="estadoHA" class="form-control"
																	value="${pel.getEstado()}">
															</div>
														</div>
														<div class="form-row mb-4">
															<div class="col">
																<label>Descripcion</label>
															</div>
															<div class="col">
																<input type="text" name="descripcionHA"
																	class="form-control" value="${pel.getDescripcion()}">
															</div>
														</div>
														<div class="form-row mb-4">
															<div class="col">
																<label>Arma</label>
															</div>
															<div class="col">
																<input type="text" name="armaHA" class="form-control"
																	value="${pel.getArma()}">
															</div>
														</div>
														<input class="btn btn-info btn-block p-2 text-light"
															type="submit" value="Actualizar"
															style="background: #1ab188">
													</form>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal" style="background: #1ab188">Cerrar
													</button>
												</div>
											</div>
										</div>
									</div>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${tablaV==2}">
							<jsp:useBean id="pp" class="dao.PeliculaDAO" scope="page"></jsp:useBean>
							<c:set var="lista" scope="session" value="${pp.peliculas()}" />
							<c:forEach var="e" items="${lista}">
								<tr>
									<td><a href="registro?accion=seleccion&id=${e.getId()}&result=1">${e.getId()}</a></td>
									<td>${e.getNombre()}</td>
									<td>${e.getAnolanzamiento()}</td>
									<td>${e.getAnosecuencia()}</td>
									<td>${e.getSinopsis()}</td>
									<td>${e.getClasificacion()}</td>
									<td><a
										href="configuracion?accion=eliminarP&id=${e.getId()}"
										class="btn btn-info btn-block p-2 text-light bg-danger"><i
											class="far fa-trash-alt"></i> </a></td>
									<td><a class="btn btn-info btn-block p-2 text-light"
										href="" target="_blank" data-toggle="modal"
										data-target="#exampleModalScrollable${e.getId()}"><i
											class="fas fa-pen"></i></a></td>

									<div class="modal fade" id="exampleModalScrollable${e.getId()}"
										tabindex="-1" role="dialog"
										aria-labelledby="exampleModalScrollableTitle"
										aria-hidden="true">
										<div class="modal-dialog modal-dialog-scrollable"
											role="document">
											<div class="modal-content">
												<div class="modal-header text-center"
													style="background: #1ab188; text-align: center">
													<h5 class="modal-title" id="exampleModalScrollableTitle"
														style="color: white">Actualizar Informacion</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<c:set var="pel" scope="session"
													value="${pp.cargarPelicula(e.getId())}" />
												<div class="modal-body">
													<form class="text-center"
														action="registro?accion=actualizarP&user=${pel.getNombre()}"
														method="post">
														<h1 class="mb-4">Pelicula ID.${e.getId()}</h1>
														<div class="form-row mb-4">
															<div class="col">
																<label>Nombre Pelicula: </label>
															</div>
															<div class="col">
																<input type="text" name="nombrePA" class="form-control"
																	value="${pel.getNombre()}">
															</div>
														</div>
														<div class="form-row mb-4">
															<div class="col">
																<label>Año Lanazamiento</label>
															</div>
															<div class="col">
																<input type="text" name="anoLPA" class="form-control"
																	value="${pel.getAnolanzamiento()}">
															</div>
														</div>
														<div class="form-row mb-4">
															<div class="col">
																<label>Año Prueba</label>
															</div>
															<div class="col">
																<input type="text" name="anoPPA" class="form-control"
																	value="${pel.getAnosecuencia()}">
															</div>
														</div>
														<div class="form-row mb-4">
															<div class="col">
																<label>Sinopsis</label>
															</div>
															<div class="col">
																<input type="text" name="sinopsisAP"
																	class="form-control" value="${pel.getSinopsis()}">
															</div>
														</div>
														<div class="form-row mb-4">
															<div class="col">
																<label>Clasificacion</label>
															</div>
															<div class="col">
																<input type="text" name="clasificacionAP"
																	class="form-control" value="${pel.getClasificacion()}">
															</div>
														</div>
														<input class="btn btn-info btn-block p-2 text-light"
															type="submit" value="Actualizar"
															style="background: #1ab188">
													</form>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal" style="background: #1ab188">Cerrar
													</button>
												</div>
											</div>
										</div>
									</div>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${tablaV==3}">
							<jsp:useBean id="ppp" class="dao.ParticipacionDAO" scope="page"></jsp:useBean>
							<c:set var="listas" scope="session"
								value="${ppp.participacion()}" />
							<c:forEach var="ee" items="${listas}">
								<tr>
									<td>${ee.getIdH()}</td>
									<td>${ppp.heroe(e.getIdH())}</td>
									<td>${ee.getIdP()}</td>
									<td>${ppp.pelicula(e.getIdP())}</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>

			<aside class="col-12 col-md-6 mx-auto">
				<div class="form-row mb-4">
					<div class="col">
						<c:if test="${tablaV==1}">
							<a href="registro?accion=registroFS&r=1"
								class="btn btn-info btn-block p-2">Registrar Heroe</a>
						</c:if>
						<c:if test="${tablaV==2}">
							<a href="registro?accion=registroFS&r=2"
								class="btn btn-info btn-block p-2">Registrar Pelicula</a>
						</c:if>
					</div>
					<div class="col">
						<a href="index.jsp" class="btn btn-info btn-block p-2">Volver</a>
					</div>
				</div>
			</aside>
		</div>
	</div>
	<link rel="stylesheet" href="css/registro.css">
	<script type="text/javascript" src="js/BuscadorTabla.js"></script>
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
