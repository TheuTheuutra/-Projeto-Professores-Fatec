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
    </head>
    <body>

        <div class="container text-center">
            <div class="row">
                <div class="col">


                    <a href="../index.jsp">Voltar para página Principal</a>
                    <br><br>
                    <div class="card border-secondary mb-3">

                        <div class="card-header">Cadastrar Formação</div>
                        <div class="card-body text-secondary">
                            <div class="container text-center">
                                <div class="row align-items-start">
                                    <div class="col">
                                        <form class="form-inline" action="" method="post" class="input-group input-group-sm mb-3">
                                            <div class="row">

                                                <div class="col-sm-5 col-md-6">
                                                    <input type="text" placeholder="Digite o Tipo de Formação" name="txtNomeFormacao" class="form-control form-control-lg mb-3">

                                                    <select type="text" name="txtTipoFormacao" class="form-select form-select-lg mb-3">
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
                                                </div>
                                                <div class="col-sm-5 offset-sm-2 col-md-6 offset-md-0"></div>
                                            </div>
                                        </form>
                                        <%
                                            st = new Conexao().conectar().createStatement();

                                            if (request.getParameter("btnCadFormacao") != null) {

                                                String nomeFormacao = request.getParameter("txtNomeFormacao");
                                                String codTipoFormacao = request.getParameter("txtTipoFormacao");

                                                try {

                                                    st.executeUpdate("insert into tbformacao(nomeFormacao, codTipoFormacao) values('" + nomeFormacao + "', '" + codTipoFormacao + "')");

                                                    out.println("<meta http-equiv='refresh' content='0;URL='./Cadastrar/cadFormacao.jsp'>");
                                                    out.println("<script type=\"text/javascript\">");
                                                    out.println("alert('Cadastro de FORMAÇÂO realizado com sucesso');");
                                                    out.println("</script>");
                                                } catch (Exception e) {

                                                }
                                            }
                                        %>

                                        <hr>

                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th scope="col">#</th>
                                                    <th scope="col">Nome</th>
                                                    <th scope="col">Tipo</th>
                                                    <th scope="col">Editar</th>
                                                    <th scope="col">Excluir</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    try {
                                                        st = new Conexao().conectar().createStatement();
                                                        rs = st.executeQuery("Select codFormacao, nomeFormacao, tbTipoFormacao.formacao from tbFormacao inner join tbTipoFormacao on tbFormacao.codTipoFormacao = tbTipoFormacao.codTipoFormacao");
                                                        out.println("<tr>");
                                                        while (rs.next()) {
                                                            out.println("<th scope='row'>" + rs.getString(1) + "</th>");
                                                            out.println("<th>" + rs.getString(2) + "</th>");
                                                            out.println("<th>" + rs.getString(3) + "</th>");
                                                            out.println("<th><a href='../Editar.Excluir/ediFormacao.jsp?funcao=editar&id=" + rs.getString(1) + "' class='text-info'><i class='bi bi-pencil-square'></i></a></th>");
                                                            out.println("<th><a href='../Editar.Excluir/ediFormacao.jsp?funcao=excluir&id=" + rs.getString(1) + "' class='btn btn-danger'><i class='bi bi-x-lg'></i></a></th></tr>");
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
                </div>
            </div>
        </div>



    </body>
</html>
