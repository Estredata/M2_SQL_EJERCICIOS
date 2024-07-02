/* Ejercicios LECCION 11 SQL UNION TABLAS JOINS:

En este ejercicio vamos a usar una tabla ya creada llamada base de datos tienda
La tabla customers (clientes/as)
La tabla employees */
SELECT * FROM customers;

SELECT * FROM employees;

-- EJERCICIO 1. ¡¡¡¡RECORDEMOS QUE CROSS JOIN EN ESTE EJERCICIO UNE DOS COLUMNAS CON NOMBRE DISTINTO!!!!!
-- Selecciona el ID, nombre, apellidos de las empleadas y el ID de cada cliente asociado a ellas, usando CROSS JOIN.
SELECT employees.employee_number, employees.first_name, employees.last_name, customers.customer_number
FROM employees
CROSS JOIN customers
WHERE employees.employee_number = customers.sales_rep_employee_number;
-- tambien se puede escribir así
SELECT employees.employee_number, employees.first_name, employees.last_name, customers.customer_number
FROM employees, customers
WHERE employees.employee_number = customers.sales_rep_employee_number;
-- CON ALIAS PODEMOS ESCRIBIRLO ASI
SELECT employees.employee_number AS numero_empleada, 
employees.first_name AS nombre_empleada, 
employees.last_name AS apellido_empleada, 
customers.customer_number AS numero_cliente
FROM employees
CROSS JOIN customers
WHERE employees.employee_number = customers.sales_rep_employee_number;

-- EJERCICIO 2 ¡¡ TENEMOS QUE USAR UN GROUP BY Y SI USAMOS ESTO SIEMPRE VA CON UN HAVING LE PONDREMOS UNA CONDICIÓN si usamos DISTINCT nos aseguramos que no haya duplicados!!!
-- Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando CROSS JOIN.
SELECT employees.employee_number AS numero_empleada, 
employees.first_name AS nombre_empleada, 
employees.last_name AS apellido_empleada 
FROM employees 
CROSS JOIN customers
WHERE employees.employee_number = customers.sales_rep_employee_number
GROUP BY (employees.employee_number)
HAVING COUNT(DISTINCT customers.customer_number)>8;

-- tambien se puede escribir asi ademas con ALIAS  en las columnas 
SELECT employees.employee_number AS numero_empleada, 
employees.first_name AS nombre_empleada, 
employees.last_name AS apellido_empleada
FROM employees, customers
WHERE employees.employee_number = customers.sales_rep_employee_number
GROUP BY (employees.employee_number)
HAVING COUNT(DISTINCT customers.customer_number)>8;

-- EJERCICIO 3
-- Selecciona el nombre y apellidos de las empleadas que tienen clientes de más de un país, usando CROSS JOIN.
SELECT employees.employee_number AS numero_empleada, 
employees.first_name AS nombre_empleada, 
employees.last_name AS apellido_empleada,
COUNT(DISTINCT customers.country) AS clientes_mas_un_pais
FROM employees 
CROSS JOIN customers
WHERE employees.employee_number = customers.sales_rep_employee_number
GROUP BY (employees.employee_number)
HAVING COUNT(DISTINCT customers.country)>1;

-- EJERCICIO 4 ¡¡ TENEMOS QUE USAR INNER ENLAZAMOS DOS TABLAS CON COLUMNAS CON DISTINTOS NOMBRES SÓLO APARECEN EN AMBAS TABLAS LAS FILAS QUE TENGAN COINCIENCIA!!!
-- Selecciona el ID, nombre, apellidos de las empleadas y el ID de cada cliente asociado a ellas, usando INNER JOIN.

SELECT employees.employee_number AS numero_empleada, 
employees.first_name AS nombre_empleada, 
employees.last_name AS apellido_empleada 
FROM employees
INNER JOIN customers
ON employees.employee_number = customers.sales_rep_employee_number;

