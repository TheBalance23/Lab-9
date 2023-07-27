using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab6
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            loadSession();
        }
        private void loadSession()
        {
            String nombre = (String)(Session["Nombre"]);
            String apellido = (String)(Session["Apellido"]);
            // Asignacion de la informacion a los campos HTML respectivos
            Usuario.Text = "Enviado por Sesion: ";
            LabelNombre.Text = "Nombre: " + nombre;
            LabelApellido.Text = " Apellido: " + apellido;
        }
        [WebMethod]
        public static String getInformacion(String valor)
        {
            return "Desde el servidor se recibio :" + valor;
        }
        private void deleteSessions()
        {
            Session.RemoveAll();
            Session.Abandon();
        }
    }
}