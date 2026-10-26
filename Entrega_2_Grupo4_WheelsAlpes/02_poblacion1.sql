INSERT INTO universidades (id,nombre)
VALUES (1, 'Universidad de Los Alpes');

INSERT INTO universidades (id,nombre)
VALUES (2, 'Universidad Central');

INSERT INTO universidades (id,nombre)
VALUES (3, 'Universidad de Colombia');

INSERT INTO universidades (id,nombre)
VALUES (4, 'Universidad Mayor');

INSERT INTO universidades (id,nombre)
VALUES (5, 'Universidad de Catolica');


INSERT INTO programas (id, nombre, universidad)
VALUES (1, 'Ingenieria de Sistemas', 1);

INSERT INTO programas (id, nombre, universidad)
VALUES (2, 'Ingenieria Biomedica', 1);

INSERT INTO programas (id, nombre, universidad)
VALUES (3, 'Medicina', 2);

INSERT INTO programas (id, nombre, universidad)
VALUES (4, 'Derecho', 2);

INSERT INTO programas (id, nombre, universidad)
VALUES (5, 'Filosofia', 3);

INSERT INTO programas (id, nombre, universidad)
VALUES (6, 'Ingenieria Industrial', 3);

INSERT INTO programas (id, nombre, universidad)
VALUES (7, 'Fisica', 4);

INSERT INTO programas (id, nombre, universidad)
VALUES (8, 'Administracion', 4);

INSERT INTO programas (id, nombre, universidad)
VALUES (9, 'Psicologia', 5);

INSERT INTO programas (id, nombre, universidad)
VALUES (10, 'Economia', 5);

INSERT INTO estudiantes (cedula, nombre, apellido, correo, celular, programa)
VALUES ('1000000001', 'Laura', 'Morales','laura.morales001@ejemplo.com', '3000000001', 1);

INSERT INTO estudiantes (cedula, nombre, apellido, correo, celular, programa)
VALUES ('1000000002', 'Camila', 'Arango','camila.arango001@ejemplo.com', '3000000002', 2);

INSERT INTO estudiantes (cedula, nombre, apellido, correo, celular, programa)
VALUES ('1000000003', 'Jose', 'Jaramillo','jose.jaramillo001@ejemplo.com', '3000000003', 3);

INSERT INTO estudiantes (cedula, nombre, apellido, correo, celular, programa)
VALUES ('1000000004', 'Luis', 'Gomez','luis.gomez001@ejemplo.com', '3000000004', 4);

INSERT INTO estudiantes (cedula, nombre, apellido, correo, celular, programa)
VALUES ('1000000005', 'Luisa', 'Castillo','luisa.castillo001@ejemplo.com', '3000000005', 5);

INSERT INTO estudiantes (cedula, nombre, apellido, correo, celular, programa)
VALUES ('1000000006', 'Carlos', 'Sanchez','carlos.sanchez001@ejemplo.com', '3000000006', 6);

INSERT INTO estudiantes (cedula, nombre, apellido, correo, celular, programa)
VALUES ('1000000007', 'Luisa', 'Fonseca','luisa.fonseca001@ejemplo.com', '3000000007', 7);

INSERT INTO estudiantes (cedula, nombre, apellido, correo, celular, programa)
VALUES ('1000000008', 'Maria', 'Martinez','maria.martinez001@ejemplo.com', '3000000008', 8);

INSERT INTO estudiantes (cedula, nombre, apellido, correo, celular, programa)
VALUES ('1000000009', 'Simon', 'Londoño','simon.londono001@ejemplo.com', '3000000009', 9);

INSERT INTO estudiantes (cedula, nombre, apellido, correo, celular, programa)
VALUES ('1000000010', 'Camilo', 'Sanchez','camilo.sanchez001@ejemplo.com', '3000000010', 10);

BEGIN
    FOR i IN 11..170 LOOP
        INSERT INTO estudiantes (cedula, nombre, apellido, correo, celular, programa)
        VALUES (
            TO_CHAR(1000000000 + i),
            'Estudiante' || i,
            'Prueba' || i,
            'estudiante' || i || '@ejemplo.com',
            TO_CHAR(3000000000 + i),
            MOD(i - 1, 10) + 1
        );
    END LOOP;
END;
/

BEGIN
    FOR i IN 1..20 LOOP
        INSERT INTO vehiculos (placa, marca, modelo, color, estudiante, anio, capacidad)
        VALUES (
            'WHA' || LPAD(i, 3, '0'),
            'Renault',
            'Logan',
            'Blanco',
            TO_CHAR(1000000000 + i),
            2022,
            4
        );
    END LOOP;
END;
/

INSERT INTO localidades (id, nombre)
VALUES (1, 'Chapinero');

INSERT INTO localidades (id, nombre)
VALUES (2, 'Usaquen');

INSERT INTO localidades (id, nombre)
VALUES (3, 'Suba');

INSERT INTO localidades (id, nombre)
VALUES (4, 'Teusaquillo');

INSERT INTO localidades (id, nombre)
VALUES (5, 'Barrios Unidos');

INSERT INTO localidades (id, nombre)
VALUES (6, 'Engativa');

INSERT INTO localidades (id, nombre)
VALUES (7, 'Fontibon');

