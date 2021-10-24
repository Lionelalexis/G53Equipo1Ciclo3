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
	var getUrl = window.location;
	var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[1];
	var baseurll = baseUrl + "/listarventasclientes";
	function loadclientes() {
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.open("GET", baseurll, true);
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
				var clientes = JSON.parse(xmlhttp.responseText);
				var tbltop = "<table class='table table-dark table-striped'><tr><th>Cedula</th><th>Nombre Cliente</th><th>Valor Total Ventas</th></tr>";
				var main = "";
				var suma = 0;
				for (i = 0; i < clientes.length; i++) {
					main += "<tr><td>" + clientes[i].cedula_cliente
							+ "</td><td>" + clientes[i].nombre_cliente + "</td><td>"
							+ clientes[i].valor_venta + "</td></tr>";
				}
				
				for (i = 0; i < clientes.length; i++){
					suma = suma + ((clientes[i].valor_venta) * 100 );
				}
					
				var tblbottom = "</table>";
				var tbl = tbltop + main + tblbottom;
				document.getElementById("clientesinfo").innerHTML = tbl;
				document.getElementById("valor_total").value = suma / 100;
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
    <a class="nav-link" href="listaproveedores.jsp"><i class="fas fa-industry"></i> Proveedores</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="insertarproducto.jsp"><i class="fas fa-shopping-cart"></i> Productos</a>
  </li>
  <li class="nav-item">
	<a class="nav-link" href="insertarventa.jsp"><i	class="fas fa-search-dollar"></i> Ventas</a>
  </li>
  <li class="nav-item">
  	<a class="nav-link" href="Reportes.jsp"><i class="far fa-clipboard"></i> Reportes</a>
  </li>
</ul>
	
	
	<!-- contenido  -->
	
	<div style="padding-left: 5px;">
	
		<h1 class="color-blue text-center"><i class="fas fa-list-ol"></i> Total de Ventas por Cliente</h1>
			<div class="container">
				<div class="row">
					<!--  Aqui es donde se autogenera la tabla basado en el script -->
					<div class="col align-self-center" id="clientesinfo">
					
					</div>
	
				</div>
			</div>
			
			
									<div class="inlineLeft">
										<div class="input-group input-group-sm mb-10 alineacion">
											<span class="input-group-text" id="basic-addon1">Total Ventas $</span>
											<input type="text" class="form-control" readonly="readonly"
												id="valor_total">
										</div>
									</div>
	

</body>
</html>