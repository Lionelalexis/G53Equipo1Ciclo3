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
<title>Lista de usuarios</title>
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


</head>
<body>
	<!-- Navbar-->
	<nav class="navbar navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand links" href="index.html"><i
				class="fas fa-store"></i>Mi Tienda</a>
		</div>
	</nav>

	<!-- Navbar modulos-->

	<ul class="nav nav-tabs">
		<li class="nav-item"><a class="nav-link active"
			aria-current="page" href="listausuarios.jsp"><i
				class="far fa-user-circle"></i> Usuarios</a></li>
		<li class="nav-item"><a class="nav-link" href="listaclientes.jsp"><i
				class="far fa-list-alt"></i> Clientes</a></li>
		<li class="nav-item"><a class="nav-link"
			href="listaproveedores.jsp"><i class="fas fa-industry"></i>
				Proveedores</a></li>
		<li class="nav-item"><a class="nav-link"
			href="insertarproducto.jsp"><i class="fas fa-shopping-cart"></i>
				Productos</a></li>
		<li class="nav-item"><a class="nav-link" href="insertarventa.jsp"><i
				class="fas fa-search-dollar"></i> Ventas</a></li>
		<li class="nav-item"><a class="nav-link" href="Reportes.jsp"><i
				class="far fa-clipboard"></i> Reportes</a></li>
	</ul>
		
	
	<div class="d-grid gap-2 col-6 mx-auto">
  		<button class="btn btn-primary align-middle" type="button" onclick="window.location.href='<%=request.getContextPath()%>/listausuariosR.jsp'">Listado de Usuarios</button>
  		<button class="btn btn-primary align-middle" type="button" onclick="window.location.href='<%=request.getContextPath()%>/listaclientesR.jsp'">Listado de Clientes</button>
  		<button class="btn btn-primary align-middle" type="button" onclick="window.location.href='<%=request.getContextPath()%>/valortotalventa.jsp'">Ventas por Cliente</button>
	</div>

</body>
</html>