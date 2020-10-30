<%@page import="java.sql.ResultSet"%>
<%@page import="modelo.Conexion"%>
<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestiones Cliente</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <style>
            a{
                text-decoration: none;
                color:white;
            }
            a:hover {
                text-decoration: none;
                color:black;
            }
        </style>
    </head>
    <body>
         <%
            
            try{
                
                if(request.getParameter("msg")!=null)
                { %>
                      <div style="margin:0;" class="alert alert-info alert-dismissible">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <strong>Info!</strong> <%= request.getParameter("msg") %>
  </div>
  <%
                }
                
            }catch(Exception e)
            {
                
            }
            
            %>
        <%
            //validar si la sesion se ha iniciado con el objeto USUARIO
            //de no haber iniciado se redirijira a la pagina de LOG IN
            Usuario temp = null;
            if (request.getSession().getAttribute("usuario_uso") == null) {
                response.sendRedirect("index.jsp?msg='invalido'");
            } else {
                temp = (Usuario) request.getSession().getAttribute("usuario_uso");
            }
        %>


        <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link">Auto Partes</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link">Usuario: <%= temp.getUsuario()%></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link">Nombre: <%= temp.getNombre()%></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="menu.jsp">Regresar</a>
                </li>
            </ul>
        </nav>

        <br>
        
        <div class="container">
   
  <br>
  <br>
  <br>
  <div class="container">
  <h2>Clientes</h2>
  Filtrar por: <select id="myInput" onchange="myFunction();">
      <option value="al">Todo</option>
  <option value="Individual">Individual</option>
  <option value="Empresarial">Empresarial</option>
</select>
  <table id="myTable" class="table table-hover">
    <thead>
        <%
          Conexion con = new Conexion();
          ResultSet clientes = con.getTablaData("cliente");
            %>
      <tr>
        <th>Id</th>
        <th>nombre</th>
        <th>apellido</th>
        <th>nit</th>
        <th>tipo</th>
        <th>dpi</th>
        <th>contacto</th>
        <th>descuento</th>
    </thead>
    <tbody>
        
        <% while(clientes.next()){%>
        
      <tr>
          <td><%= clientes.getString(1) %></td>
          <td><%= clientes.getString(2) %></td>
          <td><%= clientes.getString(3) %></td>
          <td><%= clientes.getString(4) %></td>
          <td><%= clientes.getString(5) %></td>
          <td><% if(clientes.getString(6)==null){}else{out.print(clientes.getString(6));} %></td>
          <td><% if(clientes.getString(7)==null){}else{out.print(clientes.getString(7));} %></td>
          <td><% if(clientes.getString(8)==null){}else{out.print(clientes.getString(8));} %></td>
      </tr>
      
      <% } %>
      
    </tbody>
  </table>
</div>
  
  
</div>
<script>
function myFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[4];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>
        

    </body>
</html>
