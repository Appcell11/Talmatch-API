using Talmatch_API.Entidades;

var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/", () => "Hola mundo!!!");
app.MapPost("/iniciar_sesion", (Sesion user) => Usuario.IniciarSesion(user));
app.MapPost("/registrar_usuario", (Usuario user) => Usuario.RegistrarUsuario(user));
app.MapPost("/registrar_empresa", (Empresa empr) => "Registrar empresa");
app.MapGet("/filtrar",
    (string? universidad,
    string? carrera,
    int? experiencia,
    string? modalidad,
    string? disponibilidad,
    string? idioma,
    string? sexo,
    int pag) => Sesion.ListarUsuarios(universidad,carrera,experiencia,modalidad, disponibilidad, idioma, sexo, pag));
app.MapGet("/buscar", (string keyword, int pag) => "Buscar");

app.Run();
