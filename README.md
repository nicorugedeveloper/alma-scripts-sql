# Alma Scripts SQL

Este repositorio contiene scripts SQL para la creación y gestión de la base de datos `Alma`, diseñada para manejar la información de estudiantes, clases y profesores.

## Estructura de la Base de Datos

### Crear Base de Datos

```sql
CREATE DATABASE Alma;
USE Alma;

-- Estudiante: Contiene la información de los estudiantes.
CREATE TABLE Estudiante (
    estudiante_id INT AUTO_INCREMENT PRIMARY KEY UNIQUE ,
    primer_nombre VARCHAR(100) NOT NULL,
    segundo_nombre VARCHAR(100),
    primer_apellido VARCHAR(100) NOT NULL,
    segundo_apellido VARCHAR(100),
    direccion VARCHAR(255) Default 'Neiva',
    cedula VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(20)
);

-- Clase: Contiene la información de las clases.
CREATE TABLE Clase (
    clase_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_clase VARCHAR(50) UNIQUE NOT NULL
);

-- Profesor: Contiene la información de los profesores.
CREATE TABLE Profesor (
    profesor_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_profesor VARCHAR(100) NOT NULL
);

-- EstudianteClase: Tabla intermedia para la relación muchos a muchos entre estudiantes y clases.
CREATE TABLE IF NOT EXISTS EstudianteClase (
    estudiante_id INT,
    clase_id INT,
    fecha_asignacion DATE DEFAULT (CURRENT_DATE),
    PRIMARY KEY (estudiante_id, clase_id),
    FOREIGN KEY (estudiante_id) REFERENCES Estudiante(estudiante_id),
    FOREIGN KEY (clase_id) REFERENCES Clase(clase_id)
) ENGINE=InnoDB;

-- EstudianteProfesor: Tabla intermedia para la relación muchos a muchos entre estudiantes y profesores.
CREATE TABLE IF NOT EXISTS EstudianteProfesor (
    estudiante_id INT,
    profesor_id INT,
    fecha_asignacion DATE DEFAULT (CURRENT_DATE),
    PRIMARY KEY (estudiante_id, profesor_id),
    FOREIGN KEY (estudiante_id) REFERENCES Estudiante(estudiante_id),
    FOREIGN KEY (profesor_id) REFERENCES Profesor(profesor_id)
) ENGINE=InnoDB;

-- ProfesorClase: Tabla intermedia para la relación muchos a muchos entre profesores y clases.
CREATE TABLE IF NOT EXISTS ProfesorClase (
    profesor_id INT,
    clase_id INT,
    fecha_asignacion DATE DEFAULT (CURRENT_DATE),
    PRIMARY KEY (profesor_id, clase_id),
    FOREIGN KEY (profesor_id) REFERENCES Profesor(profesor_id),
    FOREIGN KEY (clase_id) REFERENCES Clase(clase_id)
) ENGINE=InnoDB;

```

### Consultas SQL

```sql
-- Consultar estudiantes, clases y profesores:
SELECT e.primer_nombre, e.primer_apellido, c.nombre_clase, p.nombre_profesor
FROM Estudiante e
INNER JOIN EstudianteClase ec ON e.estudiante_id = ec.estudiante_id
INNER JOIN Clase c ON ec.clase_id = c.clase_id
INNER JOIN ProfesorClase pc ON c.clase_id = pc.clase_id
INNER JOIN Profesor p ON pc.profesor_id = p.profesor_id;


-- Consulta con LEFT JOIN:
SELECT e.primer_nombre, e.primer_apellido, c.nombre_clase, p.nombre_profesor
FROM Estudiante e
LEFT JOIN EstudianteClase ec ON e.estudiante_id = ec.estudiante_id
LEFT JOIN Clase c ON ec.clase_id = c.clase_id
LEFT JOIN ProfesorClase pc ON c.clase_id = pc.clase_id
LEFT JOIN Profesor p ON pc.profesor_id = p.profesor_id;

-- Consulta con UNION:
SELECT primer_nombre, email FROM Estudiante WHERE estudiante_id < 3
UNION
SELECT primer_nombre, email FROM Estudiante WHERE estudiante_id >= 3;

-- Consulta con CASE:
SELECT estudiante_id, primer_nombre, primer_apellido, 
    CASE 
        WHEN email LIKE '%@example.com' THEN 'Email corporativo'
        ELSE 'Email personal'
    END AS tipo_email
FROM Estudiante;

-- Actualizar datos:
UPDATE Estudiante SET primer_nombre = 'Juanito' WHERE estudiante_id = 1;

-- Eliminar datos:
DELETE FROM Estudiante WHERE estudiante_id = 5;
```
