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
                    <a href="../tipoFormacao.jsp" class="btn btn-outline-dark"><i class="bi bi-arrow-left-circle-fill"></i>  Voltar para página Principal</a>
                    <br><br>
                    <div class="card ">
                        <div class="card-header">

                            <div class="row">
                                <div class="col-sm-5 col-md-6" style="text-align:left">Cadastrar Tipo Formação</div>

                                <div class="col-sm-5 offset-sm-2 col-md-6 offset-md-0">
                                    <form class="form-inline text-center" method="post" action="">

                                        <div class="input-group mb-3">
                                            <input type="text" class="form-control" placeholder="Digite o tipo de Formação" name="txtBuscaTipoFormacao" aria-label="Recipient's username" aria-describedby="button-addon2" required>
                                            <button class="btn btn-outline-secondary" type="submit" name="btnBuscaTipoFormacao" id="button-addon2"><i class="bi bi-search"></i></button>
                                        </div>
                                    </form>
                                </div>
                            </div>

                        </div>
                        <div class="card-body">
                            <div class="container text-center">
                                <div class="row align-items-start">
                                    <div class="col">
                                        <form class="form-inline" action="" method="post" class="input-group input-group-sm mb-3">
                                            <div class="row">
                                                <div class="col-sm-5 col-md-6">
                                                    <input type="text" placeholder="Digite o Tipo de Formação" name="txtTipoFormacao" class="form-control form-control-lg mb-3">

                                                    <button type="submit" name="btnCadTipoFormacao" class="btn btn-success"><i class="bi bi-clipboard2-fill"></i> Cadastrar</button>
                                                    <a href='./cadTipoFormacao.jsp' class='btn btn-danger text-light'><i class='bi bi-x-circle-fill'></i>  Cancelar</a>
                                                </div>
                                                <div class="col-sm-5 offset-sm-2 col-md-6 offset-md-0">
                                                    <%
                                                        // ------------------ BUSCAR TIPO FORMAÇÃO ------------------------
                                                        if (request.getParameter("btnBuscaTipoFormacao") != null) {
                                                            String busca = request.getParameter("txtBuscaTipoFormacao");

                                                            try {
                                                                st = new Conexao().conectar().createStatement();
                                                                rs = st.executeQuery("Select * from tbTipoFormacao where formacao like '%" + busca + "%' ORDER BY formacao ASC");

                                                                out.println("<table class='table table-bordered border-primary' style='width:100%'>");
                                                                out.println("<h5 class='card-title'>Busca de Formação</h5>");
                                                                out.println("<thead><tr><th  scope='col'>Tipo de Formação</th><th  scope='col'>Editar</th></tr></thead>");
                                                                out.println("<tbody>");
                                                                while (rs.next()) {
                                                                    out.println("<td>" + rs.getString(2) + "</td>");
                                                                    out.println("<td><a href='../Editar.Excluir/ediTipoFormacao.jsp?funcao=editar&id=" + rs.getString(1) + "' class='btn btn-primary'><i class='bi bi-pencil-fill'></i></a></td></tr>");
                                                                }
                                                                out.println("</tbody></table>");
                                                                out.println("<a href='./cadTipoFormacao.jsp' class='btn btn-danger text-light'><i class='bi bi-x-circle-fill'></i>  Cancelar Busca</a>");
                                                            } catch (Exception e) {
                                                                out.println(e);
                                                            }
                                                        }
                                                    %>

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
                                </div>


                            </div>


                            <h5 class="card-title"></h5>
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
                                            rs = st.executeQuery("Select * from tbtipoformacao order by codTipoFormacao desc");
                                            out.println("<tr>");
                                            while (rs.next()) {
                                                out.println("<th scope='row'>" + rs.getString(1) + "</th>");
                                                out.println("<td>" + rs.getString(2) + "</th>");
                                                out.println("<td><a href='../Editar.Excluir/ediTipoFormacao.jsp?funcao=editar&id=" + rs.getString(1) + "' class='btn btn-primary'><i class='bi bi-pencil-fill'></i></a></td>");
                                                out.println("<td><a href='../Editar.Excluir/ediTipoFormacao.jsp?funcao=excluir&id=" + rs.getString(1) + "' class='btn btn-danger'><i class='bi bi-x-lg'></i></a></td></tr>");
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
