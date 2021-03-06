<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="com.prueba.todo.model.Todo"%>
<%@ page import="com.google.appengine.api.datastore.KeyFactory"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Todo Admin</title>
<link rel="stylesheet" type="text/css"
	href="/resources/bootstrap4/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<link rel="shortcut icon" href="/resources/list.ico?"
	type="image/x-icon" />

</head>
<body>
	<div class="header col-md-12 col-sm-8">
		<a href="/" class="logo">Administrador de tareas</a>
		<div class="header-right">

			<a href="${pageContext.request.contextPath}/list">Tareas</a> <a
				href="${pageContext.request.contextPath}/listHecho">Tareas
				Finalizadas</a> <a href="${pageContext.request.contextPath}/listEstado">Estados</a>

		</div>
	</div>



	<div class="panel panel-default">
		<div
			class=" panel-heading parrafo  col-sm-12 row h-100 justify-content-center align-items-center">
			<div class="row ">
				<h2 class="text-uppercase font-weight-light text">Tareas Finalizadas</h2>
			</div>
		</div>

		
	</div>



	<div class="container">
		<div class="col-sm-12">
			<div class="table-responsive">
				<table border="1" class="table table-striped  table-bordered">
					<thead>
						<tr>
							<th scope="col">Nombre</th>
							<th scope="col">Horas</th>
							<th scope="col">Estado</th>
							<th scope="col">Fecha Inicio</th>
							<th scope="col">Fecha Fin</th>
							<th scope="col">Prioridad</th>
							<th scope="col">Acciones</th>
						</tr>
					</thead>

					<%
						DateFormat formatoFecha = new SimpleDateFormat("yyyy-mm-dd");
						String fechaini;
						String fechafin;
						if (request.getAttribute("listHecho") != null) {

							List<Todo> listtarea = (List<Todo>) request.getAttribute("listHecho");
							System.out.print("Tama�o de mi tarea" + listtarea.size());
							if (!listtarea.isEmpty()) {
								for (Todo c : listtarea) {

									fechaini = formatoFecha.format(c.getTodoFechaInicio());
									fechafin = formatoFecha.format(c.getTodofechaFin());
					%>
					<tr>
						<td><%=c.getTodoNombre()%></td>
						<td><%=c.getTodoNumHoras()%></td>
						<td><%=c.getTodoEstado().getEstadoNombre()%></td>
						<td><%=fechaini%></td>
						<td><%=fechafin%></td>
						<td><%=c.getPrioridad()%></td>
						<td><a href="view/<%=c.getTodoid()%>">Detalle</a></td>

					</tr>
					<%
						}

							}

						}
					%>

					</tr>





				</table>
			</div>

		</div>
	</div>

	<footer class="page-footer font-small unique-color-dark pt-4 footer">

		<div class="container">


			<ul class="list-unstyled list-inline text-center py-4">
				<li class="list-inline-item">
					<h5 class="mb-1">
						<p>"No dejes para ma�ana lo que puedas hacer hoy"</p>
						<p>"Benjamin Franklin"</p>
					</h5>
				</li>

			</ul>


		</div>

		<div class="footer-copyright text-center py-3">� 2018 Copyright
		</div>

	</footer>
</body>
</html>