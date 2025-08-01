--CREATE DATABASE BD_Talmatch;
use BD_Talmatch
go
CREATE TABLE ESTADO (
  ID_ESTADO INT IDENTITY(1,1) PRIMARY KEY,
  Nombre_Estado VARCHAR(20) NOT NULL
);
INSERT INTO ESTADO VALUES ('ACTIVO'),('INACTIVO')
go
CREATE TABLE Sexo (
  ID_Sexo INT IDENTITY(1,1) PRIMARY KEY,
  Genero VARCHAR(50) NOT NULL
);
INSERT INTO Sexo VALUES ('MASCULINO'), ('FEMENINO')
go
CREATE TABLE Tipo_Identificacion (
  ID_Tipo_Ident INT IDENTITY(1,1) PRIMARY KEY,
  Nombre_Identificacion VARCHAR(50) NOT NULL
);
INSERT INTO Tipo_Identificacion VALUES ('IDENTIFICACION CIUDADANA'), ('PASAPORTE')
go
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
CREATE TABLE Pais (
  ID_Pais INT IDENTITY(1,1) PRIMARY KEY,
  Nombre_Pais VARCHAR(100) NOT NULL
);
-- Inserta solo si NO existe ya el país en la tabla
IF NOT EXISTS (SELECT 1 FROM Pais WHERE Nombre_Pais = 'Antigua y Barbuda')
    INSERT INTO Pais (Nombre_Pais) VALUES ('Antigua y Barbuda');
IF NOT EXISTS (SELECT 1 FROM Pais WHERE Nombre_Pais = 'Argentina')
    INSERT INTO Pais (Nombre_Pais) VALUES ('Argentina');
IF NOT EXISTS (SELECT 1 FROM Pais WHERE Nombre_Pais = 'Bahamas')
    INSERT INTO Pais (Nombre_Pais) VALUES ('Bahamas');
IF NOT EXISTS (SELECT 1 FROM Pais WHERE Nombre_Pais = 'Barbados')
    INSERT INTO Pais (Nombre_Pais) VALUES ('Barbados');
IF NOT EXISTS (SELECT 1 FROM Pais WHERE Nombre_Pais = 'Belice')
    INSERT INTO Pais (Nombre_Pais) VALUES ('Belice');
IF NOT EXISTS (SELECT 1 FROM Pais WHERE Nombre_Pais = 'Bolivia')
    INSERT INTO Pais (Nombre_Pais) VALUES ('Bolivia');
IF NOT EXISTS (SELECT 1 FROM Pais WHERE Nombre_Pais = 'Brasil')
    INSERT INTO Pais (Nombre_Pais) VALUES ('Brasil');
IF NOT EXISTS (SELECT 1 FROM Pais WHERE Nombre_Pais = 'Canadá')
    INSERT INTO Pais (Nombre_Pais) VALUES ('Canadá');
IF NOT EXISTS (SELECT 1 FROM Pais WHERE Nombre_Pais = 'Chile')
    INSERT INTO Pais (Nombre_Pais) VALUES ('Chile');
IF NOT EXISTS (SELECT 1 FROM Pais WHERE Nombre_Pais = 'Colombia')
    INSERT INTO Pais (Nombre_Pais) VALUES ('Colombia');
IF NOT EXISTS (SELECT 1 FROM Pais WHERE Nombre_Pais = 'Costa Rica')
    INSERT INTO Pais (Nombre_Pais) VALUES ('Costa Rica');
IF NOT EXISTS (SELECT 1 FROM Pais WHERE Nombre_Pais = 'Cuba')
    INSERT INTO Pais (Nombre_Pais) VALUES ('Cuba');
IF NOT EXISTS (SELECT 1 FROM Pais WHERE Nombre_Pais = 'Dominica')
    INSERT INTO Pais (Nombre_Pais) VALUES ('Dominica');
IF NOT EXISTS (SELECT 1 FROM Pais WHERE Nombre_Pais = 'Ecuador')
    INSERT INTO Pais (Nombre_Pais) VALUES ('Ecuador');
IF NOT EXISTS (SELECT 1 FROM Pais WHERE Nombre_Pais = 'El Salvador')
    INSERT INTO Pais (Nombre_Pais) VALUES ('El Salvador');
IF NOT EXISTS (SELECT 1 FROM Pais WHERE Nombre_Pais = 'Estados Unidos')
    INSERT INTO Pais (Nombre_Pais) VALUES ('Estados Unidos');
