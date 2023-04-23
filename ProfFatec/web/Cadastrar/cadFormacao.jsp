<%-- 
    Document   : cadFormacao
    Created on : 21 de abr. de 2023, 19:08:31
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
        <title>Formação</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    </head>
    <body>

        <div class="container text-center">
            <div class="row">
                <div class="col">
                    <a href="../index.jsp" class="btn btn-outline-dark"><i class="bi bi-arrow-left-circle-fill"></i>  Voltar para página Principal</a>
                    <br><br>
                    <div class="card border-secondary mb-3">

                        <div class="card-header">
                            <div class="row">
                                <div class="col-sm-5 col-md-6" style="text-align:left">Cadastrar Formação</div>

                                <div class="col-sm-5 offset-sm-2 col-md-6 offset-md-0">
                                    <form class="form-inline text-center" method="post" action="">

                                        <div class="input-group mb-3">
                                            <input type="text" class="form-control" placeholder="Digite a Formação" name="txtBuscaFormacao" aria-label="Recipient's username" aria-describedby="button-addon2" required>
                                            <button class="btn btn-outline-secondary" type="submit" name="btnBuscaFormacao" id="button-addon2"><i class="bi bi-search"></i></button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="card-body text-secondary">
                            <div class="container text-center">
                                <div class="row align-items-start">
                                    <div class="col">
                                        <form class="form-inline" action="" method="post" class="input-group input-group-sm mb-3">
                                            <div class="row">

                                                <div class="col-sm-5 col-md-6">
                                                    <input type="text" placeholder="Digite o Tipo de Formação" name="txtNomeFormacao" class="form-control form-control-lg mb-3" required>

                                                    <select type="text" name="txtTipoFormacao" class="form-select form-select-lg mb-3" required>
                                                        <option>Escolha um Tipo de Formação</option>
                                                        <%
                                                            try {
                                                                st = new Conexao().conectar().createStatement();
                                                                rs = st.executeQuery("Select * from tbtipoformacao");
                                                                while (rs.next()) {
                                                                    out.println("<option value='" + rs.getString(1) + "'>" + rs.getString(2) + "</option>");
                                                                }
                                                            } catch (Exception e) {
                                                                out.println(e);
                                                            }
                                                        %>
                                                    </select>
                                                    <button type="submit" name="btnCadFormacao" class="btn btn-success"><i class="bi bi-clipboard2-fill"></i> Cadastrar</button>
                                                    <a href='./cadFormacao.jsp' class='btn btn-danger text-light'><i class='bi bi-x-circle-fill'></i>  Cancelar</a>
                                                </div>
                                                <div class="col-sm-5 offset-sm-2 col-md-6 offset-md-0">
                                                    <%
                                                        // ------------------ BUSCAR FORMAÇÃO ------------------------
                                                        if (request.getParameter("btnBuscaFormacao") != null) {
                                                            String busca = request.getParameter("txtBuscaFormacao");

                                                            try {
                                                                st = new Conexao().conectar().createStatement();
                                                                rs = st.executeQuery("Select codFormacao, nomeFormacao, tbTipoFormacao.formacao from tbFormacao inner join tbTipoFormacao on tbFormacao.codTipoFormacao = tbTipoFormacao.codTipoFormacao where nomeFormacao like '%" + busca + "%' ORDER BY nomeFormacao ASC");

                                                                out.println("<table class='table table-bordered border-primary' style='width:100%'>");
                                                                out.println("<h5 class='card-title'>Busca de Formação</h5>");
                                                                out.println("<thead><tr><th  scope='col'>Formação</th><th scope='col'>Tipo</th><th  scope='col'>Editar</th></tr></thead>");
                                                                out.println("<tbody>");
                                                                while (rs.next()) {
                                                                    out.println("<td>" + rs.getString(2) + "</td>");
                                                                    out.println("<td>" + rs.getString(3) + "</td>");
                                                                    out.println("<td><a href='../Editar.Excluir/ediFormacao.jsp?funcao=editar&id=" + rs.getString(1) + "' class='btn btn-primary'><i class='bi bi-pencil-fill'></i></a></td></tr>");
                                                                }
                                                                out.println("</tbody></table>");
                                                                out.println("<a href='./cadFormacao.jsp' class='btn btn-danger text-light'><i class='bi bi-x-circle-fill'></i>  Cancelar Busca</a>");
                                                            } catch (Exception e) {
                                                                out.println(e);
                                                            }
                                                        }
                                                    %>
                                                </div>
                                            </div>
                                        </form>
                                        <%
                                            st = new Conexao().conectar().createStatement();

                                            if (request.getParameter("btnCadFormacao") != null) {

                                                String nomeFormacao = request.getParameter("txtNomeFormacao");
                                                String codTipoFormacao = request.getParameter("txtTipoFormacao");

                                                try {

                                                    st.executeUpdate("insert into tbformacao(nomeFormacao, codTipoFormacao) values('" + nomeFormacao + "', '" + codTipoFormacao + "')");

                                                    out.println("<meta http-equiv='refresh' content='0;URL='../formacao.jsp'>");
                                                    out.println("<script type=\"text/javascript\">");
                                                    out.println("alert('Cadastro de FORMAÇÂO realizado com sucesso');");
                                                    out.println("</script>");
                                                } catch (Exception e) {

                                                }
                                            }
                                        %>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
