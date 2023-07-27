<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Lab6.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Registro Alumno</title>
    <style>
        h2{
            text-align: center;
        }
        body {
            background-image: url("https://i.pinimg.com/originals/10/24/bd/1024bda12ba9fe9a4eb34e600fbeef8f.jpg");
            width: 100%;
            background-size: 100%;
        }
        .container {
           
            color: white;
            padding: 20px;
            border-radius: 10px;
        }

        .form-control {
            background-color:#A589DE;
            color: white;
        }

        .btn-success {
            background-color: #551FC6;
            border-color: #551FC6;
        }

        .btn-success:hover {
            background-color: #8958EE;
            border-color: #1e7e34;
        }

        .btn-warning {
            background-color: #C0A8F1;
            border-color: #C0A8F1;
        }

        .btn-warning:hover {
            background-color: #e0a800;
            border-color: #d39e00;
        }
        input[type="text"]{
            background-color: #A589DE ;
            border: 2px solid #BAA4E8;  
        }
        input[type="radio"]{
            border: 2px solid #BAA4E8;
        }
        select[id="city"]{
            background-color:#A589DE;
            border: 2px solid #BAA4E8;
        }
        textarea[id="requerimentos"]{
            border: 2px solid #BAA4E8;
        }


    </style>
    <script type="text/javascript">
        function limpiar_contenido() {
            var vacio = "";
            document.getElementById("nombre").value = vacio;
            document.getElementById("apellido").value = vacio;
            document.getElementById("sexo_masculino").checked = false;
            document.getElementById("sexo_femenino").checked = false;
            document.getElementById("email").value = vacio;
            document.getElementById("direccion").value = vacio;
            document.getElementById("city").value = 0;
            document.getElementById("requerimentos").value = vacio;
            return false;
        }
    </script>
    <script type="text/javascript">
        function verificar_contenido()
        {
            var vacio = "";
 
            var regex1 = /^[a-zA-ZñÑ\s]+$/;
            if (document.getElementById("nombre").value == vacio) {
                alert("Necesita colocar un Nombre");
                return false;
            }
            if (!regex1.test(document.getElementById("nombre").value)) {
                alert("En el campo de Nombre no pueden ir números o caracteres especiales");
                return false;
            }
            if (document.getElementById("apellido").value == vacio) {
                alert("Necesita colocar un Apellido");
                return false;
            }
            if (!regex1.test(document.getElementById("apellido").value)) {
                alert("En el campo de Apellido no pueden ir números o caracteres especiales");
                return false;
            }
            if (document.getElementById("sexo_masculino").checked == false && document.getElementById("sexo_femenino").checked == false) {
                alert("Necesita marcar un Sexo");
                return false;
            }
            if (document.getElementById("sexo_masculino").checked == true && document.getElementById("sexo_femenino").checked == true) {
                alert("Necesita marcar un Sexo");
                document.getElementById("sexo_masculino").checked = false;
                document.getElementById("sexo_femenino").checked = false;
                return false;
            }
            var Email = document.getElementById("email").value;
            if (Email.endsWith("@unsa.edu.pe")) {
                var antes = Email.indexOf("@");
                if (antes == -1 || antes != Email.indexOf("@unsa.edu.pe")) {
                    alert("Tiene que ingresar un Email con el dominio @unsa.edu.pe");
                    return false;
                }
            }
            else {
                alert("Tiene que ingresar un Email con el dominio @unsa.edu.pe");
                return false;
            }
            if (document.getElementById("city").value == "Eliga una opcion...") {
                alert("Seleccione una Ciudad");
                return false;
            }
            var fecha = new Date();
            alert("Registro del Alumno correcto, " + fecha);
        }
        function callAjax() {
            let send1 = $("#nombre").val();
            let send2 = $("#apellido").val();
            $.ajax({
                url: 'WebForm1.aspx/ValidarAlumno',
                type: 'POST',
                async: true,
                data: '{ "nom" : "' + send1 + '", "ape" : "' + send2 + '"}',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: exito
            });
            return false;
        }
        function exito(data) {
            var returnS = data.d;
            if (returnS == false)
            {
                alert("Correcto");
                $("#Button2").prop('disabled', false)
            }
            else
            {
                alert("Alumno Registrado");
                $("#Button2").prop('disabled',true)
            }
                
            return false;
        }
    </script>
</head>
<body>
    <div class="container">
    <h2>Registro de Alumnos</h2>
    <form id="form1" runat="server" class="container">
        <div class="mb-3 row">
            <label for="nombres" class="col-sm-2 col-form-label">Nombres:</label>
            <div class="col-sm-10">
                <asp:TextBox ID="nombre" runat="server" class="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="mb-3 row">
            <label for="apellidos" class="col-sm-2 col-form-label">Apellidos:</label>
            <div class="col-sm-10">
                <asp:TextBox ID="apellido" onBlur="return callAjax()" runat="server" class="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="mb-3 row">
            <label class="col-sm-2 col-form-label">Sexo:</label>
            <div class="col-sm-10">
                <div class="form-check">
                    <asp:RadioButton ID="sexo_masculino" runat="server" value="masculino"/>
                    <label class="form-check-label">Masculino</label>
                </div>
                <div class="form-check">
                    <asp:RadioButton ID="sexo_femenino" runat="server" value="femenino"/>
                    <label class="form-check-label">Femenino</label>
                </div>
            </div>
        </div>
        <div class="mb-3 row">
            <label for="email" class="col-sm-2 col-form-label">Email:</label>
            <div class="col-sm-10">
                <div class="input-group flex-nowrap">
                    <span class="input-group-text" id="addon-wrapping">@</span>    
                    <asp:TextBox ID="email" runat="server" class="form-control"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="mb-3 row">
            <label for="direccion" class="col-sm-2 col-form-label">Dirección:</label>
            <div class="col-sm-10">
                <asp:TextBox ID="direccion" runat="server" class="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="mb-3 row">
            <label for="city" class="col-sm-2 col-form-label">Ciudad:</label>
            <div class="col-sm-10">
                <asp:DropDownList  ID="city" class="form-select" runat="server"> 
                </asp:DropDownList>
            </div>
        </div>
        <div class="mb-3 row">
            <label for="requerimentos" class="col-sm-2 col-form-label">Requerimentos:</label>
            <div class="col-sm-10">
                <asp:TextBox ID="requerimentos" runat="server" TextMode="MultiLine" rows="5" cols="30" class="form-control"></asp:TextBox>
            </div>
        </div>
            <div class="mb-3 text-center">
                <asp:Button ID="Button1" runat="server" Text="Limpiar" OnClientClick="return limpiar_contenido();" class="btn btn-success"/>
                <asp:Button ID="Button2" runat="server" Text="Enviar" OnClientClick="return verificar_contenido();" class="btn btn-success btn-lg" OnClick="ButtonEnviar_Click"/>

            </div>
        <div class="mb-3 row">
            <div class="col-sm-10">
                <asp:TextBox ID="informacion" runat="server" rows="5" class="form-control" TextMode="MultiLine" Visible="false"></asp:TextBox>
            </div>
        </div>
    </form>
    </div>
</body>
</html>