IF NOT EXISTS (SELECT 1 FROM Pais WHERE Nombre_Pais = 'Granada')
    INSERT INTO Pais (Nombre_Pais) VALUES ('Granada');
IF NOT EXISTS (SELECT 1 FROM Pais WHERE Nombre_Pais = 'Guatemala')
    INSERT INTO Pais (Nombre_Pais) VALUES ('Guatemala');
IF NOT EXISTS (SELECT 1 FROM Pais WHERE Nombre_Pais = 'Guyana')
    INSERT INTO Pais (Nombre_Pais) VALUES ('Guyana');
IF NOT EXISTS (SELECT 1 FROM Pais WHERE Nombre_Pais = 'Haití')
    INSERT INTO Pais (Nombre_Pais) VALUES ('Haití');
IF NOT EXISTS (SELECT 1 FROM Pais WHERE Nombre_Pais = 'Honduras')
    INSERT INTO Pais (Nombre_Pais) VALUES ('Honduras');
IF NOT EXISTS (SELECT 1 FROM Pais WHERE Nombre_Pais = 'Jamaica')
    INSERT INTO Pais (Nombre_Pais) VALUES ('Jamaica');
IF NOT EXISTS (SELECT 1 FROM Pais WHERE Nombre_Pais = 'México')
    INSERT INTO Pais (Nombre_Pais) VALUES ('México');
IF NOT EXISTS (SELECT 1 FROM Pais WHERE Nombre_Pais = 'Nicaragua')
    INSERT INTO Pais (Nombre_Pais) VALUES ('Nicaragua');
IF NOT EXISTS (SELECT 1 FROM Pais WHERE Nombre_Pais = 'Panamá')
    INSERT INTO Pais (Nombre_Pais) VALUES ('Panamá');
IF NOT EXISTS (SELECT 1 FROM Pais WHERE Nombre_Pais = 'Paraguay')
    INSERT INTO Pais (Nombre_Pais) VALUES ('Paraguay');
IF NOT EXISTS (SELECT 1 FROM Pais WHERE Nombre_Pais = 'Perú')
    INSERT INTO Pais (Nombre_Pais) VALUES ('Perú');
IF NOT EXISTS (SELECT 1 FROM Pais WHERE Nombre_Pais = 'República Dominicana')
    INSERT INTO Pais (Nombre_Pais) VALUES ('República Dominicana');
IF NOT EXISTS (SELECT 1 FROM Pais WHERE Nombre_Pais = 'San Cristóbal y Nieves')
    INSERT INTO Pais (Nombre_Pais) VALUES ('San Cristóbal y Nieves');
IF NOT EXISTS (SELECT 1 FROM Pais WHERE Nombre_Pais = 'San Vicente y las Granadinas')
    INSERT INTO Pais (Nombre_Pais) VALUES ('San Vicente y las Granadinas');
IF NOT EXISTS (SELECT 1 FROM Pais WHERE Nombre_Pais = 'Santa Lucía')
    INSERT INTO Pais (Nombre_Pais) VALUES ('Santa Lucía');
IF NOT EXISTS (SELECT 1 FROM Pais WHERE Nombre_Pais = 'Surinam')
    INSERT INTO Pais (Nombre_Pais) VALUES ('Surinam');
IF NOT EXISTS (SELECT 1 FROM Pais WHERE Nombre_Pais = 'Trinidad y Tobago')
    INSERT INTO Pais (Nombre_Pais) VALUES ('Trinidad y Tobago');
IF NOT EXISTS (SELECT 1 FROM Pais WHERE Nombre_Pais = 'Uruguay')
    INSERT INTO Pais (Nombre_Pais) VALUES ('Uruguay');
IF NOT EXISTS (SELECT 1 FROM Pais WHERE Nombre_Pais = 'Venezuela')
    INSERT INTO Pais (Nombre_Pais) VALUES ('Venezuela');

 -----------------------------------------------------------------------------------------------------
 -----------------------------------------------------------------------------------------------------
go
CREATE TABLE Ciudad (
  ID_Ciudad INT IDENTITY(1,1) PRIMARY KEY,
  Nombre_Ciudad VARCHAR(100) NOT NULL,
  ID_Pais INT,
  FOREIGN KEY (ID_Pais) REFERENCES Pais(ID_Pais)
);
INSERT INTO Ciudad (Nombre_Ciudad, ID_Pais) VALUES 
-- Antigua y Barbuda
('Saint John', 1),

