<%-- 
    Document   : cadTipoFormacao
    Created on : 21 de abr. de 2023, 19:08:55
    Author     : mathe
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="config.Conexao"%> 

<%
    Statement st = null;
    ResultSet rs = null;
%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tipo formação</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
    </head>
    <body>

        <div class="container text-center">
            <div class="row">

                <div class="col">

                    <a href="../index.jsp">Voltar para página Principal</a>

                    <div class="card border-secondary mb-3">
                        <div class="card-header">

                            <div class="container text-center">
                                <div class="row align-items-start">
                                    <div class="col">
                                        <form class="form-inline" action="" method="post" class="input-group input-group-sm mb-3">


                                            <div class="row justify-content-start">
                                                <div class="col-4">
                                                    <input type="text" placeholder="Digite o Tipo de Formação" name="txtTipoFormacao" class="form-control">
                                                </div>
                                                <div class="col-4">
                                                    <button type="submit" name="btnCadTipoFormacao" class="btn btn-success"><i class="bi bi-plus-lg"></i> Cadastrar</button>
                                                </div>
                                            </div>
                                        </form> 
                                        <%
                                            String tipoFormacao = request.getParameter("txtTipoFormacao");
                                            st = new Conexao().conectar().createStatement();

                                            if (request.getParameter("btnCadTipoFormacao") != null) {
                                                try {

                                                    st.executeUpdate("insert into tbtipoformacao(formacao) values('" + tipoFormacao + "')");

                                                    out.println("<meta http-equiv='refresh' content='0;URL='./Cadastrar/cadTipoFormacao.jsp'>");
                                                    out.println("<script type=\"text/javascript\">");
                                                    out.println("alert('Cadastro de TIPO DE FORMAÇÂO realizado com sucesso');");
                                                    out.println("</script>");
                                                } catch (Exception e) {

                                                }
                                            }
                                        %>


                                    </div>
                                    <div class="col">
                                        TIPO DE FORMAÇÃO
                                    </div>
                                    <div class="col">
                                        [ Buscar Tipo de Formação ]
                                    </div>
                                </div>
                            </div>


                        </div>
                        <div class="card-body text-secondary">
                            <h5 class="card-title">Aqui você encontra os tipos de formação cadastrado!</h5>
                            <p class="card-text"></p>


                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Tipo da Formação</th>
                                        <th scope="col">Editar</th>
                                        <th scope="col">Excluir</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <%
                                        try {
                                            st = new Conexao().conectar().createStatement();
                                            rs = st.executeQuery("Select * from tbtipoformacao");
                                            out.println("<tr>");
                                            while (rs.next()) {
                                                out.println("<th scope='row'>" + rs.getString(1) + "</th>");
                                                out.println("<th scope='row'>" + rs.getString(2) + "</th>");
                                                out.println("<th scope='row'><a href='../Editar.Excluir/ediTipoFormacao.jsp?funcao=editar&id=" + rs.getString(1) + "' class='text-info'><i class='bi bi-pencil-square'></i></a></th>");
                                                out.println("<th scope='row'><a href='../Editar.Excluir/ediTipoFormacao.jsp?funcao=excluir&id=" + rs.getString(1) + "' class='btn btn-danger'><i class='bi bi-x-lg'></i></a></th></tr>");
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
