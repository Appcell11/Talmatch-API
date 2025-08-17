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
        // -- parámetros para reclutador
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
            var Param = new List<SqlParameter>();

            // Agregar parámetros en el orden exacto incluyendo @NOMBRE al inicio
            Param.Add(new SqlParameter("@NOMBRE", SqlDbType.VarChar, 100));
            Param.Add(new SqlParameter("@RUC", SqlDbType.VarChar, 25));
            Param.Add(new SqlParameter("@Logo_URL", SqlDbType.VarChar, -1)); // -1 para VARCHAR(MAX)
            Param.Add(new SqlParameter("@Sitio_Web", SqlDbType.VarChar, -1));
            Param.Add(new SqlParameter("@id_sector", SqlDbType.VarChar, 100));
            Param.Add(new SqlParameter("@id_ciudad", SqlDbType.VarChar, 100));
            Param.Add(new SqlParameter("@NOMBRES", SqlDbType.VarChar, 100));
            Param.Add(new SqlParameter("@APELLIDOS", SqlDbType.VarChar, 100));
            Param.Add(new SqlParameter("@CORREO", SqlDbType.VarChar, 100));
            Param.Add(new SqlParameter("@CONTRASENA", SqlDbType.VarChar, 20));
            Param.Add(new SqlParameter("@CELULAR", SqlDbType.VarChar, 20));
            Param.Add(new SqlParameter("@id_cargo", SqlDbType.VarChar, 100));

            // Agregar valores en el mismo orden, evitando null
            var Atri = new List<object>
            {
                emp.NOMBRE ?? string.Empty,
                emp.RUC ?? string.Empty,
                emp.Logo_URL ?? string.Empty,
                emp.Sitio_Web ?? string.Empty,
                emp.id_sector ?? string.Empty,
                emp.id_ciudad ?? string.Empty,
                emp.NOMBRES ?? string.Empty,
                emp.APELLIDOS ?? string.Empty,
                emp.CORREO ?? string.Empty,
                emp.CONTRASENA ?? string.Empty,
                emp.CELULAR ?? string.Empty,
                emp.id_cargo ?? string.Empty
            };

            try
            {
                resultado = ProcesoAlmacenado.sp_execute("sp_registrar_reclutador", Param, Atri);

                if (resultado.Rows.Count == 0 || resultado.Columns.Count == 0)
                    return "ERROR";

                var estado = resultado.Rows[0].ToString();

                return estado switch
                {
                    "1" => "PASS",
                    "EXIST" => "NOT",
                    _ => "ERROR"
                };
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return "ERROR";
            }
        }
    }
}
