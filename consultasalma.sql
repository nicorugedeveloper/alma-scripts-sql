
SELECT e.primer_nombre, e.primer_apellido, c.nombre_clase, p.nombre_profesor
FROM Estudiante e
INNER JOIN EstudianteClase ec ON e.estudiante_id = ec.estudiante_id
INNER JOIN Clase c ON ec.clase_id = c.clase_id
INNER JOIN ProfesorClase pc ON c.clase_id = pc.clase_id
INNER JOIN Profesor p ON pc.profesor_id = p.profesor_id;



SELECT e.primer_nombre, e.primer_apellido, c.nombre_clase, p.nombre_profesor
FROM Estudiante e
LEFT JOIN EstudianteClase ec ON e.estudiante_id = ec.estudiante_id
LEFT JOIN Clase c ON ec.clase_id = c.clase_id
LEFT JOIN ProfesorClase pc ON c.clase_id = pc.clase_id
LEFT JOIN Profesor p ON pc.profesor_id = p.profesor_id;


SELECT primer_nombre, email FROM Estudiante WHERE estudiante_id < 3
UNION
SELECT primer_nombre, email FROM Estudiante WHERE estudiante_id >= 3;


SELECT estudiante_id, primer_nombre, primer_apellido, 
    CASE 
        WHEN email LIKE '%@example.com' THEN 'Email corporativo'
        ELSE 'Email personal'
    END AS tipo_email
FROM Estudiante;


UPDATE Estudiante SET primer_nombre = 'Juanito' WHERE estudiante_id = 1;


DELETE FROM Estudiante WHERE estudiante_id = 5;