-- Argentina
('Buenos Aires', 2),
('Córdoba', 2),
('Rosario', 2),

-- Bahamas
('Nassau', 3),

-- Barbados
('Bridgetown', 4),

-- Belice
('Belmopan', 5),
('Ciudad de Belice', 5),

-- Bolivia
('La Paz', 6),
('Santa Cruz de la Sierra', 6),
('Cochabamba', 6),

-- Brasil
('São Paulo', 7),
('Río de Janeiro', 7),
('Brasilia', 7),
('Belo Horizonte', 7),
('Salvador', 7),

-- Canadá
('Toronto', 8),
('Vancouver', 8),
('Montreal', 8),

-- Chile
('Santiago', 9),
('Valparaíso', 9),
('Concepción', 9),

-- Colombia
('Bogotá', 10),
('Medellín', 10),
('Cali', 10),
('Barranquilla', 10),

-- Costa Rica
('San José', 11),

-- Cuba
('La Habana', 12),
('Santiago de Cuba', 12),

-- Dominica
('Roseau', 13),

-- Ecuador
('Quito', 14),
('Guayaquil', 14),

-- El Salvador
('San Salvador', 15),

-- Estados Unidos (parte América)
('Nueva York', 16),
('Los Ángeles', 16),
('Chicago', 16),

-- Granada
('Saint George', 17),

-- Guatemala
('Ciudad de Guatemala', 18),

-- Guyana
('Georgetown', 19),

-- Haití
('Puerto Príncipe', 20),

-- Honduras
('Tegucigalpa', 21),
('San Pedro Sula', 21),

-- Jamaica
('Kingston', 22),

-- México
('Ciudad de México', 23),
('Guadalajara', 23),
('Monterrey', 23),

-- Nicaragua
('Managua', 24),

-- Panamá
('Ciudad de Panamá', 25),

-- Paraguay
('Asunción', 26),

-- Perú
('Lima', 27),
('Arequipa', 27),

-- República Dominicana
('Santo Domingo', 28),
('Santiago de los Caballeros', 28),

-- San Cristóbal y Nieves
('Basseterre', 29),

-- San Vicente y las Granadinas
('Kingstown', 30),

-- Santa Lucía
('Castries', 31),

-- Surinam
('Paramaribo', 32),

-- Trinidad y Tobago
('Puerto España', 33),

-- Uruguay
('Montevideo', 34),

-- Venezuela
('Caracas', 35),
('Maracaibo', 35),
('Valencia', 35);
--------------------------------------------------------------------------
--------------------------------------------------------------------------
go
CREATE TABLE Sector_Industria (
  ID_Sector INT IDENTITY(1,1) PRIMARY KEY,
  Nombre_Industria VARCHAR(50) NOT NULL
);
INSERT INTO Sector_Industria (Nombre_Industria) VALUES
('Agricultura'),
('Ganadería'),
('Pesca y Acuicultura'),
('Forestal'),
('Minería'),
('Petróleo y Gas'),
('Manufactura'),
('Industria Automotriz'),
('Industria Química'),
('Alimentos y Bebidas'),
('Textil y Confección'),
('Energía y Electricidad'),
('Construcción'),
('Tecnología y Software'),
('Telecomunicaciones'),
('Turismo y Hotelería'),
('Comercio Minorista'),
('Servicios Financieros'),
('Transporte y Logística'),
('Educación'),
('Salud y Medicina'),
('Medios y Entretenimiento'),
('Servicios Profesionales y Consultoría');

