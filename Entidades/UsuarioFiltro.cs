using Datos;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using System.Data;
using System.Linq.Expressions;


namespace Talmatch_API.Entidades
{
    public class UsuarioFiltro
    {
        public int PAG { get; set; }
        public string UNIVERSIDAD { get; set; }
        public string CARRERA { get; set; }
        public string EXP { get; set; }
        public string MODALIDAD { get; set; }
        public string DISPONIBILIDAD { get; set; }
        public string IDIOMA { get; set; }
        public string SEXO { get; set; }

        public UsuarioFiltro() { }

    }
}