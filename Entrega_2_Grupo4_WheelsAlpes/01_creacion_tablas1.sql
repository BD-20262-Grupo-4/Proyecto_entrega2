CREATE TABLE universidades (
    id NUMBER,
    nombre VARCHAR2(100) NOT NULL
);

ALTER TABLE universidades
ADD CONSTRAINT pk_universidades
PRIMARY KEY (id);


ALTER TABLE universidades 
ADD CONSTRAINT unique_nombre_universidades
UNIQUE (nombre);

CREATE TABLE programas (
    id NUMBER,
    nombre VARCHAR2(100) NOT NULL,
    universidad NUMBER NOT NULL
);

ALTER TABLE programas
ADD CONSTRAINT pk_programas
PRIMARY KEY (id);

ALTER TABLE programas
ADD CONSTRAINT fk_programas_universidad
FOREIGN KEY (universidad)
REFERENCES universidades(id);

CREATE TABLE estudiantes(
    cedula VARCHAR2(20),
    nombre VARCHAR2(100) NOT NULL,
    apellido VARCHAR2(100) NOT NULL,
    correo VARCHAR2(150) NOT NULL,
    celular VARCHAR2(20) NOT NULL,
    programa NUMBER NOT NULL
);

ALTER TABLE estudiantes
ADD CONSTRAINT pk_estudiantes
PRIMARY KEY (cedula);

ALTER TABLE estudiantes
ADD CONSTRAINT unique_correo_estudiantes
UNIQUE (correo);

ALTER TABLE estudiantes
ADD CONSTRAINT fk_estudiantes_programa
FOREIGN KEY (programa)
REFERENCES programas(id);

CREATE TABLE vehiculos(
    placa VARCHAR2(10) NOT NULL,
    marca VARCHAR2(50) NOT NULL,
    modelo VARCHAR2(50) NOT NULL,
    color VARCHAR2(30) NOT NULL,
    estudiante VARCHAR2(20) NOT NULL,
    anio NUMBER NOT NULL,
    capacidad NUMBER NOT NULL
);

ALTER TABLE vehiculos
ADD CONSTRAINT pk_vehiculos
PRIMARY KEY (placa);

ALTER TABLE vehiculos
ADD CONSTRAINT fk_vehiculos_estudiante
FOREIGN KEY (estudiante)
REFERENCES estudiantes(cedula);

ALTER TABLE vehiculos
ADD CONSTRAINT ck_vehiculos_anio
CHECK (anio>0);

ALTER TABLE vehiculos
ADD CONSTRAINT ck_vehiculos_capacidad
CHECK (capacidad>0);

CREATE TABLE localidades(
    id NUMBER, 
    nombre VARCHAR2(100) NOT NULL
);

ALTER TABLE localidades
ADD CONSTRAINT pk_localidades
PRIMARY KEY (id);

ALTER TABLE localidades
ADD CONSTRAINT unique_localidades_nombre
UNIQUE (nombre);

CREATE TABLE puntos(
    id NUMBER,
    nombre VARCHAR2(100) NOT NULL,
    direccion VARCHAR2(200) NOT NULL,
    localidad NUMBER NOT NULL
);

ALTER TABLE puntos
ADD CONSTRAINT pk_puntos
PRIMARY KEY (id);

ALTER TABLE puntos
ADD CONSTRAINT unique_puntos_direccion
UNIQUE (direccion);

ALTER TABLE puntos
ADD CONSTRAINT fk_puntos_localidad
FOREIGN KEY (localidad)
REFERENCES localidades(id);

CREATE TABLE ruta (
    id NUMBER
);

ALTER TABLE ruta
ADD CONSTRAINT pk_ruta
PRIMARY KEY (id);

CREATE TABLE ruta_puntos(
    ruta NUMBER NOT NULL,
    punto NUMBER NOT NULL,
    orden NUMBER NOT NULL,
    hora DATE NOT NULL
);

ALTER TABlE ruta_puntos 
ADD CONSTRAINT pk_ruta_puntos
PRIMARY KEY (ruta,punto);

ALTER TABlE ruta_puntos
ADD CONSTRAINT fk_ruta_puntos_ruta
FOREIGN KEY (ruta)
REFERENCES ruta(id);

ALTER TABlE ruta_puntos
ADD CONSTRAINT fk_ruta_puntos_punto
FOREIGN KEY (punto)
REFERENCES puntos(id);

ALTER TABlE ruta_puntos
ADD CONSTRAINT unique_ruta_puntos_orden
UNIQUE (ruta, orden);

ALTER TABLE ruta_puntos
ADD CONSTRAINT ck_ruta_puntos_orden
CHECK (orden > 0);

