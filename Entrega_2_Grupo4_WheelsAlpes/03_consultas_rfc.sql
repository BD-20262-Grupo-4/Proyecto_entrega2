-- RFC1: Demanda (solicitudes de cupo) por localidad en un periodo
SELECT l.nombre AS localidad,
       COUNT(*) AS total_solicitudes
FROM reservas r
INNER JOIN puntos p
    ON r.punto = p.id
INNER JOIN localidades l
    ON p.localidad = l.id
WHERE r.fecha >= DATE '2026-08-25'
  AND r.fecha < DATE '2026-08-26'
GROUP BY l.nombre
ORDER BY total_solicitudes DESC;

-- RFC2: Ingresos estimados por localidad en un periodo
SELECT l.nombre AS localidad,
       COUNT(*) AS pasajeros_confirmados,
       SUM(v.costo) AS ingresos_estimados
FROM reservas r
INNER JOIN viajes v
    ON r.viaje = v.id
INNER JOIN puntos p
    ON r.punto = p.id
INNER JOIN localidades l
    ON p.localidad = l.id
WHERE r.estado_reservas = 'aceptada'
  AND v.estado = 'completado'
  AND v.salida >= DATE '2026-09-01'
  AND v.salida < DATE '2026-09-05'
GROUP BY l.nombre
ORDER BY ingresos_estimados DESC;

-- RFC3: Viajes por conductor a traves del tiempo
SELECT e.cedula AS id_conductor,
       e.nombre || ' ' || e.apellido AS conductor,
       l.nombre AS localidad,
       TRUNC(v.salida) AS fecha_viaje,
       COUNT(v.id) AS total_viajes
FROM viajes v
INNER JOIN vehiculos vh
    ON v.vehiculo = vh.placa
INNER JOIN estudiantes e
    ON vh.estudiante = e.cedula
INNER JOIN puntos p
    ON v.punto = p.id
INNER JOIN localidades l
    ON p.localidad = l.id
WHERE v.estado = 'completado'
  AND v.salida >= DATE '2026-09-01'
  AND v.salida < DATE '2026-09-05'
GROUP BY e.cedula,
         e.nombre,
         e.apellido,
         l.nombre,
         TRUNC(v.salida)
ORDER BY e.cedula, fecha_viaje;
