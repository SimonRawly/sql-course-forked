/*
 * Tally Tables Exercise

 * The temporary table, #PatientAdmission, has values for dates between the 1st and 8th January inclusive
 * But not all dates are present
 */

DROP TABLE IF EXISTS #PatientAdmission;
CREATE TABLE #PatientAdmission (AdmittedDate DATE, NumAdmissions INT);
INSERT INTO #PatientAdmission (AdmittedDate, NumAdmissions) VALUES ('2024-01-01', 5)
INSERT INTO #PatientAdmission (AdmittedDate, NumAdmissions) VALUES ('2024-01-02', 6)
INSERT INTO #PatientAdmission (AdmittedDate, NumAdmissions) VALUES ('2024-01-03', 4)
INSERT INTO #PatientAdmission (AdmittedDate, NumAdmissions) VALUES ('2024-01-05', 2)
INSERT INTO #PatientAdmission (AdmittedDate, NumAdmissions) VALUES ('2024-01-08', 2)
SELECT * FROM #PatientAdmission

/*
 * Exercise: create a resultset that has a row for all dates in that period 
 * of 8 days with NumAdmissions set to 0 for missing dates. 
 You may wish to use the SQL statements below to set the start and end dates
 */
/*
DECLARE @StartDate DATE;
DECLARE @EndDate DATE;
SELECT @StartDate = DATEFROMPARTS(2024, 1, 1);
SELECT @EndDate = DATEFROMPARTS(2024, 1, 8);
*/

/*
DECLARE @START_DATE DATE = '2024-01-01'
DECLARE @END_DATE DATE = '2024-01-08'

SELECT DATEADD()

FROM #PatientAdmission
*/

DECLARE @StartDate DATE = '2024-01-01';
DECLARE @EndDate DATE = '2024-01-08';
DECLARE @NUMDAYS INT = DATEDIFF(DAY, @StartDate, @EndDate) +1;
--SELECT @StartDate = DATEFROMPARTS(2024, 1, 1);
--SELECT @EndDate = DATEFROMPARTS(2024, 1, 8);
--SELECT @NUMDAYS = DATEDIFF(DAY, @StartDate, @EndDate) +1;

SELECT T.N
        , DATEADD(DAY, T.N -1, @StartDate)
        , ISNULL(NumAdmissions,0) AS ADMISSIONS

FROM TALLY T

LEFT JOIN #PatientAdmission PA
    ON DATEADD(DAY, T.N -1, @StartDate) = PA.AdmittedDate

WHERE T.N <= @NUMDAYS
   -- AND NumAdmissions IS NULL

-- write your answer here

/*
 * Exercise: list the dates that have no patient admissions
*/

DECLARE @StartDate DATE;
DECLARE @EndDate DATE;
SELECT @StartDate = DATEFROMPARTS(2024, 1, 1);
SELECT @EndDate = DATEFROMPARTS(2024, 1, 8);

-- write your answer here
