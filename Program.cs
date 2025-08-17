using Talmatch_API.Entidades;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.FileProviders;



var builder = WebApplication.CreateBuilder(args);
//builder.Services.AddAntiforgery();
builder.Services.AddCors(options =>
{
    options.AddPolicy("PermitirTodo", policy =>
    {
        policy.AllowAnyOrigin()
              .AllowAnyHeader()
              .AllowAnyMethod();
    });
});

var app = builder.Build();
//app.UseAntiforgery();
app.UseCors("PermitirTodo");

app.MapGet("/", () => "Hola mundo!!!");
app.MapPost("/iniciar_sesion", (Sesion user) => {
    string resultado = Usuario.IniciarSesion(user);
    if (resultado == "ERROR")
        return Results.Unauthorized();
    return Results.Ok(new { Estado = resultado });});
app.MapPost("/registrar_usuario", (Usuario user) => {
    string resultado = Usuario.RegistrarUsuario(user);
    if (resultado == "ERROR")
        return Results.BadRequest(new { message = "Descripción clara del error" });
    return Results.Ok(new { Estado = resultado });});

app.MapPost("/registrar_empresa", (Empresa emp) =>
{
    string resultado = Empresa.RegistrarReclutador(emp);
    if (resultado == "ERROR")
        return Results.BadRequest(new { message = "Descripción clara del error" });
    return Results.Ok(new { Estado = resultado });});
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
app.MapPost("/upload", async ([FromForm] IFormFile archivo) =>
{
    if (archivo == null || archivo.Length == 0)
        return Results.BadRequest("No se envió ningún archivo");

    var rutaCarpeta = Path.Combine(Directory.GetCurrentDirectory(), "archivos");
    if (!Directory.Exists(rutaCarpeta))
        Directory.CreateDirectory(rutaCarpeta);

    var nombreArchivo = Guid.NewGuid() + Path.GetExtension(archivo.FileName);
    var rutaCompleta = Path.Combine(rutaCarpeta, nombreArchivo);

    using var stream = new FileStream(rutaCompleta, FileMode.Create);
    await archivo.CopyToAsync(stream);

    var urlArchivo = $"/archivos/{nombreArchivo}";
    return Results.Ok(new { url = urlArchivo });
}).DisableAntiforgery();


app.UseStaticFiles(new StaticFileOptions
{
    FileProvider = new PhysicalFileProvider(
        Path.Combine(Directory.GetCurrentDirectory(), "archivos")
    ),
    RequestPath = "/archivos"
});

app.Use(async (context, next) =>
{
    if (context.Request.Path == "/upload")
    {
        var form = await context.Request.ReadFormAsync();
        var files = form.Files;
        Console.WriteLine($"Archivos recibidos: {files.Count}");
    }
    await next();
});

app.Run();
