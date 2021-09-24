<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>


<!-- paquete de caracteres -->
<meta charset="utf-8">
<!-- Tamaño de la pantalla -->
<meta name="viewport" content="width=device-width">
<!-- titulo de la pestaña -->
<title>Lista de clientes</title>
<!-- bootstrap-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<!-- font awesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">

<!-- Cargando mi hoja de estilo -->
<link href="style.css" rel="stylesheet" type="text/css" />


<script>
	var baseurl = "http://localhost:8080/listarclientes";
	function loadclientes() {
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.open("GET", baseurl, true);
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
				var clientes = JSON.parse(xmlhttp.responseText);
				var tbltop = "<table class='table table-dark table-striped'><tr><th>Cedula</th><th>Nombre</th><th>Direccion</th><th>Telefono</th><th>Email</th></tr>";
				var main = "";
				for (i = 0; i < clientes.length; i++) {
					main += "<tr><td>" + clientes[i].cedula_cliente
							+ "</td><td>" + clientes[i].nombre_cliente
							+ "</td><td>" + clientes[i].direccion_cliente
							+ "</td><td>" + clientes[i].telefono_cliente + "</td><td>"
							+ clientes[i].email_cliente + "</td></tr>";
				}
				var tblbottom = "</table>";
				var tbl = tbltop + main + tblbottom;
				document.getElementById("clientesinfo").innerHTML = tbl;
			}
		};
		xmlhttp.send();
	}
	window.onload = function() {
		loadclientes();
	}
</script>

</head>


<body>
	<!-- Navbar-->
	<nav class="navbar navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand links" href="index.html"><i class="fas fa-store"></i>Tienda Grupo 1</a>
		</div>
	</nav>

	<!-- Navbar modulos-->
<ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link active" aria-current="page" href="listausuarios.jsp"><i class="far fa-user-circle"></i> Usuarios</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="listaclientes.jsp"><i class="far fa-list-alt"></i> Clientes</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="listausuarios.jsp"><i class="fas fa-industry"></i> Proveedores</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="listausuarios.jsp"><i class="fas fa-shopping-cart"></i> Productos</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="listausuarios.jsp"><i class="fas fa-search-dollar"></i> Ventas</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="listausuarios.jsp"><i class="far fa-clipboard"></i> Reportes</a>
  </li>
</ul>
	
	
	<!-- contenido  -->
	
	<div style="padding-left: 5px;">
	
		<h1 class="colortitulos"><i class="fas fa-list-ol"></i> Tabla de Clientes</h1>
			<div class="container">
				<div class="row">
					<!--  Aqui es donde se autogenera la tabla basado en el script -->
					<div class="col align-self-center" id="clientesinfo">
					
					</div>
	
				</div>
			</div>
	
		<h1 class="colortitulos"><i class="fas fa-cogs"></i> Operaciones</h1>
			<div class="container">
				<div class="row">
					<button type="button" class="btn btn-success" onclick="window.location.href='/insertarcliente.jsp'">
					<i class="fas fa-plus-circle"></i> Agregar cliente</button>
					<button type="button" class="btn btn-danger">
					<i class="fas fa-trash"></i> Eliminar cliente</button>
					<button type="button" class="btn btn-warning">
					<i class="fas fa-pen-alt"></i> Actualizar cliente</button>
					<button type="button" class="btn btn-primary">
					<i class="fas fa-search"></i> Buscar un cliente</button>
					<button type="button" class="btn btn-primary">
					<i class="fas fa-search"></i> Listar todos los clientes</button>
				</div>
			</div>
	</div>




</body>
</html>