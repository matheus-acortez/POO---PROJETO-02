<%-- 
    Document   : amortizacao-americana
    Created on : Aug 27, 2019, 1:32:57 AM
    Author     : cortez
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
        <title>Amortização Americana</title>
    </head>
    <body>
        <div class="container">
            <%@include file="WEB-INF/jspf/header.jspf"%>
            <%@include file="WEB-INF/jspf/menu.jspf"%>
        
         <%
            DecimalFormat df = new DecimalFormat("#.##");
            double periodo = 0;
            double valor = 0;
            double juros = 0;
            double prestacao = 0;
            double juros_periodo = 0;
            double amortizacao = 0;
           
            try {
                periodo = Double.parseDouble(request.getParameter("periodo"));
                valor = Double.parseDouble(request.getParameter("valor"));
                juros = Double.parseDouble(request.getParameter("juros"));
                
            } catch (Exception e) {
            }
        %>
            
        <div class="card">
            <div class="card-header">
                Amortização Americana
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
                  <label for="valorLabel" class="col-sm-2 col-form-label">Valor (R$)</label>
                  <div class="col-sm-3">
                    <input type="number" name="valor" class="form-control" id="valorLabel" placeholder="Digite o valor.">
                  </div>
                </div>
                <div class="form-group row">
                  <label for="jurosLabel" class="col-sm-2 col-form-label">Juros (%a.m)</label>
                  <div class="col-sm-3">
                    <input type="number" name="juros" class="form-control" id="jurosLabel" placeholder="Insira o juros. Ex: 10%">
                  </div>
                </div>
                <input class="btn btn-primary" type="submit" value="Calcular">
            </form>
            </div>
            <table class="table table-striped table-dark">
                <thead>
                  <tr>
                    <th scope="col">Nº Parcelas</th>
                    <th scope="col">Amortização (R$)</th>
                    <th scope="col">Juros (R$)</th>
                    <th scope="col">Total a pagar (R$)</th>
                  </tr>
                </thead>
                <tbody>
  
            <%for(int i=1; i<= periodo; i++){%>
                     
                              <%
                                prestacao = valor * juros/100;
                                juros_periodo = prestacao;
                              
                              if(periodo==i){
                                  
                                  amortizacao = valor;
                                  prestacao = 0;
                              }
                              
                              %>
                      
                           <tr>
                      <td> <%=i%></td>
                      <td> <%= df.format(amortizacao) %> </td>
                      <td> <%= df.format(juros_periodo) %> </td>
                      <td> <%= df.format(prestacao) %> </td>
                      
                      
                           </tr>
                          

                        <%}%>
        </tbody>
                
              </table>

            
        </div>
            
        </div>
          <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
          <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <%@include file="WEB-INF/jspf/footer.jspf"%>
    </body>
</html>
