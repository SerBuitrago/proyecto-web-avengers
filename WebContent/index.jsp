<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<title>Inicio</title>
</head>
<body>
	<div class="container">
		<div class="row my-5">
			<section
				class="col-12 col-md-6 mx-auto my-5  border border-light text-center"
				style="background: white;">
				<h1 class="m-4">Segundo Previo WEB 1151747</h1>


				<div class="form-row mb-4">
					<div class="col m-4">
						<a href="registro?accion=tablaS&tablaN=2"> <input
							type="submit" value="Listar Pelicula"
							class="btn btn-info btn-block p-2">
						</a>
					</div>
					<div class="col m-4">
						<a href="registro?accion=registroFS&r=2"><input type="submit"
							value="Registrar Pelicula" class="btn btn-info btn-block p-2"></a>
					</div>
				</div>


				<div class="form-row mb-4">
					<div class="col m-4">
						<a href="registro?accion=tablaS&tablaN=1"><input type="submit"
							value="Listar Heroes" class="btn btn-info btn-block p-2"></a>
					</div>
					<div class="col m-4">
						<a href="registro?accion=registroFS&r=1"><input type="submit"
							value="Registrar Heroe" class="btn btn-info btn-block p-2"></a>
					</div>
				</div>

				<div class="form-row mb-4">
					<div class="col m-4">
						<a href="registro?accion=tablaS&tablaN=3"><input type="submit"
							value="Tabla Participacion"
							class="btn btn-info btn-block p-2 mb-4"></a>
					</div>
					<div class="col m-4">
						<a href="registro?accion=registroFS&r=3"><input type="submit"
							value="Registrar Participacion" class="btn btn-info btn-block p-2"></a>
					</div>
				</div>
			</section>
		</div>
	</div>
	<link rel="stylesheet" href="css/registro.css">
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