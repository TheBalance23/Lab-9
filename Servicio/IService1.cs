using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace Servicio
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de interfaz "IService1" en el código y en el archivo de configuración a la vez.
    [ServiceContract]
    public interface IService1
    {
        [OperationContract]
        IList<String> getCiudades();
        [OperationContract]
        void Informacion(string nombre, string apellido, string sexo, string email, string direccion, string ciudad, string requerimiento);
        [OperationContract]
        bool Registrado(string nombre, string apellido);
    }

}
