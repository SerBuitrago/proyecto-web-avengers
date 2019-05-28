<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${formm>0 && formm<4 }">
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
<title>Registro</title>
</head>
<body>

	<div class="container">
		<div class="row my-5">
			<aside class="col-12 col-md-6 mx-auto">
				<c:if test="${formm==1}">
					<form name="addForm" method="post"
						class="text-center border border-light p-4"
						action="registro?accion=registroHeroe">
						<h1 class="mb-4">Registro Heroe</h1>
						<img class="img"
							src="https://cdn.icon-icons.com/icons2/900/PNG/512/superhero_batman_hero_comic_icon-icons.com_69240.png">
						<c:if test="${mensaje!=null}">
							<div class="alert alert-success">
								<a id="alerta" href="" class="close" data-dismiss="alert">&times;</a>${mensaje}</div>
						</c:if>
						<c:if test="${error!=null}">
							<div class="alert alert-danger">
								<a id="alerta" href="" class="close" data-dismiss="alert">&times;</a>${error}</div>
						</c:if>
						<div id="alerta2"></div>
						<div class="form-row mb-4">
							<div class="col">
								<input type="text" name="nombreH" class="form-control"
									placeholder="Nombre" required="true">
							</div>
							<div class="col">
								<input type="text" name="heroeH" class="form-control"
									placeholder="Heroe" required="true">
							</div>
						</div>
						<div class="form-row mb-4">
							<div class="col">
								<label class="p-2">Fecha Nacimiento</label>
							</div>
							<div class="col">
								<input type="date" name="anoNH" class="form-control"
									required="true">
							</div>
						</div>
						<div class="form-row mb-4">
							<div class="col">
								<label class="p-2">Fecha Aparicion</label>
							</div>
							<div class="col">
								<input type="date" name="anoAH" class="form-control"
									required="true">
							</div>
						</div>
						<div class="form-row mb-4">
							<div class="col">
								<input type="text" name="generoH" class="form-control"
									placeholder="Genero" required="true">
							</div>
							<div class="col">
								<input type="text" name="estadoH" class="form-control"
									placeholder="Estado" required="true">
							</div>
						</div>
						<textarea class="form-control my-4" placeholder="Descripcion"
							name="descripcionH"></textarea>
						<input type="text" name="armaH" class="form-control"
							placeholder="Arma" required="true">
						<div class="form-row mb-4 p-4">
							<div class="col">
								<a href="index.jsp" class="btn btn-info btn-block p-2">Volver</a>
							</div>
							<div class="col">
								<input type="submit" value="Registrar Heroe"
									class="btn btn-info btn-block p-2">
							</div>
						</div>
					</form>
				</c:if>
				<c:if test="${formm==2}">
					<form name="addForm" method="post"
						class="text-center border border-light p-4"
						action="registro?accion=registroPelicula">
						<h1 class="mb-4">Registrar Pelicula</h1>
						<img class="img"
							src="https://img.icons8.com/metro/420/movie-projector.png">
						<c:if test="${mensaje!=null}">
							<div class="alert alert-success">
								<a id="alerta" href="" class="close" data-dismiss="alert">&times;</a>${mensaje}</div>
						</c:if>
						<c:if test="${error!=null}">
							<div class="alert alert-danger">
								<a id="alerta" href="" class="close" data-dismiss="alert">&times;</a>${error}</div>
						</c:if>
						<div id="alerta2"></div>
						<div class="form-row mb-4">
							<div class="col">
								<input type="text" name="nombreP" class="form-control"
									placeholder="Nombre Pelicula" required="true">
							</div>
							<div class="col">
								<input type="text" name="anoLP" class="form-control"
									placeholder="Año Lanzamiento" required="true">
							</div>
						</div>
						<div class="form-row mb-4">
							<div class="col">
								<input type="text" name="anoSP" class="form-control"
									placeholder="Año Secuencia" required="true">
							</div>
							<div class="col">
								<input type="text" name="clasificacionP" class="form-control"
									placeholder="Clasificacion" required="true">
							</div>
						</div>
						<textarea class="form-control" placeholder="Sinopsis"
							name="sinopsisP" required="true"></textarea>
						<div class="form-row mb-4 p-4">
							<div class="col">
								<a href="index.jsp" class="btn btn-info btn-block p-2">Volver</a>
							</div>
							<div class="col">
								<input type="submit" value="RegistrarPelicula"
									class="btn btn-info btn-block p-2">
							</div>
						</div>
					</form>
				</c:if>
				<c:if test="${formm==3}">
					<form name="addForm" method="post"
						class="text-center border border-light p-4"
						action="registro?accion=registroParticipacion">
						<h1 class="mb-4">Registro Participacion</h1>
						<img class="img"
							src="https://cdn.icon-icons.com/icons2/900/PNG/512/superhero_batman_hero_comic_icon-icons.com_69240.png">
						<c:if test="${mensaje!=null}">
							<div class="alert alert-success">
								<a id="alerta" href="" class="close" data-dismiss="alert">&times;</a>${mensaje}</div>
						</c:if>
						<c:if test="${error!=null}">
							<div class="alert alert-danger">
								<a id="alerta" href="" class="close" data-dismiss="alert">&times;</a>${error}</div>
						</c:if>
						<div class="form-row mb-4">
							<div class="col">
								<input type="text" name="idHeroe" class="form-control"
									placeholder="Id Heroe" required="true">
							</div>
							<div class="col">
								<input type="text" name="idP" class="form-control"
									placeholder="Id Pelicula" required="true">
							</div>
						</div>
						<div class="form-row mb-4 p-4">
							<div class="col">
								<a href="index.jsp" class="btn btn-info btn-block p-2">Volver</a>
							</div>
							<div class="col">
								<input type="submit" value="Registrar"
									class="btn btn-info btn-block p-2">
							</div>
						</div>
					</form>
				</c:if>
			</aside>
		</div>
	</div>
	<link rel="stylesheet" href="css/registro.css">
	<style>
.img {
	width: 100px;
	height: 100px;
	margin-bottom: 10px;
}
</style>
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
</c:if>
<c:if test="${formm==null || formm==0 || formm>3 }">
	<%
		response.sendRedirect("index.jsp");
	%>
</c:if>