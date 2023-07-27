using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
namespace BaseDeDatos
{
    public class Clase1
    {
        public List<string> Ciudades()
        {
            string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=NuevaTabla;Integrated Security=True";

            List<string> list = new List<string>();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string selectQuery = "Select Ciudad from DataCiudades";

                using (SqlCommand command = new SqlCommand(selectQuery, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            // Aquí puedes acceder a los valores seleccionados en cada fila
                            var ciudad = reader["Ciudad"];
                            list.Add(ciudad.ToString());
                            // Aquí puedes manejar los valores seleccionados
                        }
                    }
                }

                connection.Close();
            }
            return list;
        }

        public int CodeCiudad( string c)
        {
            string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=NuevaTabla;Integrated Security=True";
            int code = 0;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string selectQuery = "Select Id from DataCiudades WHERE Ciudad = @ciudad";

                using (SqlCommand command = new SqlCommand(selectQuery, connection))
                {
                    command.Parameters.AddWithValue("@ciudad", c); // Reemplaza valor1 con el valor real que deseas insertar

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            // Aquí puedes acceder a los valores seleccionados en cada fila
                            var ciudad = reader["Id"];
                            code = int.Parse(ciudad.ToString());
                            // Aquí puedes manejar los valores seleccionados
                        }
                    }
                }

                connection.Close();
            }
            return code;
        }
        public void IngresarAlumno(string nombre, string apellido, string sexo, string email, string direccion, int ciudad, string requerimiento)
        {
            string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=NuevaTabla;Integrated Security=True";
     
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string insertQuery = "INSERT INTO DataAlumnos VALUES (@nombre, @apellido, @sexo, @email, @direccion, @codeciudad, @requerimiento)";

                using (SqlCommand command = new SqlCommand(insertQuery, connection))
                {
                    command.Parameters.AddWithValue("@nombre", nombre); 
                    command.Parameters.AddWithValue("@apellido", apellido);
                    command.Parameters.AddWithValue("@sexo", sexo);
                    command.Parameters.AddWithValue("@email", email);
                    command.Parameters.AddWithValue("@direccion", direccion);
                    command.Parameters.AddWithValue("@codeciudad", ciudad);
                    command.Parameters.AddWithValue("@requerimiento", requerimiento);


                    command.ExecuteNonQuery();

                   
                }
                connection.Close();
            }
        }
        public bool AlumnoRegistrado(string nombre, string apellido)
        {
            bool reg=false;
            int code = 0;
            string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=NuevaTabla;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string selectQuery = "SELECT Code FROM DataAlumnos WHERE NOMBRE=@nombre AND APELLIDOS = @apellido";

                using (SqlCommand command = new SqlCommand(selectQuery, connection))
                {
                    command.Parameters.AddWithValue("@nombre", nombre);
                    command.Parameters.AddWithValue("@apellido", apellido);
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            // Aquí puedes acceder a los valores seleccionados en cada fila
                            var ciudad = reader["Code"];
                            code = int.Parse(ciudad.ToString());
                            // Aquí puedes manejar los valores seleccionados
                        }
                    }
                    if (code == 0)
                        reg = false;
                    else
                        reg = true;
                }
               
                connection.Close();
            }
            return reg;
        }
        public static void Main(string[] args)
        {
            Clase1 clase = new Clase1();
            clase.query();
            Console.ReadKey();
        }
        private void query()
        {
            Clase1 c = new Clase1();
            c.IngresarAlumno("Sebas","Himan","M","arroba","mi csa",2,"addsds");
            Console.WriteLine("Bien hecho");

        }
    }
}
