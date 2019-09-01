<%-- 
    Document   : tabela-price
    Created on : Aug 27, 2019, 1:34:32 AM
    Author     : josrope
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="estilo.css">
        <title>Tabela Price</title>
    </head>
    <body>
        <div class="container">
            <%@include file="WEB-INF/jspf/header.jspf"%>
            <%@include file="WEB-INF/jspf/menu.jspf"%>
        
         <%
            DecimalFormat df = new DecimalFormat("##,###.##");
            double periodo = 0;
            double valorFinanciado = 0;
            double valorPrestacao = 0;
            double juros = 0;
            double juros_periodo = 0;
            double amortizacao = 0;
            double totalValorPrestacao = 0;
            double totalValorAmortizacao = 0;
            
            try {
                periodo = Double.parseDouble(request.getParameter("periodo"));
                valorFinanciado = Double.parseDouble(request.getParameter("valorFinanciado"));
                valorPrestacao = Double.parseDouble(request.getParameter("valorPrestacao"));
                juros = Double.parseDouble(request.getParameter("juros")) / 100;
                
            } catch (Exception e) {
            }
        %>
            
        <div class="card">
            <div class="card-header">
                Tabela Price
            </div>
            <div class="card-body">
                <form>
                    <div class="form-group row">
                      <label for="periodoLabel" class="col-sm-2 col-form-label">Período</label>
                      <div class="col-sm-3">
                        <input type="number" name="periodo" class="form-control" id="periodoLabel" placeholder="Período em meses">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="valorFinanciado" class="col-sm-2 col-form-label">Valor Financiado (R$)</label>
                      <div class="col-sm-3">
                        <input type="number" name="valorFinanciado" class="form-control" id="valorFinanciado" placeholder="Digite o valor financiado.">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="valorPrestacao" class="col-sm-2 col-form-label">Valor Prestação (R$)</label>
                      <div class="col-sm-3">
                        <input type="number" step="0.1" name="valorPrestacao" class="form-control" id="valorPrestacao" placeholder="Digite o valor da prestação.">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="jurosLabel" class="col-sm-2 col-form-label">Juros (%a.m)</label>
                      <div class="col-sm-3">
                        <input type="number" step="0.1" name="juros" class="form-control" id="jurosLabel" placeholder="Insira o juros. Ex: 10%">
                      </div>
                    </div>
                    <input class="btn btn-primary" type="submit" value="Calcular">
                </form>
            </div>
            <table class="table table-striped table-dark">
                <thead>
                  <tr>
                    <th scope="col">Nº Parcelas</th>
                    <th scope="col">Total a pagar (Prestação) (R$)</th>
                    <th scope="col">Amortização (R$)</th>
                    <th scope="col">Juros (R$)</th>
                    <th scope="col">Saldo Devedor (R$)</th>
                  </tr>
                </thead>
                <tbody>
                <%
                    for(int i=1; i<= periodo; i++){
                        
                      juros_periodo = valorFinanciado * juros;
                      amortizacao = valorPrestacao - juros_periodo;
                      valorFinanciado = valorFinanciado - amortizacao;
                      totalValorPrestacao = totalValorPrestacao + valorPrestacao;
                      totalValorAmortizacao = totalValorAmortizacao + amortizacao;
                %>

                    <tr>
                        <td> <%=i%></td>
                        <td> <%= df.format(valorPrestacao) %> </td>
                        <td> <%= df.format(amortizacao) %> </td>
                        <td> <%= df.format(juros_periodo) %> </td>
                        <td> <%= valorFinanciado > 0 ? df.format(valorFinanciado) : "0,00" %> </td>      
                    </tr>
                          

                <%}%>
                </tbody>
                <tfoot>
                    <tr>
                        <th> Total  </th>
                        <td> <%= df.format(totalValorPrestacao) %> </td>
                        <td> <%= df.format(totalValorAmortizacao) %> </td>
                        <td> - </td>
                        <td> - </td>
                    </tr>
                </tfoot>
             </table>
            </div>
        </div>
          <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
          <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <%@include file="WEB-INF/jspf/footer.jspf"%>
    </body>
</html>

