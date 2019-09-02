<%-- 
    Document   : home
    Created on : Aug 27, 2019, 1:33:49 AM
    Author     : cortez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="estilo.css">
        <title>Cálculo de Amortização</title>
    </head>
    <body>
        <div class="container">
            <%@include file="WEB-INF/jspf/header.jspf"%>
            <%@include file="WEB-INF/jspf/menu.jspf"%>
            <div id="accordion" class="amort">
                <div class="card">
                    <div class="card-header" id="headingOne" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                        <h5 class="mb-0 text-secondary">Método Americano de Amortização</h5>
                    </div>
                    <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
                        <div class="card-body">
                            <p class="card-text">O Sistema Americano de Amortização é um tipo de quitação de empréstimo que favorece 
                                aqueles que desejam pagar o valor principal através de uma única parcela, porém os juros devem ser pagos 
                                periodicamente ou, dependendo do contrato firmado entre as partes, os juros são capitalizados e pagos junto 
                                ao valor principal.</p>
                            <a href="amortizacao-americana.jsp" class="btn btn-primary">Calcular</a>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="card-header" id="headingTwo" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                        <h5 class="mb-0 text-secondary"> Método Amortização Constante</h5>
                    </div>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
                        <div class="card-body">
                            <p class="card-text">No sistema constante, as instituições financeiras oferecem um capital que deverá ser devolvido com juros durante o período pré-determinado. As formas de quitar o empréstimo são inúmeras, vamos abordar o funcionamento do sistema de amortizações constantes, que consiste no pagamento da dívida baseada em parcelas de amortizações iguais com prestações e juros decrescentes..</p>
                            <a href="amortizacao-contante.jsp" class="btn btn-primary">Calcular</a>
                        </div>
                    </div>
                </div>            
                <div class="card">
                    <div class="card-header" id="headingThree" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                      <h5 class="mb-0 text-secondary">Método Tabela Price </h5>
                    </div>
                    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
                      <div class="card-body">
                          <p>Nesse modelo de pagamento do financiamento, as primeiras prestações são compostas, na maior parte, por juros. Progressivamente, enquanto as parcelas vão avançando, os valores de amortização dentro das prestações aumentam — e os juros diminuem. No entanto, o preço das mensalidades continua sempre o mesmo, da primeira à última, apenas tendo suas composições alteradas.</p>
                          <a href="tabela-price.jsp" class="btn btn-primary">Calcular</a>
                      </div>
                    </div>
                </div>
              </div>
            <%@include file="WEB-INF/jspf/time.jspf"%>
            
            
        </div>
          <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
          <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <%@include file="WEB-INF/jspf/footer.jspf"%>
    </body>
</html>
