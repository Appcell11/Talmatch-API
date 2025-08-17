using Datos;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using System.Data;
using System.Linq.Expressions;


namespace Talmatch_API.Entidades
{
    public class Usuario
    {
        public string? NOMBRES { get; set; }
        public string? APELLIDOS { get; set; }
        public DateOnly? FECHA_DE_NACIMIENTO { get; set; }
        public string? NumIdentificacion { get; set; }
        public string? CORREO { get; set; }
        public string? CONTRASENA { get; set; }
        public string? CELULAR { get; set; }
        public string? DIRECCION { get; set; }
        public string? Foto_Perfil_URL { get; set; }
        public string? id_sexo { get; set; }
        public string? id_tipo_ident { get; set; }
        public string? id_ciudad { get; set; }
        //-- parametros para perfil laboral
        public string? Descripcion_personal { get; set; }
        public int? Anos_exp { get; set; }
        public string? Idiomas { get; set; }
        public string? Habilidades { get; set; }
        public string? CV_url { get; set; }
        public DateOnly? fecha_creacion { get; set; }
        public string? universidad { get; set; }
        public string? modalidad { get; set; }
        public string? carrera { get; set; }
        public string? disponibilidad { get; set; }

        public Usuario()
        {
            
        }

        public static string IniciarSesion(Sesion user)
        {
            var resultado = new DataTable();
            string code = "ERROR";
            var Param = new List<SqlParameter>();
            Param.Add(new SqlParameter("@CORREO", SqlDbType.VarChar));
            Param.Add(new SqlParameter("@CONTRASENA", SqlDbType.VarChar));
            var Atri = new List<Object>();
            Atri.Add(user.Correo);
            Atri.Add(user.Contrasena);
            try
            {
                resultado = ProcesoAlmacenado.sp_execute("sp_iniciar_sesion", Param, Atri);
                if (resultado.Rows.Count == 0 || resultado.Columns.Count == 0)
                    return "ERROR";
                string estado = resultado.Rows[0][0].ToString();

                return estado;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return "ERROR";
            }
        }

        public static string RegistrarUsuario(Usuario user)
        {
            var resultado = new DataTable();
            string code = "ERROR";
            var Param = new List<SqlParameter>();
            Param.Add(new SqlParameter("@NOMBRES", SqlDbType.VarChar));
            Param.Add(new SqlParameter("@APELLIDOS", SqlDbType.VarChar));
            Param.Add(new SqlParameter("@FECHA_DE_NACIMIENTO", SqlDbType.Date));
            Param.Add(new SqlParameter("@NumIdentificacion", SqlDbType.VarChar));
            Param.Add(new SqlParameter("@CORREO", SqlDbType.VarChar));
            Param.Add(new SqlParameter("@CONTRASENA", SqlDbType.VarChar));
            Param.Add(new SqlParameter("@CELULAR", SqlDbType.VarChar));
            Param.Add(new SqlParameter("@DIRECCION", SqlDbType.VarChar));
            Param.Add(new SqlParameter("@Foto_Perfil_URL", SqlDbType.VarChar));
            Param.Add(new SqlParameter("@id_sexo", SqlDbType.VarChar));
            Param.Add(new SqlParameter("@id_tipo_ident", SqlDbType.VarChar));
            Param.Add(new SqlParameter("@id_ciudad", SqlDbType.VarChar));
            /// parametros para perfil laboral
            Param.Add(new SqlParameter("@Descripcion_personal", SqlDbType.Text));
            Param.Add(new SqlParameter("@Anos_exp", SqlDbType.Int));
            Param.Add(new SqlParameter("@Idiomas", SqlDbType.VarChar));
            Param.Add(new SqlParameter("@Habilidades", SqlDbType.VarChar));
            Param.Add(new SqlParameter("@CV_url", SqlDbType.VarChar));
            Param.Add(new SqlParameter("@fecha_creacion", SqlDbType.Date));
            Param.Add(new SqlParameter("@universidad", SqlDbType.VarChar));
            Param.Add(new SqlParameter("@modalidad", SqlDbType.VarChar));
            Param.Add(new SqlParameter("@carrera", SqlDbType.VarChar));
            Param.Add(new SqlParameter("@disponibilidad", SqlDbType.VarChar));


            var Atri = new List<Object>();
            Atri.Add(user.NOMBRES);
            Atri.Add(user.APELLIDOS);
            Atri.Add(user.FECHA_DE_NACIMIENTO);
            Atri.Add(user.NumIdentificacion);
            Atri.Add(user.CORREO);
            Atri.Add(user.CONTRASENA);
            Atri.Add(user.CELULAR);
            Atri.Add(user.DIRECCION);
            Atri.Add(user.Foto_Perfil_URL);
            Atri.Add(user.id_sexo);
            Atri.Add(user.id_tipo_ident);
            Atri.Add(user.id_ciudad);
            /////////////////////////////////
            Atri.Add(user.Descripcion_personal);
            Atri.Add(user.Anos_exp);
            Atri.Add(user.Idiomas);
            Atri.Add(user.Habilidades);
            Atri.Add(user.CV_url);
            Atri.Add(user.fecha_creacion);
            Atri.Add(user.universidad);
            Atri.Add(user.modalidad);
            Atri.Add(user.carrera);
            Atri.Add(user.disponibilidad);

            try
            {
                resultado = ProcesoAlmacenado.sp_execute("sp_registrar_usuario", Param, Atri);
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
