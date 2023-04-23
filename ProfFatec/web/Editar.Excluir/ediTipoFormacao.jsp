<%-- 
    Document   : ediTipoFormacao
    Created on : 21 de abr. de 2023, 20:13:23
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

                    <h1>Editar Formação</h1>
                    <%
                        String codTipoFormacao = null;
                        String Formacao = null;

                        if (request.getParameter("funcao") != null && request.getParameter("funcao").equals("editar")) {
                            String valorID = request.getParameter("id");
                            st = new Conexao().conectar().createStatement();
                            try {
                                rs = st.executeQuery("Select * from tbtipoformacao where codTipoFormacao ='" + valorID + "'");

                                while (rs.next()) {

                                    Formacao = rs.getString(2);

                                }
                            } catch (Exception e) {
                                out.println(e);
                            }
                        } else if (request.getParameter("funcao") != null && request.getParameter("funcao").equals("excluir")) {

                            try {
                                String id = request.getParameter("id");
                                st = new Conexao().conectar().createStatement();
                                st.executeUpdate("Delete from tbtipoformacao where codTipoFormacao='" + id + "'");
                                out.println("<meta http-equiv='refresh' content='0;URL=../Cadastrar/cadTipoFormacao.jsp'>");
                                out.println("<script type=\"text/javascript\">");
                                out.println("alert('Tipo de formação excluído com sucesso');");
                            } catch (Exception e) {
                                out.println("<script type=\"text/javascript\">");
                                out.println("alert('Não é possivel excluir tipo de formação, tente excluir uma formação ligada a seu esse tipo e tente novamente.');");
                                out.println("</script>");
                                out.println("<meta http-equiv='refresh' content='0;URL=../Cadastrar/cadTipoFormacao.jsp'>");

                            }
                        }
                    %>


                    <form action="" method="post" id="editar">
                        <label value="<%=codTipoFormacao%>">Tipo de formação atual: <%=Formacao%></label>
                        <div class="form-group text-center">
                            <label class="text-dark">Tipo de formação novo:</label><br>
                            <input class="form-control mx-auto" Style="width: 300px;" type="text" name="txtformacao" value="<%=Formacao%>"><br>
                        </div>
                        <br>
                        <div class="form-group text-center">
                            <input class="form-control mx-auto" Style="width: 300px;" type="submit" name="btnAtualizar" value="Atualizar">
                        </div>
                    </form>
                    <br>
                    <div class="text-center">
                        <button type="button" class="btn btn-light">
                            <a class="text-dark" href="../index.jsp">Voltar</a>
                        </button>
                    </div><!-- </div> -->
                </div>
            </div>
        </div><!-- comment -->    
    </body>
</html>



<%
    if (request.getParameter("btnAtualizar") != null) {
        String id = request.getParameter("id");
        String formacao = request.getParameter("txtformacao");

        try {
            st = new Conexao().conectar().createStatement();
            st.executeUpdate("Update tbtipoformacao set formacao='" + formacao + "' where codTipoFormacao='" + id + "'");
            out.println("<meta http-equiv='refresh' content='0;URL=../tipoFormacao.jsp'>");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Formação atualizado com sucesso');");
            out.println("</script>");
        } catch (Exception e) {
            out.println(e);
        }
    }


%>