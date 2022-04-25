<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="Darío Vera García">
<title>Mantenedor de Contactos</title>
<script type="text/javascript">
	var idSelect = 0;
	function submitFormAction(action, method){
		document.getElementById("frmAcciones").action = action;
		document.getElementById("frmAcciones").method = method;
		document.getElementById("frmAcciones").submit();
	}
	
	function setIdSelect(id){
		idSelect = id;
	}
	
	function deleteRow(){
	alert(`Éliminando el registro N°`, + idSelect);
	document.getElementById("frmAcciones").action = "/contactManager/deleteContact/?id=" + idSelect;
	document.getElementById("frmAcciones").method = "GET";
	document.getElementById("frmAcciones").submit();
		
		window.location.href = "/contactManager/deleteContact/?id=" + idSelect;
	}
</script>
</head>
<body>
<form:form id="frmAcciones" modelAttribute="contacto">
		<div>
			<fieldset>
				<legend>Mantenedor de Contactos</legend>
				<table border="1">
					<tr>
						<td>Nombre: </td>
						<td><input type="text" id="idNombre" name="nombre"/></td>
						<td>Apellido Paterno: </td>
						<td><input type="text" id="idApellidoPaterno" name="apellidoPaterno"/></td>
						<td>Apellido Materno: </td>
						<td><input type="text" id="idApellidoMaterno" name="apellidoMaterno"/></td>
					</tr>
					<tr>
						<td>Dirección: </td>
						<td colspan="3"><input type="text" id="idDireccion" name="direccion" width="100%"/></td>
						<td>Teléfono: </td>
						<td><input type="text" id="idTelefono" name="telefono"/></td>
					</tr>
					<tr>
						<td colspan="6">
							<input type="button" value="Agregar" onclick="submitFormAction('/contactManager/addContact', 'post')"/>
							<input type="button" value="Eliminar" onclick="deleteRow()"/>
						</td>
					</tr>
				</table>
			
			</fieldset>
		</div>
	</form:form>
	<fieldset>
	<legend>Lista de contactos</legend>
		<div align="center">
			<table border="1" >
			<tr>
				<th></th>
				<th>Id</th>
				<th>Nombre</th>
				<th>Apellido Paterno</th>
				<th>Apellido Materno</th>
				<th>Dirección</th>
				<th>Teléfono</th>
			</tr>
			<tbody>
				<c:forEach items="${listaContacto}" var="contacto" >
					<tr>
						<td><input type="radio" id="optSelectRow${contacto.idContacto}" name="optSelectRow" onclick="setIdSelect(${contacto.idContacto})"/></td>
						<td>${contacto.idContacto}</td>
						<td>${contacto.nombre}</td>
						<td>${contacto.apellidoPaterno}</td>
						<td>${contacto.apellidoMaterno}</td>
						<td>${contacto.direccion}</td>
						<td>${contacto.telefono}</td>
					</tr>
				</c:forEach>
			</tbody>
			</table>
		</div>
	</fieldset>
</body>
</html>