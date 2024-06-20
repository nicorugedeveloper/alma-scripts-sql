CREATE DATABASE Alma;
USE Alma;
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


CREATE TABLE Clase (
    clase_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_clase VARCHAR(50) UNIQUE NOT NULL
);


CREATE TABLE Profesor (
    profesor_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_profesor VARCHAR(100) NOT NULL
);


CREATE TABLE IF NOT EXISTS EstudianteClase (
    estudiante_id INT,
    clase_id INT,
    fecha_asignacion DATE DEFAULT (CURRENT_DATE),
    PRIMARY KEY (estudiante_id, clase_id),
    FOREIGN KEY (estudiante_id) REFERENCES Estudiante(estudiante_id),
    FOREIGN KEY (clase_id) REFERENCES Clase(clase_id)
) ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS EstudianteProfesor (
    estudiante_id INT,
    profesor_id INT,
    fecha_asignacion DATE DEFAULT (CURRENT_DATE),
    PRIMARY KEY (estudiante_id, profesor_id),
    FOREIGN KEY (estudiante_id) REFERENCES Estudiante(estudiante_id),
    FOREIGN KEY (profesor_id) REFERENCES Profesor(profesor_id)
) ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS ProfesorClase (
    profesor_id INT,
    clase_id INT,
    fecha_asignacion DATE DEFAULT (CURRENT_DATE),
    PRIMARY KEY (profesor_id, clase_id),
    FOREIGN KEY (profesor_id) REFERENCES Profesor(profesor_id),
    FOREIGN KEY (clase_id) REFERENCES Clase(clase_id)
) ENGINE=InnoDB;


