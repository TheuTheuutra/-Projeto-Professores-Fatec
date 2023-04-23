<%-- 
    Document   : ediFormacao
    Created on : 21 de abr. de 2023, 19:15:15
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
                    <div class="card border-secondary mb-3">

                        <div class="card-header">Editar Formação</div>
                        <div class="card-body text-secondary">
                            <div class="container text-center">
                                <div class="row align-items-start">
                                    <div class="col-sm-5 col-md-6">
                                        <%
                                            String nomeFormacao = null;
                                            String codFormacao = null;
                                            String tipoFormacao = null;

                                            if (request.getParameter("funcao") != null && request.getParameter("funcao").equals("editar")) {
                                                String valorID = request.getParameter("id");
                                                st = new Conexao().conectar().createStatement();
                                                try {
                                                    rs = st.executeQuery("Select  f.nomeFormacao, t.codTipoFormacao, t.formacao from tbformacao f,tbtipoformacao t where codformacao='" + valorID + "' and f.codTipoFormacao = t.codTipoFormacao");

                                                    while (rs.next()) {
                                                        nomeFormacao = rs.getString(1);
                                                        codFormacao = rs.getString(2);
                                                        tipoFormacao = rs.getString(3);

                                                    }
                                                } catch (Exception e) {
                                                    out.println(e);
                                                }
                                            } else if (request.getParameter("funcao") != null && request.getParameter("funcao").equals("excluir")) {

                                                try {
                                                    String id = request.getParameter("id");
                                                    st = new Conexao().conectar().createStatement();
                                                    st.executeUpdate("Delete from tbformacao where codFormacao='" + id + "'");
                                                    out.println("<meta http-equiv='refresh' content='0;URL=../Cadastrar/cadFormacao.jsp'>");
                                                    out.println("<script type=\"text/javascript\">");
                                                    out.println("alert('Tipo de formação excluído com sucesso');");
                                                } catch (Exception e) {
                                                    out.println("<script type=\"text/javascript\">");
                                                    out.println("alert('Não é possivel excluir formação, tente excluir uma formação do professor ligada a essa formação e tente novamente.');");
                                                    out.println("</script>");
                                                    out.println("<meta http-equiv='refresh' content='0;URL=../Cadastrar/cadFormacao.jsp'>");

                                                }
                                            }
                                        %>


                                        <form action="" method="post" id="editar">
                                            <div class="form-group text-center">
                                                <label class="text-light">Formação:</label><br>
                                                <input class="form-control form-control-lg mb-3" type="text" name="txtformacao" value="<%=nomeFormacao%>"><br>
                                            </div>
                                            <select  name="txttipoformacao" class="form-select form-select-lg mb-3"><br>
                                                <option value="<%=codFormacao%>"><%=tipoFormacao%></option>
                                                <%
                                                    try {
                                                        st = new Conexao().conectar().createStatement();
                                                        rs = st.executeQuery("Select * from tbTipoFormacao");
                                                        while (rs.next()) {
                                                            if (rs.getString(2).equals(tipoFormacao) != true) {
                                                                out.println("<option value=" + rs.getString(1) + ">" + rs.getString(2) + "</option>");
                                                            }
                                                        }
                                                    } catch (Exception e) {
                                                        out.println(e);
                                                    }
                                                %>
                                            </select>
                                            <div class="form-group text-center">
                                                <input class="btn btn-success" type="submit" name="btnAtualizar" value="Atualizar">
                                                <a href='../formacao.jsp' class='btn btn-danger text-light'><i class='bi bi-x-circle-fill'></i>  Cancelar</a>
                                            </div>
                                        </form>

                                    </div> 
                                    <div class="col-sm-5 offset-sm-2 col-md-6 offset-md-0"></div>     
                                </div>
                            </div>
                        </div><!-- comment -->
                    </div>
                </div>
            </div>
        </div><!-- comment -->    
    </body>
</html>



<%
    if (request.getParameter("btnAtualizar") != null) {
        String id = request.getParameter("id");
        String formacao = request.getParameter("txtformacao");
        String tipoformacao = request.getParameter("txttipoformacao");
        try {
            st = new Conexao().conectar().createStatement();
            st.executeUpdate("Update tbformacao set nomeFormacao='" + formacao + "' , codTipoFormacao = '" + tipoformacao + "' where codformacao='" + id + "'");
            out.println("<meta http-equiv='refresh' content='0;URL=../index.jsp'>");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Formação atualizado com sucesso');");
            out.println("</script>");
        } catch (Exception e) {
            out.println(e);
        }
    }
%>

