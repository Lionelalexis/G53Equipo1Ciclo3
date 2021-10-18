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
<title>Eliminar Proveedor</title>
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
			<a class="navbar-brand links" href="index.html"><i class="fas fa-store"></i>Mi Tienda</a>
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
    <a class="nav-link" href="insertarventa.jsp"><i class="fas fa-search-dollar"></i> Ventas</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="listausuarios.jsp"><i class="far fa-clipboard"></i> Reportes</a>
  </li>
</ul>

	<div style="padding-left: 5px">
		<h1 class="colortitulos">
			<i class="fas fa-skull-crossbones"></i> Datos del proveedor a eliminar
		</h1>
		<div class="container">


			<div id="error" class="alert alert-danger visually-hidden"
				role="alert">Error al eliminar el proveedor, verifique que 
				exista un proveedor con el NIT dado</div>

			<div id="correcto" class="alert alert-success visually-hidden"
				role="alert">Cliente eliminado con exito</div>

			<form id="form1">
			
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">NIT</span> <input
						type="text" class="form-control"
						placeholder="Inserte NIT aqui..."
						aria-describedby="basic-addon1" required id="nit_proveedor">
				</div>

			</form>

			<button type="button" class="btn btn-danger" onclick="eliminar()">
				<i class="fas fa-skull-crossbones"></i> Eliminar proveedor
			</button>
			
			<br>
			<br>
			<br>
			<h1 class="colortitulos">
				<i class="fas fa-cogs"></i> Operaciones
			</h1>
			<div class="container">
				<div class="row">
					<button type="button" class="btn btn-success"
						onclick="window.location.href='/insertarproveedor.jsp'">
						<i class="fas fa-plus-circle"></i> Agregar proveedor
					</button>
					<button type="button" class="btn btn-danger"
						onclick="window.location.href='/eliminarproveedor.jsp'">
						<i class="fas fa-trash"></i> Eliminar proveedor
					</button>
					<button type="button" class="btn btn-warning"
						onclick="window.location.href='/actualizarproveedor.jsp'">
						<i class="fas fa-pen-alt"></i> Actualizar proveedor
					</button>
					<button type="button" class="btn btn-primary"
						onclick="window.location.href='/buscarproveedor.jsp'">
						<i class="fas fa-search"></i> Buscar un proveedor
					</button>
					<button type="button" class="btn btn-primary colorboton"
						onclick="window.location.href='/listaproveedores.jsp'">
						<i class="fas fa-search"></i> Listar todos los proveedores
					</button>
				</div>
			</div>
		</div>

	</div>

	<script>
		function eliminar() {
			
			//var getUrl = window.location;
			//var baseUrl = getUrl.protol +"//"+ getUrl.host + "/"+ getUrl.pathname.split('/')[1];				
			
			
			var y = document.getElementById("nit_proveedor").value;
			var req = new XMLHttpRequest();
			var coincidencia = false;
			//req.open('GET', baseUrl+"/listarproveedores", false);
			req.open('GET', 'http://localhost:8080/listarproveedores', false);
			req.send(null);
			var proveedores = null;
			if (req.status == 200)
				proveedores = JSON.parse(req.responseText);
			console.log(JSON.parse(req.responseText));

			for (i = 0; i < proveedores.length; i++) {
				
				console.log(proveedores[i].nit_proveedor);
				
				if (proveedores[i].nit_proveedor == y)) {
					console.log(proveedores[i].nit_proveedor +" "+y);					
					coincidencia =true
					break;
				}
				
			}
			console.log(coincidencia);

			if (coincidencia != false) {
				var nit=document.getElementById("nit_proveedor").value;
				
				var xhr = new XMLHttpRequest();
				//xhr.open("DELETE", baseUrl+"/eliminarproveedor?nit_proveedor="+nit);
				xhr.open("DELETE", "http://localhost:8080/eliminarproveedor?nit_proveedor="+nit);
				var element = document.getElementById("error");
				element.classList.add("visually-hidden");
				
				var element2 = document.getElementById("correcto");
				element2.classList.remove("visually-hidden");

				document.getElementById("nit_proveedor").value = "";
				xhr.send();

			} else {
				var element = document.getElementById("error");
				element.classList.remove("visually-hidden");
				
				var element2 = document.getElementById("correcto");
				element2.classList.add("visually-hidden");
				
				document.getElementById("nit_proveedor").value = "";;
			}
		}
	</script>

</body>
</html>