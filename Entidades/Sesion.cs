using Datos;
using Microsoft.Data.SqlClient;
using System.Data;

namespace Talmatch_API.Entidades
{
    public class Sesion
    {
        public string Correo { get; set; }
        public string Contrasena { get; set; }

        public Sesion()
        {
            
        }

        public static DataTable ListarUsuarios(string uni, string carrera, int exp, string modalidad, string disponibilidad, string idioma, string sexo, int pag) {
            var resultado = new DataTable();
            
            var Param = new List<SqlParameter>();
            Param.Add(new SqlParameter("@PAG", SqlDbType.Int));
            Param.Add(new SqlParameter("@UNIVERSIDAD", SqlDbType.VarChar));
            Param.Add(new SqlParameter("@CARRERA", SqlDbType.VarChar));
            Param.Add(new SqlParameter("@EXP", SqlDbType.Int));
            Param.Add(new SqlParameter("@MODALIDAD", SqlDbType.VarChar));
            Param.Add(new SqlParameter("@DISPONIBILIDAD", SqlDbType.VarChar));
            Param.Add(new SqlParameter("@IDIOMA", SqlDbType.VarChar));
            Param.Add(new SqlParameter("@SEXO", SqlDbType.VarChar));

            var Atri = new List<Object>();
            Atri.Add(pag);
            Atri.Add(uni);
            Atri.Add(carrera);
            Atri.Add(exp);
            Atri.Add(modalidad);
            Atri.Add(disponibilidad);
            Atri.Add(idioma);
            Atri.Add(sexo);

            try
            {
                resultado = ProcesoAlmacenado.sp_execute("sp_listar_perfiles_usuarios", Param, Atri);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            return resultado;
        }
    }
}
