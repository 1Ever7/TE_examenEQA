<%@page import="com.my.emergentes2.te_exameneqa.Estudiantes"%>
<%@page import="java.util.ArrayList" %>
<%
    if (session.getAttribute("listaest") == null) {
        ArrayList<Estudiantes> lisaux = new ArrayList<Estudiantes>();
        session.setAttribute("listaest", lisaux);
    }
    ArrayList<Estudiantes> lista = (ArrayList<Estudiantes>) session.getAttribute("listaest");
%>      

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de Calificaciones</title>
        <style>
            body {
                text-align: center;
            }
            .encabezado {
                border: 2px solid black;
                padding: 10px;
                margin: 20px auto; /* Centra el recuadro horizontalmente */
                width: 50%; /* Ancho del recuadro */
            }
            .tabla {
                margin: 20px auto; /* Centra la tabla horizontalmente */
                width: 80%; /* Ancho de la tabla */
                border-collapse: collapse;
            }
            .tabla th, .tabla td {
                border: 1px solid black;
                padding: 8px;
            }
        </style>
    </head>
    <body>
        <div class="encabezado">
            <h1>PRIMER PARCIAL TEM-742</h1>
            <p>Nombre: Ever Quispe Apaza</p>
            <p>Carnet: 10071741</p>
        </div>

        <h2><span style="font-weight: bold;">Registro de Calificaciones</span></h2>

        <button onclick="window.location.href='MainServlet?op=nuevo'">Nuevo registro</button>


        <table class="tabla" border="1" >
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombres</th>
                    <th>P1(30)</th>
                    <th>P2(30)</th>
                    <th>P3(40)</th>
                    <th>Nota(100)</th>
                    <th>Editar Estudiante</th>
                    <th>Eliminar Estudiante</th>
                </tr>
                <%
                    if (lista != null) {
                        for (Estudiantes item : lista) {
                             int nota = item.getP1() + item.getP2() + item.getP3();
                %>
                <tr>
                    <td><%= item.getId()%></td>
                    <td><%= item.getNombre()%></td>
                    <td><%= item.getP1()%></td>
                    <td><%= item.getP2()%></td>
                    <td><%= item.getP3()%></td>
                    <td><%= nota%></td>
                    <td>
                        <a href="MainServlet?op=editar&id=<%= item.getId()%>">Editar</a>
                    </td>
                    <td>
                        <a href="MainServlet?op=eliminar&id=<%= item.getId()%>"
                           onclick="return (confirm('Esta seguro de eliminar??'))" >Eliminar</a>
                    </td>
                </tr>
                <%
                        }
                    }
                %>
                </body>
                </html>
