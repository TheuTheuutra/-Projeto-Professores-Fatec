<%-- 
    Document   : tipoFormacao
    Created on : 21 de abr. de 2023, 20:54:42
    Author     : Danil
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
                        <a href="index.jsp" class="nav-link" href="#">Formação</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="#">Tipo de Formação</a>
                    </li>
                    <li class="nav-item">
                        <a href="formacaoPorfessor.jsp" class="nav-link" href="#">Formação Professor</a>
                    </li>
                </ul>
            </div>
            <div class="card-body">
                <a href="Cadastrar\cadTipoFormacao.jsp" class="nav-link" href="#"><i class="bi bi-clipboard2-fill"></i> Cadastrar Tipo Formação</a>
                <a href="Editar.Excluir\ediTipoFormacao.jsp" class="nav-link" href="#"><i class="bi bi-pencil-fill"></i> Editar Tipo Formação</a>
            </div>
        </div>
    </body>
</html>