INSERT INTO localidades (id, nombre)
VALUES (8, 'Kennedy');

INSERT INTO localidades (id, nombre)
VALUES (9, 'Santa Fe');

INSERT INTO localidades (id, nombre)
VALUES (10, 'La Candelaria');


BEGIN
    FOR i IN 1..30 LOOP
        INSERT INTO puntos (id, nombre, direccion, localidad)
        VALUES (
            i,
            'Punto ' || i,
            'Direccion prueba ' || i,
            MOD(i - 1, 10) + 1
        );
    END LOOP;
END;
/


BEGIN
    FOR i IN 1..20 LOOP
        INSERT INTO ruta (id)
        VALUES (i);
    END LOOP;
END;
/

BEGIN
    FOR i IN 1..20 LOOP
        FOR j IN 1..3 LOOP
            INSERT INTO ruta_puntos (ruta, punto, orden, hora)
            VALUES (
                i,
                MOD((i - 1) * 3 + j - 1, 30) + 1,
                j,
                TO_DATE('07:00', 'HH24:MI') + (j - 1) * (10/1440)
            );
        END LOOP;
    END LOOP;
END;
/


BEGIN
    FOR i IN 1..20 LOOP
        FOR j IN 1..4 LOOP
            INSERT INTO viajes (id, salida, sentido, ofrecidos, costo,estado, descripcion, distancia, llegada, vehiculo, universidad, ruta, punto)
            VALUES (
                (i - 1) * 4 + j,
                DATE '2026-09-01' + j - 1 + 7/24,
                'hacia universidad',
                4,
                8000,
                'completado',
                'Viaje prueba ' || i || '-' || j,
                12,
                DATE '2026-09-01' + j - 1 + 7/24 + 45/1440,
                'WHA' || LPAD(i, 3, '0'),
                MOD(i - 1, 5) + 1,
                i,
                MOD((i - 1) * 3, 30) + 1
            );
        END LOOP;
    END LOOP;
END;
/


BEGIN
    FOR i IN 1..20 LOOP
        FOR j IN 1..15 LOOP
            INSERT INTO reservas (estudiante, viaje, punto, fecha, estado_reservas)
            VALUES (
                TO_CHAR(1000000000 + 20 + MOD((i - 1) * 15 + j - 1, 150) + 1),
                (i - 1) * 4 + CEIL(j / 4),
                MOD((i - 1) * 3 + MOD(j - 1, 3), 30) + 1,
                DATE '2026-08-25',
                'aceptada'
            );

        END LOOP;
    END LOOP;
END;
/



INSERT INTO viajes (id, salida, sentido, ofrecidos, costo, estado,descripcion, distancia, llegada, vehiculo,universidad, ruta, punto)
VALUES
(81,
 DATE '2026-11-10' + 7/24,
 'hacia universidad',
 4,
 8000,
 'programado',
 'Viaje programado de prueba',
 12,
 NULL,
 'WHA001',
 1,
 1,
 1);


INSERT INTO viajes (id, salida, sentido, ofrecidos, costo, estado,descripcion, distancia, llegada, vehiculo,universidad, ruta, punto)
VALUES
(82,
 DATE '2026-10-24' + 7/24,
 'hacia universidad',
 4,
 8000,
 'en curso',
 'Viaje en curso de prueba',
 12,
 NULL,
 'WHA002',
 1,
 2,
 4);


INSERT INTO viajes (id, salida, sentido, ofrecidos, costo, estado,descripcion, distancia, llegada, vehiculo,universidad, ruta, punto)
VALUES
(83,
 DATE '2026-10-20' + 7/24,
 'hacia universidad',
 4,
 8000,
 'cancelado',
 'Viaje cancelado de prueba',
 12,
 NULL,
 'WHA003',
 1,
 3,
 7);



INSERT INTO reservas (estudiante, viaje, punto, fecha, estado_reservas)
VALUES ('1000000021', 81, 1, DATE '2026-10-24', 'pendiente');

INSERT INTO reservas (estudiante, viaje, punto, fecha, estado_reservas)
VALUES ('1000000022', 81, 2, DATE '2026-10-24', 'rechazada');

INSERT INTO reservas (estudiante, viaje, punto, fecha, estado_reservas)
VALUES ('1000000023', 83, 7, DATE '2026-10-19', 'cancelada');


-- Viaje programado para pruebas de RF9, RF10, RF4 y RF11
INSERT INTO viajes (id, salida, sentido, ofrecidos, costo, estado, descripcion,
                    distancia, llegada, vehiculo, universidad, ruta, punto)
VALUES (201, TRUNC(SYSDATE) + 20 + 7/24, 'hacia universidad', 4, 8000,
        'programado', 'Viaje programado de prueba', 12, NULL,
        'WHA001', 1, 1, 1);

-- Usuarios de la aplicacion asociados a estudiantes
INSERT INTO wheels_usuario_rol (apex_username, estudiante_cedula, rol)
VALUES ('ESTUDIANTE1', '1000000021', 'PASAJERO');

INSERT INTO wheels_usuario_rol (apex_username, estudiante_cedula, rol)
VALUES ('CONDUCTOR1', '1000000001', 'CONDUCTOR');

COMMIT;
