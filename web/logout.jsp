<%
     //jsp para cerrar la session
     //validar si hay una session activa
     //si lo hay se pedira esa session
     //invalidaremos la sesion usando el metodo invalidate()
     //redireccionaremos al usuario a la pagina de log in con un mensaje de log out
            if (request.getSession().getAttribute("usuario_uso") != null) {
                session=request.getSession();
                session.invalidate();
                response.sendRedirect("index.jsp?msg='Gracias por utilizar el sistema AutoPartes sesion cerrada'");
                
            } 
    

%>
