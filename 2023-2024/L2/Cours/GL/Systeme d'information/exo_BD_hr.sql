SELECT first_name AS Prénom, salary AS Salaire, commission_pct AS Commission, hire_date AS "Date d’embauche" 
FROM EMPLOYEES WHERE salary < 10000;


SELECT department_name AS Département, num AS nombre 
FROM DEPARTMENTS NATURAL JOIN (
    SELECT department_id, COUNT(department_id) AS num FROM EMPLOYEES WHERE department_id IS NOT NULL GROUP BY department_id
);

SELECT job_title AS Titre, salaire_moyen FROM JOBS NATURAL JOIN (
    SELECT job_id, AVG(salary) AS Salaire_Moyen FROM EMPLOYEES GROUP BY job_id
) ORDER BY salaire_moyen DESC;


SELECT last_name AS nom, first_name AS prénom, hire_date AS "Date d’embauche", department_name AS departement 
FROM EMPLOYEES JOIN DEPARTMENTS ON EMPLOYEES.department_id = DEPARTMENTS.department_id;


SELECT job_title AS Titre, (max_salary - min_salary) AS différence 
FROM JOBS WHERE max_salary >= 10000 AND max_salary <= 20000;


SELECT first_name AS prenom, salary AS Salaire,(10/100*salary) AS augmentation 
FROM EMPLOYEES WHERE salary >= 2000 AND salary <= 5000;


SELECT first_name AS Prenom, salary AS Salaire,(salary*commission_pct) AS commission FROM EMPLOYEES;


SELECT department_name AS Département FROM DEPARTMENTS JOIN (
    SELECT job_history.department_id AS jh FROM JOB_HISTORY JOIN JOBS ON job_history.job_id = jobs.job_id 
    WHERE min_salary < 5000
) ON DEPARTMENTS.department_id = jh;


SELECT EMPLOYEES.last_name AS NOM, job_title AS Intitulé, DNAME AS "Nom du service", 
city AS Ville, country_name AS "Nom du Pays", region_name AS "Région" 
FROM EMPLOYEES, (
    SELECT job_id AS JID, job_title, department_name AS DNAME, city, country_name, region_name 
    FROM JOBS NATURAL JOIN (
        SELECT * FROM JOB_HISTORY NATURAL JOIN (
            SELECT * FROM DEPARTMENTS NATURAL JOIN (
                SELECT * FROM LOCATIONS NATURAL JOIN (
                    SELECT * FROM COUNTRIES NATURAL JOIN REGIONS
                )
            )
        )
    )
) WHERE EMPLOYEES.job_id = JID;


SELECT last_name AS NOM, first_name AS PRENOM, hire_date AS "Date d’embauche", department_name AS "Nom du département" 
FROM EMPLOYEES JOIN DEPARTMENTS ON EMPLOYEES.department_id = DEPARTMENTS.department_id WHERE EMPLOYEES.department_id = 100;
