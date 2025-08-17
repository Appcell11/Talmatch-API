--USE BD_Talmatch;
--go
CREATE OR ALTER PROC sp_iniciar_sesion
(
	@CORREO VARCHAR(100),
    @CONTRASENA VARCHAR(16)
)
AS
BEGIN
	BEGIN TRY
		IF EXISTS (SELECT 1 FROM Usuario WHERE Correo = @CORREO AND Contrasena = @CONTRASENA AND ID_ESTADO = 1)
        BEGIN
            SELECT 'PASS USER' AS RESP;
        END
		ELSE
		BEGIN
			IF EXISTS (SELECT 1 FROM Reclutador WHERE Correo = @CORREO AND Contrasena = @CONTRASENA AND ID_ESTADO = 1)
			BEGIN
				SELECT 'PASS REC' AS RESP;
			END
			ELSE
			BEGIN
				SELECT 'NOT' AS RESP;
			END
		END
	END TRY
    BEGIN CATCH
        SELECT 'ERROR' AS RESP;
    END CATCH
END
GO
select * from Usuario
select * from Reclutador
----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
go
CREATE OR ALTER PROCEDURE sp_registrar_usuario
(
    @NOMBRES VARCHAR(100),
    @APELLIDOS VARCHAR(100),
    @FECHA_DE_NACIMIENTO DATE,
    @NumIdentificacion VARCHAR(14),
    @CORREO VARCHAR(100),
    @CONTRASENA VARCHAR(20),
	@CELULAR VARCHAR(20),
	@DIRECCION VARCHAR(200),
	@Foto_Perfil_URL VARCHAR(MAX),
	@id_sexo VARCHAR(20),
	@id_tipo_ident VARCHAR(100),
	@id_ciudad VARCHAR(100),
    --- parametros para perfil laboral
    @Descripcion_personal text,
    @Anos_exp int,
    @Idiomas varchar(255),
    @Habilidades varchar(255),
    @CV_url varchar(max),
    @fecha_creacion date,
    @universidad VARCHAR(100),
    @modalidad VARCHAR(100),
    @carrera VARCHAR(100),
    @disponibilidad VARCHAR(100)
)
AS
BEGIN
    BEGIN TRY
        -- Validar existencia del usuario
        IF EXISTS (SELECT 1 FROM Usuario WHERE Correo = @CORREO AND ID_ESTADO = 1) OR EXISTS (SELECT 1 FROM Reclutador WHERE Correo = @CORREO AND ID_ESTADO = 1)
        BEGIN
            SELECT 'EXIST' AS RESP;
        END
		ELSE
		BEGIN
        --OBTENER EL ID DE LAS REFERENCIAS
            DECLARE @_id_sexo int;
            DECLARE @_id_tipo_ident int;
            DECLARE @_id_ciudad int;
            DECLARE @_universidad int;
            DECLARE @_modalidad int;
            DECLARE @_carrera int;
            DECLARE @_disponibilidad int;

            SELECT @_id_sexo = ID_Sexo FROM Sexo WHERE Sexo.Genero = @id_sexo;
            SELECT @_id_tipo_ident = ID_Tipo_Ident FROM Tipo_Identificacion WHERE Tipo_Identificacion.Nombre_Identificacion = @id_tipo_ident;
            SELECT @_id_ciudad = ID_Ciudad FROM Ciudad WHERE Ciudad.Nombre_Ciudad = @id_ciudad;
            SELECT @_universidad = ID_Universidad FROM Universidad WHERE Nombre_Universidad = @universidad;
            SELECT @_modalidad = ID_Modalidad FROM Modalidad WHERE Nombre_Modalidad = @modalidad;
            SELECT @_carrera = ID_Carrera FROM Carrera WHERE Nombre_Carrera = @carrera;
            SELECT @_disponibilidad = ID_Disponibilidad FROM Disponibilidad_Laboral WHERE Nombre_Disponibilidad = @disponibilidad;

			INSERT INTO Usuario
            VALUES (
                @NOMBRES,
                @APELLIDOS,
                @FECHA_DE_NACIMIENTO,
                @NumIdentificacion,
                @CORREO,
                @CONTRASENA,
	            @CELULAR,
	            @DIRECCION,
	            @Foto_Perfil_URL,
	            @_id_sexo,
	            @_id_tipo_ident,
	            @_id_ciudad,
                1
            )
            
			DECLARE @ID_USUARIO INT;
            SET @ID_USUARIO = SCOPE_IDENTITY();

            INSERT INTO Perfil_Laboral
            VALUES(
                @Descripcion_personal,
                @Anos_exp ,
                @Idiomas ,
                @Habilidades,
                @CV_url ,
                @fecha_creacion,
                @ID_USUARIO,
                @_universidad ,
                @_modalidad ,
                @_carrera ,
                @_disponibilidad,
                1
            )
            IF EXISTS (SELECT 1 FROM Usuario WHERE ID_Usuario = @ID_USUARIO AND ID_ESTADO = 1)
            BEGIN
                SELECT '1' AS RESP;
            END
		END
    END TRY
    BEGIN CATCH
        SELECT 'ERROR' AS RESP;
    END CATCH
END

GO
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------


