<%-- 
    Document   : index
    Created on : 1/05/2023, 2:10:19 p. m.
    Author     : santa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Calculadora de IMC</title>
    </head>
    <body style="background-color: lightsteelblue">   
        <h2 class="text-center" >Calculadora de Indice de Masa Corporal </h2>

        <div class="text-center">
            <img src="Imagen.jpg" width="300px" height="200px" class="img-fluid" alt="Calculadora de Indice de Masa Corporal">
        </div>

        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <form class="col-sm-5" action="index.jsp" method="post">
                        <div class="form-group">
                            <label>Ingresa tu Nombre: </label>
                            <input type="text" class="form-control " name="nombreUsuario" placeholder="Nombre">                
                        </div>            
                        <div class="form-group">
                            <label>Ingresa tu Edad: </label>
                            <input type="text" class="form-control" name="edadUsuario" placeholder="Edad">                
                        </div>    
                        <div class="form-group">
                            <label>Ingresa tu peso: </label>
                            <input type="text" class="form-control" name="pesoUsuario" placeholder="Peso debe ser ingresado en kilogramos">                
                        </div>  
                        <div class="form-group">
                            <label>Ingresa tu altura: </label>
                            <input type="text" class="form-control" name="alturaUsuario" placeholder="Altura ingresada en metros x.xx metros">                
                        </div>  
                        <button type="submit" class="btn btn-primary">Calcular</button>
                    </form>
                </div>
            </div>
            <div class="container mt-5">
                <div class="row">
                    <div class="col-sm-5">
                        <div class="alert alert-secondary" role="alert">
                            <%
                                String nombre = request.getParameter("nombreUsuario");
                                String edad = request.getParameter("edadUsuario");
                                String altura = request.getParameter("alturaUsuario");
                                String peso = request.getParameter("pesoUsuario");

                                if (nombre != null && edad != null && peso != null && altura != null) {
                                    double pesoNumero = Double.parseDouble(peso);
                                    double alturaNumero = Double.parseDouble(altura);
                                    double imc = pesoNumero / (alturaNumero * alturaNumero);
                                    String cad = "";
                                    if (imc <= 18.50) {
                                        cad = " esta bajo de peso";
                                    } else if (imc <= 18.50 || imc <= 24.99) {
                                        cad = " tiene un Peso Normal";
                                    } else if (imc <= 25.00 || imc <= 29.99) {
                                        cad = " y sufre de Sobrepeso";
                                    } else if (imc <= 30.00 || imc <= 34.99) {
                                        cad = " y sufre de Obesidad: Tipo I";
                                    } else if (imc <= 35.00 || imc <= 40.00) {
                                        cad = " y sufre Obesidad: Tipo II";
                                    } else {
                                        cad = "no existe clasificacion";
                                    }
                                    String saludo = ("El nombre ingresado es: " + nombre + ", cuya edad es: " + edad
                                            + " años, <br> con un peso de " + peso + " kilos y una altura de " + altura
                                            + " centimetros, tiene un indice de masa corporal de " + imc + " ," + cad);
                                    out.println(saludo);
                                } else {
                                    out.println("Esperando datos");
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
