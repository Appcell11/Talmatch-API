using Datos;
using Microsoft.Data.SqlClient;
using System.Data;

namespace Talmatch_API.Entidades
{
    public class Empresa
    {
        public string? NOMBRE { get; set; }
        public string? RUC { get; set; }
        public string? Logo_URL { get; set; }
        public string? Sitio_Web { get; set; }
        public string? id_sector { get; set; }
        public string? id_ciudad { get; set; }
        //-- parametros para reclutador
        public string? NOMBRES { get; set; }
        public string? APELLIDOS { get; set; }
        public string? CORREO { get; set; }
        public string? CONTRASENA { get; set; }
        public string? CELULAR { get; set; }
        public string? id_cargo { get; set; }


        public Empresa() { }

        public static string RegistrarReclutador(Empresa emp)
        {
            var resultado = new DataTable();
            string code = "ERROR";
            var Param = new List<SqlParameter>();
            Param.Add(new SqlParameter("@NOMBRE", SqlDbType.VarChar));
            Param.Add(new SqlParameter("@RUC", SqlDbType.VarChar));
            Param.Add(new SqlParameter("@Logo_URL", SqlDbType.VarChar));
            Param.Add(new SqlParameter("@Sitio_Web", SqlDbType.VarChar));
            Param.Add(new SqlParameter("@id_sector", SqlDbType.VarChar));
            Param.Add(new SqlParameter("@id_ciudad", SqlDbType.VarChar));
            Param.Add(new SqlParameter("@NOMBRES", SqlDbType.VarChar));
            Param.Add(new SqlParameter("@APELLIDOS", SqlDbType.VarChar));
            Param.Add(new SqlParameter("@CORREO", SqlDbType.VarChar));
            Param.Add(new SqlParameter("@CONTRASENA", SqlDbType.VarChar));
            Param.Add(new SqlParameter("@CELULAR", SqlDbType.VarChar));
            Param.Add(new SqlParameter("@id_cargo", SqlDbType.VarChar));

            var Atri = new List<Object>();
            Atri.Add(emp.NOMBRE);
            Atri.Add(emp.RUC);
            Atri.Add(emp.Logo_URL);
            Atri.Add(emp.Sitio_Web);
            Atri.Add(emp.id_sector);
            Atri.Add(emp.id_ciudad);
            Atri.Add(emp.NOMBRES);
            Atri.Add(emp.APELLIDOS);
            Atri.Add(emp.CORREO);
            Atri.Add(emp.CONTRASENA);
            Atri.Add(emp.CELULAR);
            Atri.Add(emp.id_cargo);

            try
            {
                resultado = ProcesoAlmacenado.sp_execute("sp_registrar_reclutador", Param, Atri);
                if (resultado.Rows.Count == 0 || resultado.Columns.Count == 0)
                    return "ERROR";
                var estado = resultado.Rows[0][0].ToString();

                switch (estado)
                {
                    case "1":
                        return "PASS";
                    case "EXIST":
                        return "NOT";
                    default:
                        return "ERROR";
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return "ERROR";
            }
        }
    }
}
