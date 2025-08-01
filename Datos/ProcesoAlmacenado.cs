using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Data.SqlClient;
using System.Reflection.Metadata;

namespace Datos
{
    public class ProcesoAlmacenado
    {
        public static DataTable sp_execute(string nombre_proc, List<SqlParameter> parametros_sql, List<Object> atributos)
        {
            SqlDataReader reader;
            SqlConnection con = new SqlConnection(Conexion.connectionString);
            var result = new DataTable();
            try
            {
                SqlCommand cmd = new SqlCommand(nombre_proc, con);
                cmd.CommandType = CommandType.StoredProcedure;
                int index = 0;
                foreach (SqlParameter param in parametros_sql)
                {
                    cmd.Parameters.Add(param).Value = atributos[index];
                    index++;
                }

                con.Open();
                reader = cmd.ExecuteReader();
                result.Load(reader);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                con.Close();
            }
            
            return result;
        }

        public static DataTable sp_execute(string nombre_proc)
        {
            SqlDataReader reader;
            DataTable result = new DataTable();
            SqlConnection con = new SqlConnection(Conexion.connectionString);
            try
            {
                SqlCommand cmd = new SqlCommand(nombre_proc, con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                reader = cmd.ExecuteReader();
                result.Load(reader);
                return result;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                con.Close();
            }
            return result;
        }
    }
}