CREATE OR ALTER PROCEDURE sp_registrar_reclutador
(
    --parametros para Empresa
    @NOMBRE VARCHAR(100),
    @RUC VARCHAR(25),
	@Logo_URL VARCHAR(MAX),
    @Sitio_Web varchar(Max),
	@id_sector VARCHAR(100),
	@id_ciudad VARCHAR(100),
    --- parametros para reclutador
    @NOMBRES VARCHAR(100),
    @APELLIDOS VARCHAR(100),
    @CORREO VARCHAR(100),
    @CONTRASENA VARCHAR(20),
	@CELULAR VARCHAR(20),
    @id_cargo VARCHAR(100)
)
AS
BEGIN
    BEGIN TRY
        -- Validar existencia del usuario
        IF EXISTS (SELECT 1 FROM Usuario WHERE Correo = @CORREO AND ID_ESTADO = 1) OR EXISTS (SELECT 1 FROM Reclutador WHERE Correo = @CORREO AND ID_ESTADO = 1)
        BEGIN
            SELECT 'EXIST' AS RESP;
        END
		ELSE
		BEGIN
            DECLARE @_id_sector int;
	        DECLARE @_id_ciudad int;
            DECLARE @_id_cargo int;

            SELECT @_id_sector = ID_Sector FROM Sector_Industria WHERE Sector_Industria.Nombre_Industria = @id_sector;
            SELECT @_id_ciudad = ID_Ciudad FROM Ciudad WHERE Nombre_Ciudad = @id_ciudad;
            SELECT @_id_cargo  = ID_Cargo FROM Cargo WHERE Nombre_Cargo = @id_cargo;

			INSERT INTO Empresa
            VALUES (
                @NOMBRE,
                @RUC,
	            @Logo_URL,
                @Sitio_Web,
	            @_id_ciudad,
	            @_id_sector
            )

			DECLARE @ID_empresa INT;
            SELECT @ID_empresa = ID_Empresa FROM Empresa WHERE Nombre_Empresa = @NOMBRE AND RUC = @RUC;

            INSERT INTO Reclutador
            VALUES(
                @NOMBRES,
                @APELLIDOS,
                @CORREO,
                @CONTRASENA,
	            @CELULAR,
                @_id_cargo,
                @ID_empresa,
                1
            )
            IF EXISTS (SELECT 1 FROM Empresa WHERE ID_Empresa = @ID_empresa AND RUC =  @RUC)
            BEGIN
                SELECT '1' AS RESP;
            END
		END
    END TRY
    BEGIN CATCH
        SELECT 'ERROR' AS RESP;
    END CATCH
END
GO

------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
CREATE OR ALTER PROCEDURE sp_listar_perfiles_usuarios
(
    @PAG INT = 1,
    @UNIVERSIDAD VARCHAR(100) = NULL,
    @CARRERA VARCHAR(100) = NULL,
    @EXP INT = NULL,
    @MODALIDAD VARCHAR(100) = NULL,
    @DISPONIBILIDAD VARCHAR(100) = NULL,
    @IDIOMA VARCHAR(100) = NULL,
    @SEXO VARCHAR(100) = NULL
)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        DECLARE @FilasPorPagina INT = 10;
        
        SELECT 
            Foto_Perfil_URL AS FOTO,
            Nombres,
            Apellidos,
            Carrera.Nombre_Carrera AS Carrera,
            Anos_Experiencia AS Experiencia,
			Fecha_Creacion
        FROM Perfil_Laboral
        INNER JOIN Usuario ON Usuario.ID_Usuario = Perfil_Laboral.ID_Usuario
        INNER JOIN Carrera ON Carrera.ID_Carrera = Perfil_Laboral.ID_Carrera
        INNER JOIN Universidad ON Universidad.ID_Universidad = Perfil_Laboral.ID_Universidad
        INNER JOIN Modalidad ON Modalidad.ID_Modalidad = Perfil_Laboral.ID_Modalidad
        INNER JOIN Disponibilidad_Laboral ON Disponibilidad_Laboral.ID_Disponibilidad = Perfil_Laboral.ID_Disponibilidad
        INNER JOIN Sexo ON Sexo.ID_Sexo = Usuario.ID_Sexo
        INNER JOIN ESTADO ON ESTADO.ID_ESTADO = Usuario.ID_ESTADO
        WHERE (@UNIVERSIDAD IS NULL OR Universidad.Nombre_Universidad = @UNIVERSIDAD)
          AND (@CARRERA IS NULL OR Carrera.Nombre_Carrera = @CARRERA)
          AND (@EXP IS NULL OR Perfil_Laboral.Anos_Experiencia = @EXP)
          AND (@MODALIDAD IS NULL OR Modalidad.Nombre_Modalidad = @MODALIDAD)
          AND (@DISPONIBILIDAD IS NULL OR Disponibilidad_Laboral.Nombre_Disponibilidad = @DISPONIBILIDAD)
          AND (@IDIOMA IS NULL OR Perfil_Laboral.Idiomas LIKE '%' + @IDIOMA + '%')
          AND (@SEXO IS NULL OR Sexo.Genero = @SEXO)
          AND ESTADO.ID_ESTADO = 1
        ORDER BY ID_Perfil
        OFFSET (@PAG - 1) * @FilasPorPagina ROWS
        FETCH NEXT @FilasPorPagina ROWS ONLY;
    END TRY
    BEGIN CATCH
        SELECT 'ERROR' AS RESP;
    END CATCH
END;
