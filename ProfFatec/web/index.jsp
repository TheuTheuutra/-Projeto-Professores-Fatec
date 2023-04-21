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
    </head>
    <body>


        <div class="container text-center">
            <div class="row align-items-center">
                <div class="col">
                    Formação
                </div>
                <div class="col">
                    Tipo de Formação
                </div>

            </div>
            <div class="row">
                <div class="card border-secondary mb-3" >
                    <div class="card-header">Formação dos Professores</div>
                    <div class="card-body text-secondary">
                        <h5 class="card-title"></h5>
                        <p class="card-text"></p>


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


                    </div>
                </div>
            </div>

        </div>


    </body>
</html>
