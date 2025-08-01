var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapPost("/iniciar_sesion", (Usuario user) => "Iniciar sesion");
app.MapPost("/registrar_usuario", (Persona person) => "Registrar usuario");
app.MapPost("/registrar_empresa", (Empresa empr) => "Registrar empresa");
app.MapGet("/filtrar", 
    (string? universidad,
    string? carrera,
    string estado,
    int experiencia,
    string modalidad, 
    string disponibilidad, 
    string idioma, 
    string sexo,
    int pag) => "Buscar con filtro");
app.MapGet("/buscar", (string keyword, int pag) => "Buscar");


app.Run();
