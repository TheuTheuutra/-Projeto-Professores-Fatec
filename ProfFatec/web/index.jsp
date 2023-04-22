<%-- 
    Document   : index.jsp
    Created on : 21 de abr. de 2023, 18:59:22
    Author     : mathe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
    </head>
    <body>
        <div class="card text-center">
            <div class="card-header">
                <ul class="nav nav-tabs card-header-tabs">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">Formação</a>
                    </li>
                    <li class="nav-item">
                        <a href="tipoFormacao.jsp" class="nav-link" href="#">Tipo de Formação</a>
                    </li>
                    <li class="nav-item">
                        <a href="formacaoPorfessor.jsp" class="nav-link" href="#">Formação Professor</a>
                    </li>
                </ul>
            </div>
            <div class="card-body">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Professor</th>
                            <th scope="col">Formação</th>
                            <th scope="col">Tipo de Formação</th>
                            <th scope="col">Instituição</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>Mark</td>
                            <td>Otto</td>
                            <td>@mdo</td>
                        </tr>
                        <tr>
                            <th scope="row">2</th>
                            <td>Jacob</td>
                            <td>Thornton</td>
                            <td>@fat</td>
                        </tr>
                        <tr>
                            <th scope="row">3</th>
                            <td colspan="2">Larry the Bird</td>
                            <td>@twitter</td>
                        </tr>
                    </tbody>
                </table>
                <a href="Cadastrar\cadFormacao.jsp" class="nav-link" href="#"><i class="bi bi-clipboard2-fill"></i> Cadastrar Formação</a>
                <a href="Editar.Excluir\ediFormacao.jsp" class="nav-link" href="#"><i class="bi bi-pencil-fill"></i> Editar Formação</a>
            </div>
        </div>
    </body>
</html>
