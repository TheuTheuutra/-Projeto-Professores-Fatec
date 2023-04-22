<%-- 
    Document   : ediFormacao
    Created on : 21 de abr. de 2023, 19:15:15
    Author     : mathe
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.mysql.jdbc.Driver"%>
<%@ page import="config.Conexao"%>

<%
Statement st = null;
ResultSet rs = null;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Formação</title>
    </head>
    <body>
        <h1>Editar Formação</h1>
        <%
            String nomeFormacao = null;
            String codFormacao = null;
            String tipoFormacao = null;
            
             if(request.getParameter("funcao")!=null && request.getParameter("funcao").equals("editar")){
            String valorID = request.getParameter("id");
            st = new Conexao().conectar().createStatement();
            try{
                rs = st.executeQuery("Select  f.nomeFormacao, t.codTipoFormacao, t.formacao from tbformacao f,tbtipoformacao t where codformacao='"+ valorID +"' and f.codTipoFormacao = t.codTipoFormacao");
                
                while(rs.next()){
                    nomeFormacao = rs.getString(1);
                    codFormacao = rs.getString(2);
                    tipoFormacao = rs.getString(3);
                                              
                }
            }catch(Exception e){
                out.println(e);
            }
          }
          %>
          
          
          <form action="" method="post" id="editar">
        <div class="form-group text-center">
        <label class="text-light">Formação:</label><br>
        <input class="form-control mx-auto" Style="width: 300px;" type="text" name="txtformacao" value="<%=nomeFormacao %>"><br>
        </div>
        <select  name="txtformacao"><br>
        <option value="<%=codFormacao %>"><%=tipoFormacao %></option>
        <%
            try{
                st = new Conexao().conectar().createStatement();
                rs = st.executeQuery("Select * from tbTipoFormacao");
                while(rs.next()){
                    if(rs.getString(3).equals(tipoFormacao)!=true){
                        out.println("<option value="+rs.getString(2)+">"+rs.getString(3)+"</option>");
                    }
                }
            }catch(Exception e){
                out.println(e);
            }
        %>
        </select>



        <br>
        <div class="form-group text-center">
        <input class="form-control mx-auto" Style="width: 300px;" type="submit" name="btnAtualizar" value="Atualizar">
        </div>
    </form>
    <br>
    <div class="text-center">
        <button type="button" class="btn btn-light">
        <a class="text-dark" href="index.jsp">Voltar</a>
        </button>
        </div>
            
    </body>
</html>



<% 
    
    if(request.getParameter("btnAtualizar")!=null){
        String id = request.getParameter("id");
        String formacao = request.getParameter("txtformacao");
        try{
            st = new Conexao().conectar().createStatement();
            st.executeUpdate("Update tbformacao set Formacao='" + formacao + "'where codformacao='" + id + "'");
            out.println("<meta http-equiv='refresh' content='0;URL=listEsp.jsp'>");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Formação atualizado com sucesso');");
            out.println("</script>");
        }catch(Exception e){
            out.println(e);
        }
    }
%>

