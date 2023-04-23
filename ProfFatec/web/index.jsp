<%-- 
    Document   : index.jsp
    Created on : 21 de abr. de 2023, 18:59:22
    Author     : mathe
--%>

<%@page import="javax.swing.JOptionPane"%>
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
        <title>Formação</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script>
            const urlParams = new URLSearchParams(window.location.search);
            document.onreadystatechange = () => {
                if (document.readyState == 'complete') {
                    if (urlParams.get('id') != null) {
                        $("#exampleModal").modal({
                            show: true
                        })
                    }
                    ;
                }
                ;
            };
        </script>

    </head>
    <body>








        <div class="container text-center">
            <div class="row">

                <div class="col">

                    <div class="card ">
                        <div class="card-header">


                            <ul class="nav nav-tabs card-header-tabs">
                                <li class="nav-item">
                                    <a class="nav-link active">Formação do Professor</a>
                                </li>
                                <li class="nav-item">
                                    <a href="./tipoFormacao.jsp" class="nav-link">Tipo de Formação</a>
                                </li>
                                <li class="nav-item">
                                    <a href="./formacao.jsp" class="nav-link">Formação</a>
                                </li>
                            </ul>

                        </div>
                        <div class="card-body">


                            <div class="row">
                                <div class="col-sm-5 col-md-6" style="text-align: left">
                                    <a href="./Cadastrar\cadFormacaoProfessor.jsp" class="btn btn-success"><i class="bi bi-clipboard2-fill"></i> Cadastrar Formação</a>

                                </div>

                                <div class="col-sm-5 offset-sm-2 col-md-6 offset-md-0">
                                    <form class="form-inline text-center" method="post">

                                        <div class="input-group mb-3">
                                            <select type="text" class="form-select" name="txtBuscaFormacaoProfessor" aria-label="Recipient's username" aria-describedby="button-addon2" required>
                                                <option>Selecione o Professor</option>
                                                <%
                                                    try {
                                                        st = new Conexao().conectar().createStatement();
                                                        rs = st.executeQuery("SELECT * from tbprofessor");
                                                        while (rs.next()) {
                                                            if (rs.getString(5).equals("1")) {
                                                                out.println("<option value='" + rs.getString(2) + "'>" + rs.getString(2) + "</option>");
                                                            }
                                                        }
                                                    } catch (Exception e) {
                                                        out.println(e);
                                                    }
                                                %>
                                            </select>
                                            <button data-bs-toggle="modal" data-bs-target="#exampleModal" class="btn btn-outline-secondary" type="button" name="btnBuscaFormacaoProfessor" id="button-addon2"><i class="bi bi-search"></i></button>
                                        </div>


                                    </form>



                                </div>

                            </div>





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
                                                out.println("<td><a href='./Editar.Excluir/ediFormacaoProfessor.jsp?funcao=editar&id=" + rs.getString(1) + "' class='btn btn-primary'><i class='bi bi-pencil-fill'></i></a></td>");
                                                out.println("<td><a href='./Editar.Excluir/ediFormacaoProfessor.jsp?funcao=excluir&id=" + rs.getString(1) + "' class='btn btn-danger'><i class='bi bi-x-lg'></i></a></td></tr>");
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









        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Busca de Formação dos Professores</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <%
                            // ------------------ BUSCAR FORMAÇÃO DO PROFESSOR ------------------------
                            if (request.getParameter("btnBuscaFormacaoProfessor") != null) {
                                String busca = request.getParameter("txtBuscaFormacaoProfessor");
                                try {
                                    st = new Conexao().conectar().createStatement();
                                    rs = st.executeQuery("Select tbprofessor.nomeProfessor, tbformacao.nomeFormacao, tbTipoFormacao.formacao, tbinstituicao.nomeInstituicao from tbFormacaoprofessor inner join tbformacao on tbFormacaoprofessor.codFormacao = tbformacao.codFormacao inner join tbTipoFormacao on tbFormacao.codTipoFormacao = tbTipoFormacao.codTipoFormacao inner join tbprofessor on tbprofessor.codProfessor = tbFormacaoprofessor.codProfessor inner join tbinstituicao on tbinstituicao.codInstituicao = tbFormacaoprofessor.codInstituicao where tbprofessor.nomeProfessor like '%" + busca + "%' ORDER BY nomeFormacao ASC");

                                    out.println("<table class='table table-bordered border-primary' style='width:100%'>");
                                    out.println("<h6 class='card-title'>Formação(ões) do(a) Professor(a) " + busca + "</h6>");
                                    out.println("<thead><tr><th  scope='col'>Formação</th><th scope='col'>Tipo</th><th scope='col'>Instituição</th><th  scope='col'>Editar</th></tr></thead>");
                                    out.println("<tbody>");
                                    while (rs.next()) {
                                        out.println("<td>" + rs.getString(2) + "</td>");
                                        out.println("<td>" + rs.getString(3) + "</td>");
                                        out.println("<td>" + rs.getString(4) + "</td>");
                                        out.println("<td><a href='../Editar.Excluir/ediFormacaoProfessor.jsp?funcao=editar&id=" + rs.getString(1) + "' class='btn btn-primary'><i class='bi bi-pencil-fill'></i></a></td></tr>");
                                    }
                                    out.println("</tbody></table>");
                                    //out.println("<a href='./cadFormacaoProfessor.jsp' class='btn btn-danger text-light'><i class='bi bi-x-circle-fill'></i>  Cancelar Busca</a>");
                                } catch (Exception e) {
                                    out.println(e);
                                }
                            }
                        %>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <!--button type="button" class="btn btn-primary">Save changes</button-->
                    </div>
                </div>
            </div>
        </div>                           




    </body>
</html>