CREATE TABLE viajes (
    id NUMBER,
    salida DATE NOT NULL,
    sentido VARCHAR2(20) NOT NULL,
    ofrecidos NUMBER NOT NULL,
    costo NUMBER NOT NULL,
    estado VARCHAR2(20) NOT NULL,
    descripcion VARCHAR2(500) NOT NULL,
    distancia NUMBER NOT NULL,
    llegada DATE,
    vehiculo VARCHAR2(10) NOT NULL,
    universidad NUMBER NOT NULL,
    ruta NUMBER NOT NULL,
    punto NUMBER NOT NULL
);

ALTER TABLE viajes
ADD CONSTRAINT pk_viajes
PRIMARY KEY (id);

ALTER TABLE viajes
ADD CONSTRAINT fk_viajes_vehiculo
FOREIGN KEY (vehiculo)
REFERENCES vehiculos(placa);

ALTER TABLE viajes
ADD CONSTRAINT fk_viajes_universidad
FOREIGN KEY (universidad)
REFERENCES universidades(id);

ALTER TABLE viajes
ADD CONSTRAINT fk_viajes_ruta
FOREIGN KEY (ruta)
REFERENCES ruta(id);

ALTER TABLE viajes
ADD CONSTRAINT fk_viajes_punto
FOREIGN KEY (punto)
REFERENCES puntos(id);

ALTER TABLE viajes
ADD CONSTRAINT ck_viajes_ofrecidos
CHECK (ofrecidos > 0);

ALTER TABLE viajes
ADD CONSTRAINT ck_viajes_costo
CHECK (costo >= 0);

ALTER TABLE viajes
ADD CONSTRAINT ck_viajes_distancia
CHECK (distancia > 0);

ALTER TABLE viajes
ADD CONSTRAINT ck_viajes_estado
CHECK (
    estado = 'programado'
    OR estado = 'en curso'
    OR estado = 'completado'
    OR estado = 'cancelado'
);

ALTER TABLE viajes
ADD CONSTRAINT ck_viajes_sentido
CHECK (
    sentido = 'hacia universidad'
    OR sentido = 'desde universidad'
);

CREATE TABLE reservas(
    estudiante VARCHAR2(20) NOT NULL,
    viaje NUMBER NOT NULL,
    punto NUMBER NOT NULL,
    fecha DATE NOT NULL,
    estado_reservas VARCHAR2(20) NOT NULL
);

ALTER TABLE reservas
ADD CONSTRAINT pk_reservas
PRIMARY KEY (estudiante, viaje);

ALTER TABLE reservas
ADD CONSTRAINT fk_reservas_estudiante
FOREIGN KEY (estudiante)
REFERENCES estudiantes(cedula);

ALTER TABLE reservas
ADD CONSTRAINT fk_reservas_viaje
FOREIGN KEY (viaje)
REFERENCES viajes(id);

ALTER TABLE reservas
ADD CONSTRAINT fk_reservas_punto
FOREIGN KEY (punto)
REFERENCES puntos(id);

ALTER TABLE reservas
ADD CONSTRAINT ck_reservas_estado
CHECK (
    estado_reservas = 'pendiente'
    OR estado_reservas = 'aceptada'
    OR estado_reservas = 'rechazada'
    OR estado_reservas = 'cancelada'
);

  CREATE TABLE "WHEELS_USUARIO_ROL" 
   (	"APEX_USERNAME" VARCHAR2(100) NOT NULL ENABLE, 
	"ESTUDIANTE_CEDULA" VARCHAR2(20) NOT NULL ENABLE, 
	"ROL" VARCHAR2(20) NOT NULL ENABLE, 
	 CONSTRAINT "CK_WHEELS_USUARIO_ROL" CHECK (rol IN (
            'PASAJERO',
            'CONDUCTOR',
            'AMBOS'
        )) ENABLE, 
	 CONSTRAINT "PK_WHEELS_USUARIO_ROL" PRIMARY KEY ("APEX_USERNAME")
  USING INDEX  ENABLE, 
	 CONSTRAINT "UQ_WHEELS_USUARIO_ESTUDIANTE" UNIQUE ("ESTUDIANTE_CEDULA")
  USING INDEX  ENABLE
   ) ;

  ALTER TABLE "WHEELS_USUARIO_ROL" ADD CONSTRAINT "FK_WHEELS_USUARIO_ESTUDIANTE" FOREIGN KEY ("ESTUDIANTE_CEDULA")
	  REFERENCES "ESTUDIANTES" ("CEDULA") ENABLE;