-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
go
CREATE TABLE Cargo (
  ID_Cargo INT IDENTITY(1,1) PRIMARY KEY,
  Nombre_Cargo VARCHAR(50) NOT NULL
);
INSERT INTO Cargo (Nombre_Cargo) VALUES
('Director Ejecutivo'),
('Gerente General'),
('Gerente de Operaciones'),
('Gerente de Ventas'),
('Gerente de Marketing'),
('Gerente de Recursos Humanos'),
('Supervisor'),
('Analista'),
('Asistente Administrativo'),
('Coordinador de Proyectos'),
('Jefe de Departamento'),
('Consultor'),
('Técnico Especializado'),
('Representante de Ventas'),
('Auxiliar Contable'),
('Secretario/a'),
('Director Financiero'),
('Director de Tecnología'),
('Desarrollador de Software'),
('Auditor Interno');
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
go
CREATE TABLE Universidad (
  ID_Universidad INT IDENTITY(1,1) PRIMARY KEY,
  Nombre_Universidad VARCHAR(100) NOT NULL
);
INSERT INTO Universidad (Nombre_Universidad) VALUES
('Universidad Nacional Autónoma de Nicaragua, Managua'),
('Universidad Nacional Autónoma de Nicaragua, León'),
('Universidad Nacional Agraria'),
('Universidad Nacional de Ingeniería'),
('Universidad Americana, Nicaragua'),
('Universidad Centroamericana'),
('Universidad Católica Redemptoris Mater'),
('Universidad de las Regiones Autónomas de la Costa Caribe Nicaragüense'),
('Universidad Central de Nicaragua'),
('Universidad de Managua'),
('Universidad Tecnológica Nicaragüense'),
('Universidad Iberoamericana de Ciencia y Tecnología'),
('Universidad Thomas More'),
('Universidad Martín Lutero'),
('Universidad Nacional Padre Gaspar García Laviana');
INSERT INTO Universidad (Nombre_Universidad) VALUES
('Universidade de São Paulo'),
('Universidad Nacional Autónoma de México'),
('Universidade Estadual de Campinas'),
('Pontificia Universidad Católica de Chile'),
('Universidad de Chile'),
('Universidad Nacional de Colombia'),
('Universidad de Buenos Aires'),
('Instituto Tecnológico y de Estudios Superiores de Monterrey'),
('Universidade Federal de Minas Gerais'),
('Universidad Nacional de La Plata'),
('Universidad de los Andes, Colombia'),
('Universidad de Guadalajara'),
('Pontificia Universidad Javeriana'),
('Universidad Autónoma de Nuevo León'),
('Universidad de Costa Rica'),
('Universidad Nacional de Córdoba'),
('Universidad de Antioquia'),
('Universidad Nacional Mayor de San Marcos'),
('Universidad de Panamá'),
('Universidad San Francisco de Quito'),
('Universidad Peruana Cayetano Heredia'),
('Universidad del Rosario'),
('Universidad de Valparaíso'),
('Universidad del Desarrollo'),
('Universidad Nacional de Rosario');

go
CREATE TABLE Modalidad (
  ID_Modalidad INT IDENTITY(1,1) PRIMARY KEY,
  Nombre_Modalidad VARCHAR(50) NOT NULL
);
INSERT INTO Modalidad VALUES ('Presencial'), ('Remoto'),('Hibrido')
go
CREATE TABLE Carrera (
  ID_Carrera INT IDENTITY(1,1) PRIMARY KEY,
  Nombre_Carrera VARCHAR(50) NOT NULL
);
INSERT INTO Carrera (Nombre_Carrera) VALUES
('Medicina'),
('Derecho'),
('Ingeniería Civil'),
('Ingeniería Industrial'),
('Ingeniería en Sistemas Computacionales'),
('Ingeniería Mecánica'),
('Ingeniería Electrónica'),
('Ingeniería Ambiental'),
('Administración de Empresas'),
('Economía'),
('Contaduría Pública'),
('Psicología'),
('Ciencias de la Comunicación'),
('Educación'),
('Arquitectura'),
('Mercadotecnia'),
('Ciencias Políticas'),
('Enfermería'),
('Odontología'),
('Bioanálisis Clínico'),
('Farmacia'),
('Trabajo Social'),
('Ingeniería Química'),
('Turismo'),
('Tecnología de la Información'),
('Ingeniería en Energías Renovables'),
('Ciencia de Datos'),
('Finanzas'),
('Desarrollo de Software'),
('Ciberseguridad'),
('Diseño Gráfico'),
('Relaciones Internacionales'),
('Ingeniería en Telecomunicaciones'),
('Negocios Internacionales'),
('Biotecnología'),
('Fisioterapia'),
('Ingeniería en Alimentos'),
('Ingeniería en Petróleo'),
('Ingeniería en Minas'),
('Ingeniería en Agronomía'),
('Ingeniería en Logística y Transporte');

go
CREATE TABLE Disponibilidad_Laboral (
  ID_Disponibilidad INT IDENTITY(1,1) PRIMARY KEY,
  Nombre_Disponibilidad VARCHAR(50) NOT NULL
);
INSERT INTO Disponibilidad_Laboral VALUES ('Tiempo Completo'), ('Medio Tiempo'), ('Pasantias')
go
CREATE TABLE Rol (
  ID_Rol INT IDENTITY(1,1) PRIMARY KEY,
  Nombre_Rol VARCHAR(50) NOT NULL
);
INSERT INTO Rol VALUES ('Administrador'),('usuario')
GO

