<%-- 
    Document   : tipoFormacao
    Created on : 21 de abr. de 2023, 20:54:42
    Author     : Danil
--%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="config.Conexao"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="UTF-8"%>

<%
    Statement st = null;
    ResultSet rs = null;
%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tipo Formação</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
    </head>
    <body>   
        <div class="container text-center">
            <div class="row">
                <div class="col">
                    <div class="card">
                        <div class="card-header">
                            <ul class="nav nav-tabs card-header-tabs">
                                <li class="nav-item">
                                    <a href="index.jsp" class="nav-link" href="#">Formação do Professor</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link active" href="#">Tipo de Formação</a>
                                </li>
                                <li class="nav-item">
                                    <a href="formacao.jsp" class="nav-link" href="#">Formação</a>
                                </li>
                            </ul>
                        </div>
                        <div class="card-body">
                            <div style="text-align: left">
                                <a href="Cadastrar\cadTipoFormacao.jsp" class="btn btn-success"><i class="bi bi-clipboard2-fill"></i> Cadastrar Tipo Formação</a>
                            </div>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Tipo de Formação</th>
                                        <th scope="col">Editar</th>
                                        <th scope="col">Excluir</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        try {
                                            st = new Conexao().conectar().createStatement();
                                            rs = st.executeQuery("select * from tbtipoformacao;;");
                                            out.println("<tr>");
                                            while (rs.next()) {
                                                out.println("<td>" + rs.getString(1) + "</td>");
                                                out.println("<td>" + rs.getString(2) + "</td>");
                                                out.println("<td><a href='./Editar.Excluir/ediTipoFormacao.jsp?funcao=editar&id=" + rs.getString(1) + "' class='btn btn-primary'><i class='bi bi-pencil-fill'></i></a></td>");
                                                out.println("<td><a href='./Editar.Excluir/ediTipoFormacao.jsp?funcao=excluir&id=" + rs.getString(1) + "' class='btn btn-danger'><i class='bi bi-x-lg'></i></a></td></tr>");
                                            }
                                        } catch (Exception e) {
                                            out.println(e);
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

