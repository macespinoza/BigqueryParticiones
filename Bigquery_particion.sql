-- Modulo de aprendizaje Bigquery
-- Author: Miguel Cotrina
-- linkedin: https://www.linkedin.com/in/mcotrina/
-- Youtube: https://www.youtube.com/@macespinozaonline
-- Remplazar idproyecto por el ID de tu proyecto
-- Remplazar dataset por el dataset de tu proyecto

CREATE TABLE `idproyecto.dataset.tabla_particionada`
(
  nombre STRING,
  apellido STRING,
  inscripcion DATETIME
)
PARTITION BY DATE(inscripcion);

CREATE TABLE `idproyecto.dataset.tabla_sinparticion`
(
  nombre STRING,
  apellido STRING,
  inscripcion DATETIME
);


insert into `idproyecto.dataset.tabla_sinparticion`(nombre,apellido,inscripcion)
(
select "carlos", "Salazar",cast("2024-03-20" as date)
union all 
select "Mario", "farfan",cast("2024-03-24" as date)
union all 
select "Alex", "Martinez",cast("2024-03-21" as date)
union all 
select "Javier", "Garcia",cast("2024-3-20" as date)
);

insert into `idproyecto.dataset.tabla_particionada`(nombre,apellido,inscripcion)
(
select "carlos", "Salazar",cast("2024-03-20" as date)
union all 
select "Mario", "farfan",cast("2024-03-24" as date)
union all 
select "Alex", "Martinez",cast("2024-03-21" as date)
union all 
select "Javier", "Garcia",cast("2024-3-20" as date)

);

-- Prueba de querys
-- Tablas sin particion

Select * from `idproyecto.dataset.tabla_sinparticion`;
Select nombre from `idproyecto.dataset.tabla_sinparticion`;
select apellido from `idproyecto.dataset.tabla_sinparticion` where inscripcion = cast("2024-03-20" as DATETIME);
select apellido from `idproyecto.dataset.tabla_sinparticion` where inscripcion = cast("2024-03-21" as DATETIME);
select apellido from `idproyecto.dataset.tabla_sinparticion` limit 1;

-- Prueba de querys
-- Tablas Particionadas
Select * from `idproyecto.dataset.tabla_particionada`;
Select nombre from `idproyecto.dataset.tabla_particionada`;
select apellido from `idproyecto.dataset.tabla_particionada` where inscripcion = cast("2024-03-20" as DATETIME);
select apellido from `idproyecto.dataset.tabla_particionada` where inscripcion = cast("2024-03-21" as DATETIME);
select apellido from `idproyecto.dataset.tabla_particionada` limit 1;
