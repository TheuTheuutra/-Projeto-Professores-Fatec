<%-- 
    Document   : cadFormacaoProfessor
    Created on : 21 de abr. de 2023, 19:09:32
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
        <title>Formação dos Professores</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
    </head>
    <body>

        <div class="container text-center">
            <div class="row">

                <div class="col">
                    <div class="card border-secondary mb-3">
                        <div class="card-header"> 
                            <ul class="nav nav-tabs card-header-tabs">
                                <li class="nav-item">
                                    <a href="../index.jsp" class="nav-link">Formação</a>
                                </li>
                                <li class="nav-item">
                                    <a href="../Cadastrar/cadTipoFormacao.jsp" class="nav-link">Tipo de Formação</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link active">Formação Professor</a>
                                </li>
                            </ul>
                        </div>
                        <div class="card-body text-secondary">

                            <div class="row">
                                <div class="col-sm-5 col-md-6">

                                    <form class="form-inline" action="" method="post" class="input-group input-group-sm mb-3">

                                        <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" name="txtNomeProfessor">
                                            <option>Selecione o Professor</option>
                                            <%
                                                try {
                                                    st = new Conexao().conectar().createStatement();
                                                    rs = st.executeQuery("SELECT * from tbprofessor");
                                                    while (rs.next()) {
                                                        if (rs.getString(5).equals("1")) {
                                                            out.println("<option value='" + rs.getString(1) + "'>" + rs.getString(2) + "</option>");
                                                        }
                                                    }
                                                } catch (Exception e) {
                                                    out.println(e);
                                                }
                                            %>
                                        </select>

                                        <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" name="txtNomeFormacao">
                                            <option>Selecione a Formação</option>
                                            <%
                                                try {
                                                    st = new Conexao().conectar().createStatement();
                                                    rs = st.executeQuery("SELECT * from tbformacao");
                                                    while (rs.next()) {
                                                        out.println("<option value='" + rs.getString(1) + "'>" + rs.getString(2) + "</option>");
                                                    }
                                                } catch (Exception e) {
                                                    out.println(e);
                                                }
                                            %>
                                        </select>

                                        <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" name="txtNomeInstituicao">
                                            <option>Selecione a Instituição</option>
                                            <%
                                                try {
                                                    st = new Conexao().conectar().createStatement();
                                                    rs = st.executeQuery("SELECT * from tbinstituicao");
                                                    while (rs.next()) {
                                                        out.println("<option value='" + rs.getString(1) + "'>" + rs.getString(2) + "</option>");
                                                    }
                                                } catch (Exception e) {
                                                    out.println(e);
                                                }
                                            %>
                                        </select>

                                        <button type="submit" name="btnCadCursoProfessor" class="btn btn-success"><i class="bi bi-clipboard2-fill"></i> Cadastrar</button>

                                    </form>
                                    <%
                                        String codProfessor = request.getParameter("txtNomeProfessor");
                                        String codFormacao = request.getParameter("txtNomeFormacao");
                                        String codInstituicao = request.getParameter("txtNomeInstituicao");

                                        st = new Conexao().conectar().createStatement();

                                        if (request.getParameter("btnCadCursoProfessor") != null) {
                                            try {

                                                st.executeUpdate("insert into tbformacaoprofessor(codProfessor, codFormacao, codInstituicao) values('" + codProfessor + "', '" + codFormacao + "', '" + codInstituicao + "')");

                                                out.println("<meta http-equiv='refresh' content='0;URL='./Cadastrar/cadFormacaoProfessor.jsp'>");
                                                out.println("<script type=\"text/javascript\">");
                                                out.println("alert('Cadastro de FORMAÇÂO do PROFESSOR realizado com sucesso');");
                                                out.println("</script>");
                                            } catch (Exception e) {

                                            }
                                        }
                                    %>
                                </div>

                                <div class="col-sm-5 offset-sm-2 col-md-6 offset-md-0"></div>
                            </div>

                            <hr>

                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Professor</th>
                                        <th scope="col">Formação</th>
                                        <th scope="col">Tipo de Formação</th>
                                        <th scope="col">Instituição</th>
                                        <th scope="col">Editar</th>
                                        <th scope="col">Excluir</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <%
                                        try {
                                            st = new Conexao().conectar().createStatement();
                                            rs = st.executeQuery("Select codFormacaoProfessor, tbprofessor.nomeProfessor, tbformacao.nomeFormacao, tbTipoFormacao.formacao, tbinstituicao.nomeInstituicao from tbFormacaoprofessor inner join tbformacao on tbFormacaoprofessor.codFormacao = tbformacao.codFormacao inner join tbTipoFormacao on tbFormacao.codTipoFormacao = tbTipoFormacao.codTipoFormacao inner join tbprofessor on tbprofessor.codProfessor = tbFormacaoprofessor.codProfessor inner join tbinstituicao on tbinstituicao.codInstituicao = tbFormacaoprofessor.codInstituicao;");
                                            out.println("<tr>");
                                            while (rs.next()) {
                                                out.println("<th scope='row'>" + rs.getString(1) + "</th>");
                                                out.println("<td>" + rs.getString(2) + "</td>");
                                                out.println("<td>" + rs.getString(3) + "</td>");
                                                out.println("<td>" + rs.getString(4) + "</td>");
                                                out.println("<td>" + rs.getString(5) + "</td>");
                                                out.println("<td><a href='../Editar.Excluir/ediFormacaoProfessor.jsp?funcao=editar&id=" + rs.getString(1) + "' class='btn btn-primary'><i class='bi bi-pencil-fill'></i></a></td>");
                                                out.println("<td><a href='../Editar.Excluir/ediFormacaoProfessor.jsp?funcao=excluir&id=" + rs.getString(1) + "' class='btn btn-danger'><i class='bi bi-x-lg'></i></a></td></tr>");
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
