using Lab6.ServiceReference1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab6
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        
        private String[] serviceCall()
        {
            Service1Client client = new Service1Client();
            String[] ciudades = client.getCiudades();

            return ciudades;
        }
        protected void addDropDrownCiudadItems()
        {
            String[] ciudades = serviceCall();
            Array.Sort(ciudades);
            city.Items.Add("Selecciona una opcion");
            for (int i = 0; i < ciudades.Length; i++)
            {
                string s = ciudades[i];
                city.Items.Add(s);
            }
        }
        protected void ButtonEnviar_Click(object sender, EventArgs e)
        {
            string nom = nombre.Text;
            string apell = apellido.Text;
            string ciudad = city.SelectedValue;
            string correo = email.Text;
            bool sexf = sexo_femenino.Checked;
            bool sexm = sexo_masculino.Checked;
            string sex = " ";
            if (sexf)
            {

                sex = "F";

            }
            else
            {
                sex = "M";

            }
            string direc = direccion.Text;
            string reque = requerimentos.Text;
            informacion.Text = "Nombre: " + nom + "\nApellido: " + apell + "\nGenero: " + sex + "\nEmail: " + correo + "\nDireccion: " + direc + "\nCiudad: " + ciudad + "\nRequerimentos: " + reque;
            informacion.Visible = true;
            Service1Client client = new Service1Client();
            client.Informacion(nom, apell, sex, correo, direc, ciudad, reque);
            Clean();
            CrearSession(nom, apell);
            CrearCookie(sex, ciudad);
            Response.Redirect("Auxiliar.aspx");

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                addDropDrownCiudadItems();
            }
        }
        protected void Clean()
        {
            nombre.Text = " ";
            apellido.Text = " ";
            city.SelectedIndex = 0;
            email.Text = " ";
            sexo_femenino.Checked = false;
            sexo_masculino.Checked = false;
            direccion.Text = " ";
            requerimentos.Text = " ";


        }
        private void CrearSession(String nombre, String apellido)
        {
            Session["Nombre"] = nombre;
            Session["Apellido"] = apellido;
        }
        private void CrearCookie(String sexo, String ciudad)
        {
            HttpCookie cookie1 = new HttpCookie("Genero",sexo);
            HttpCookie cookie2 = new HttpCookie("Ciudad",ciudad);
            Response.Cookies.Add(cookie1);
            Response.Cookies.Add(cookie2);
        }

        [WebMethod]
        public static bool ValidarAlumno(String nom,String ape)
        {
            Service1Client client = new Service1Client();
            return client.Registrado(nom, ape);
        }
    }
}