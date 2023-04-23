<%-- 
    Document   : ediFormacaoProfessor
    Created on : 21 de abr. de 2023, 20:13:04
    Author     : mathe
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
                    <h1>Editar Formação Professor</h1>
                    <%
                        String nomeProfessor = null;
                        String nomeInstituicao = null;
                        String nomeFormacao = null;
                        String codProfessor = null;
                        String codInstituicao = null;
                        String codFormacao = null;

                        if (request.getParameter("funcao") != null && request.getParameter("funcao").equals("editar")) {
                            String valorID = request.getParameter("id");
                            st = new Conexao().conectar().createStatement();
                            try {
                                rs = st.executeQuery("Select  p.codProfessor, p.nomeProfessor, f.codFormacao, f.nomeFormacao, i.codInstituicao, i.nomeInstituicao from tbProfessor p,tbformacao f, tbinstituicao i, tbformacaoprofessor fp where codFormacaoProfessor='" + valorID + "' and p.codProfessor = fp.codProfessor and f.codFormacao = fp.codFormacao and i.codInstituicao= fp.codInstituicao");
                                while (rs.next()) {
                                    codProfessor = rs.getString(1);
                                    nomeProfessor = rs.getString(2);
                                    codFormacao = rs.getString(3);
                                    nomeFormacao = rs.getString(4);
                                    codInstituicao = rs.getString(5);
                                    nomeInstituicao = rs.getString(6);

                                }
                            } catch (Exception e) {
                                out.println(e);
                            }
                        } else if (request.getParameter("funcao") != null && request.getParameter("funcao").equals("excluir")) {

                            try {
                                String id = request.getParameter("id");
                                st = new Conexao().conectar().createStatement();
                                st.executeUpdate("Delete from tbformacaoprofessor where codFormacaoProfessor='" + id + "'");
                                out.println("<meta http-equiv='refresh' content='0;URL=../formacaoProfessor.jsp'>");
                                out.println("<script type=\"text/javascript\">");
                                out.println("alert('Formação do professor excluída com sucesso');");
                            } catch (Exception e) {
                                out.println(e);
                            }
                        }
                    %>

                    <form action="" method="post" id="editar">
                        <div class="form-group text-center">
                            <label class="text-light">Professor:</label><br>
                            <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" name="txtNomeProfessor">
                                <option value="<%=codProfessor%>"><%=nomeProfessor%></option>
                                <%
                                    try {
                                        st = new Conexao().conectar().createStatement();
                                        rs = st.executeQuery("SELECT * from tbprofessor");
                                        while (rs.next()) {
                                            if (rs.getString(2).equals(nomeProfessor) != true) {
                                                out.println("<option value='" + rs.getString(1) + "'>" + rs.getString(2) + "</option>");
                                            }
                                        }
                                    } catch (Exception e) {
                                        out.println(e);
                                    }
                                %>
                            </select>
                        </div>
                        <br>
                        <div class="form-group text-center">
                            <label class="text-light">Formacao:</label><br>
                            <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" name="txtFormacao">
                                <option value="<%=codFormacao%>"><%=nomeFormacao%></option>
                                <%
                                    try {
                                        st = new Conexao().conectar().createStatement();
                                        rs = st.executeQuery("SELECT * from tbFormacao");
                                        while (rs.next()) {
                                            if (rs.getString(2).equals(nomeFormacao) != true) {
                                                out.println("<option value='" + rs.getString(1) + "'>" + rs.getString(2) + "</option>");
                                            }
                                        }
                                    } catch (Exception e) {
                                        out.println(e);
                                    }
                                %>
                            </select>
                        </div>
                        <br>
                        <div class="form-group text-center">
                            <label class="text-light">Instituição:</label><br>
                            <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" name="txtInstituicao">
                                <option value="<%=codInstituicao%>"><%=nomeInstituicao%></option>
                                <%
                                    try {
                                        st = new Conexao().conectar().createStatement();
                                        rs = st.executeQuery("SELECT * from tbinstituicao");
                                        while (rs.next()) {
                                            if (rs.getString(2).equals(nomeInstituicao) != true) {
                                                out.println("<option value='" + rs.getString(1) + "'>" + rs.getString(2) + "</option>");
                                            }
                                        }
                                    } catch (Exception e) {
                                        out.println(e);
                                    }
                                %>
                            </select>
                        </div>
                    
                        <div class="form-group text-center">
                            <input class="form-control mx-auto" Style="width: 300px;" type="submit" name="btnAtualizar" value="Atualizar">
                        </div>
                    </form>
                    <br>
                    <div class="text-center">
                        <button type="button" class="btn btn-light">
                            <a class="text-dark" href="../index.jsp">Voltar</a>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

<%
    if (request.getParameter("btnAtualizar") != null) {
        String id = request.getParameter("id");
        String professor = request.getParameter("txtNomeProfessor");
        String formacao = request.getParameter("txtFormacao");
        String instituicao = request.getParameter("txtInstituicao");
        try {
            st = new Conexao().conectar().createStatement();
            st.executeUpdate("Update tbformacaoprofessor set codProfessor='" + professor + "', codFormacao='" + formacao + "', codInstituicao='" + instituicao + "' where codformacaoprofessor='" + id + "'");
            out.println("<meta http-equiv='refresh' content='0;URL=../formacaoPorfessor.jsp'>");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Formação atualizado com sucesso');");
            out.println("</script>");
        } catch (Exception e) {
            out.println(e);
        }
    } 
%>
