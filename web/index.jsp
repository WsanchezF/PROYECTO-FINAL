<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log in</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <style>
            body, html {
                height: 100%;
                margin: 0;
            }

            .bg { 
                /* The image used */
                background-image: url("imagen/main.jpg");

                /* Full height */
                height: 100%; 

                /* Center and scale the image nicely */
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
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
    <strong>Info!</strong> <%=request.getParameter("msg")%>
  </div>
  <%
                }
                
            }catch(Exception e)
            {
                
            }
            
            %>
        <div class="bg">
            <div class="container" style="width:50%;margin: auto; padding-top: 100px;color: white;">
                <h2>Auto partes</h2>
                <p>Ingrese al sistema</p>
                <form action="LogIn" class="was-validated" method="post">
                    <div class="form-group">
                        <label for="uname">usuario:</label>
                        <input type="text" class="form-control" id="uname" name="usuario" required>
                        <div class="valid-feedback">Valid.</div>   
                    </div>
                    <div class="form-group">
                        <label for="pwd">Password:</label>
                        <input type="password" class="form-control" id="pwd" name="pswd" required>
                        <div class="valid-feedback">Valid.</div>
                    </div>
                    <button type="submit" class="btn btn-primary">Ingresar</button>
                </form>
            </div>
        </div>
    </body>
</html>
