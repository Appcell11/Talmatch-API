using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Data.SqlClient;

namespace Datos
{
    public static class Conexion
    {
        public static string connectionString =
            "Server=localhost;Database=BD_Talmatch;Integrated Security=True;Trust Server Certificate=True;";

        
        static public SqlConnection conectarBD()
        {
            SqlConnection connection = new SqlConnection(connectionString);
            try
            {
                connection.Open();
                return connection;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            { 
                connection.Close();
            }
            return connection ;
        }
    }
}
