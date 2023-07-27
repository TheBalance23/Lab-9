<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Auxiliar.aspx.cs" Inherits="Lab6.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script type="text/javascript">
        function InformacionCookies() {
            var vacio = "";
            vacio = document.cookie;
            document.getElementById("TextGalleta").value = "user info: "+ vacio;
            return false;
        }
        function callAjax() {
            let send = $('#TextGalleta').val();
            $.ajax({
                url:'Auxiliar.aspx/getInformacion',
                type:'POST',
                async: true,
                data:'{ valor: "' + send + '"}',
                dataType:"json",
                contentType:"application/json; charset=utf-8",
                success:exito
        });
        return false;
        }
        function exito(data) {
            var returnS = data.d;
            $('#TextBoxAjax').val(data.d);
            $('#TextBoxAjax').css("visibility", "visible");
            return false;
        }
    </script>

    <title></title>
</head>
<body>
    <form id="cookies" runat="server"> 
    <div class="mb-3 row">
        <asp:label ID="Usuario" runat="server" class="form-control"></asp:label>
     </div>
    <div class="mb-3 row">
        <asp:label ID="LabelNombre" runat="server" class="form-control"></asp:label>
     </div>
    <div class="mb-3 row">
        <asp:label ID="LabelApellido" runat="server" class="form-control"></asp:label>
     </div>
     <div class="mb-3 row">
        <asp:Button ID="Btcookie"  OnClientClick="return InformacionCookies()" runat="server" class="form-control" Text="Mostrar Cookie"></asp:Button>
     </div>
    <div class="mb-3 row">
        <asp:TextBox ID="TextGalleta" runat="server" class="form-control"></asp:TextBox>
     </div>
        <div class="row mt-3">
	<div class="cols-sm-2">
		<asp:Button ID="ButtonAjax" runat="server" Text="Ajax"
		OnClientClick="return callAjax();" class="btn btn-success btn-lg" />
	</div>
    </div>
    <div class="row">
	    <div class="form-group row mt-3">
		    <div class="col-sm-9">
			    <div class="form-floating row mt-3">
				    <asp:TextBox ID="TextBoxAjax" runat="server" class="form-control"
				    Style="visibility: hidden"></asp:TextBox>
			    </div>
		    </div>
	    </div>
    </div>

     </form>
</body>
</html>
