using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.IO;
using BaseDeDatos;

namespace Servicio
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de clase "Service1" en el código, en svc y en el archivo de configuración a la vez.
    // NOTA: para iniciar el Cliente de prueba WCF para probar este servicio, seleccione Service1.svc o Service1.svc.cs en el Explorador de soluciones e inicie la depuración.
    public class Service1 : IService1
    {
        public IList<String> getCiudades()
        {
            Clase1 City = new Clase1(); 
            IList<String> ciudades = City.Ciudades();
            return ciudades;
        }
        public void Informacion(string nombre, string apellido, string sexo, string email, string direccion, string ciudad, string requerimiento)
        {
            Clase1 alumno = new Clase1();
            int ciu = alumno.CodeCiudad(ciudad);
            alumno.IngresarAlumno(nombre, apellido, sexo, email, direccion, ciu, requerimiento);
        }
        public bool Registrado(string nombre, string apellido)
        {
            Clase1 alu= new Clase1();
            return alu.AlumnoRegistrado(nombre, apellido);
        }
    }
}