CREATE TABLE Usuario (
  ID_Usuario INT IDENTITY(1,1) PRIMARY KEY,
  Nombres VARCHAR(100) NOT NULL,
  Apellidos VARCHAR(100) NOT NULL,
  Fecha_Nacimiento DATE NOT NULL,
  NumIdentificacion VARCHAR(14) NOT NULL,
  Correo VARCHAR(100) UNIQUE NOT NULL,
  Contrasena VARCHAR(255) NOT NULL,
  Celular VARCHAR(20),
  Direccion VARCHAR(200),
  Foto_Perfil_URL VARCHAR(MAX),
  ID_Sexo INT,
  ID_Tipo_Ident INT,
  ID_Ciudad INT,
  ID_ESTADO INT,
  FOREIGN KEY (ID_Sexo) REFERENCES Sexo(ID_Sexo),
  FOREIGN KEY (ID_Tipo_Ident) REFERENCES Tipo_Identificacion(ID_Tipo_Ident),
  FOREIGN KEY (ID_Ciudad) REFERENCES Ciudad(ID_Ciudad),
  FOREIGN KEY (ID_ESTADO) REFERENCES Estado(ID_ESTADO)
);
go
CREATE TABLE Sesion (
  ID_Sesion INT IDENTITY(1,1) PRIMARY KEY,
  Nombre_Usuario VARCHAR(100) UNIQUE NOT NULL,
  Contrasena VARCHAR(255) NOT NULL,
  ID_Usuario INT,
  ID_Rol INT,
  ID_ESTADO INT,
  FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario),
  FOREIGN KEY (ID_Rol) REFERENCES Rol(ID_Rol),
  FOREIGN KEY (ID_ESTADO) REFERENCES Estado(ID_ESTADO)
);
go
CREATE TABLE Perfil_Laboral (
  ID_Perfil INT IDENTITY(1,1) PRIMARY KEY,
  Descripcion_Personal TEXT,
  Anos_Experiencia INT,
  Idiomas VARCHAR(255),
  Habilidades VARCHAR(255),
  CV_URL VARCHAR(MAX),
  Fecha_Creacion DATE DEFAULT GETDATE(),
  ID_Usuario INT,
  ID_Universidad INT,
  ID_Modalidad INT,
  ID_Carrera INT,
  ID_Disponibilidad INT,
  ID_ESTADO INT,
  FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario),
  FOREIGN KEY (ID_Universidad) REFERENCES Universidad(ID_Universidad),
  FOREIGN KEY (ID_Modalidad) REFERENCES Modalidad(ID_Modalidad),
  FOREIGN KEY (ID_Carrera) REFERENCES Carrera(ID_Carrera),
  FOREIGN KEY (ID_Disponibilidad) REFERENCES Disponibilidad_Laboral(ID_Disponibilidad),
  FOREIGN KEY (ID_ESTADO) REFERENCES Estado(ID_ESTADO)
);
go
CREATE TABLE Empresa (
  ID_Empresa INT IDENTITY(1,1) PRIMARY KEY,
  Nombre_Empresa VARCHAR(100) NOT NULL,
  RUC VARCHAR(25) UNIQUE NOT NULL,
  Logo_URL VARCHAR(MAX),
  Sitio_Web VARCHAR(MAX),
  ID_Sector INT,
  ID_Ciudad INT,
  FOREIGN KEY (ID_Sector) REFERENCES Sector_Industria(ID_Sector),
  FOREIGN KEY (ID_Ciudad) REFERENCES Ciudad(ID_Ciudad)
);
go
CREATE TABLE Reclutador (
  ID_Reclutador INT IDENTITY(1,1) PRIMARY KEY,
  Nombres VARCHAR(50),
  Apellidos VARCHAR(50),
  Correo VARCHAR(100) UNIQUE NOT NULL,
  Contrasena VARCHAR(255) NOT NULL,
  Celular VARCHAR(20),
  ID_Cargo INT,
  ID_Empresa INT,
  ID_ESTADO INT,
  FOREIGN KEY (ID_Cargo) REFERENCES Cargo(ID_Cargo),
  FOREIGN KEY (ID_Empresa) REFERENCES Empresa(ID_Empresa),
  FOREIGN KEY (ID_ESTADO) REFERENCES Estado(ID_ESTADO)
);