-- con alias en el nombre de las tablas 
SELECT em.employee_number AS numero_empleada, 
em.first_name AS nombre_empleada, 
em.last_name AS apellido_empleada 
FROM employees AS em
INNER JOIN customers AS cu
ON em.employee_number = cu.sales_rep_employee_number;

-- EJERCICIO 5
-- Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando INNER JOIN.

SELECT em.employee_number AS numero_empleada, 
em.first_name AS nombre_empleada, 
em.last_name AS apellido_empleada 
FROM employees AS em
INNER JOIN customers AS cu
ON em.employee_number = cu.sales_rep_employee_number;
GROUP BY (em.employee_number)
HAVING COUNT(DISTINCT cu.customer_number)>8;

-- EJERCICIO 6
-- Selecciona el nombre y apellidos de las empleadas que tienen clientes de más de un país, usando INNER JOIN.

SELECT em.employee_number AS numero_empleada, 
em.first_name AS nombre_empleada, 
em.last_name AS apellido_empleada,
COUNT(DISTINCT cu.country) AS clientes_mas_un_pais
FROM employees AS em
INNER JOIN customers as cu
WHERE em.employee_number = cu.sales_rep_employee_number
GROUP BY (em.employee_number)
HAVING COUNT(DISTINCT cu.country)>1;

-- EJERCICIO 7 ¡¡ TENEMOS QUE USAR LEFT JOIN  SI QUEREMOS MANTENER TODAS LAS FILAS DE LA TABLA IZQ EN EL RESULTADO!!!
-- Selecciona el ID, nombre, apellidos de todas las empleadas y el ID de cada cliente asociado a ellas (si es que lo tienen).
SELECT em.employee_number AS numero_empleada, 
em.first_name AS nombre_empleada, 
em.last_name AS apellido_empleada,
cu.customer_number AS numero_cliente
FROM employees AS em
LEFT JOIN customers AS cu
ON em.employee_number = cu.sales_rep_employee_number; 

-- EJERCICIO 8
-- Selecciona el ID de todos los clientes, y el nombre, apellidos de las empleadas que llevan sus pedidos (si es que las hay).
SELECT em.employee_number AS numero_empleada, 
em.first_name AS nombre_empleada, 
em.last_name AS apellido_empleada,
cu.customer_number AS numero_cliente
FROM employees AS em
RIGHT JOIN customers AS cu
ON em.employee_number = cu.sales_rep_employee_number; 


-- EJERCICIO 9
-- Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando LEFT JOIN.
SELECT em.employee_number AS numero_empleada, 
em.first_name AS nombre_empleada, 
em.last_name AS apellido_empleada,
COUNT(cu.customer_number) AS numero_cliente
FROM employees AS em
LEFT JOIN customers AS cu
ON em.employee_number = cu.sales_rep_employee_number
GROUP BY em.employee_number
HAVING COUNT(DISTINCT cu.customer_number)>8;

-- EJERCICIO 10
-- Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando RIGHT JOIN.
SELECT em.employee_number AS numero_empleada, 
em.first_name AS nombre_empleada, 
em.last_name AS apellido_empleada,
COUNT(cu.customer_number) AS numero_cliente
FROM employees AS em
RIGHT JOIN customers AS cu
ON em.employee_number = cu.sales_rep_employee_number
GROUP BY em.employee_number
HAVING COUNT(DISTINCT cu.customer_number)>8;
-- EJERCICIO 11
-- Selecciona el nombre y apellidos de las empleadas que tienen clientes de más de un país, usando LEFT JOIN.
SELECT em.employee_number AS numero_empleada, 
em.first_name AS nombre_empleada, 
em.last_name AS apellido_empleada,
COUNT(DISTINCT cu.country) AS clientes_mas_un_pais
FROM employees AS em
LEFT JOIN customers as cu
ON em.employee_number = cu.sales_rep_employee_number
GROUP BY (em.employee_number)
HAVING COUNT(DISTINCT cu.country)>1;


