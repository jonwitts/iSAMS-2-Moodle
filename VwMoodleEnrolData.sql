/* SELECT all student's timetabled enrolements */
SELECT dbo.TblPupilManagementPupils.txtForename, dbo.TblPupilManagementPupils.txtSurname, dbo.TblPupilManagementPupils.txtEmailAddress, dbo.TblTeachingManagerSubjects.txtSubjectName, dbo.TblTeachingManagerSets.txtSetCode + ' - ' +
	(SELECT(RIGHT(CONVERT(varchar(12), (SELECT [txtStartYear] FROM [iSAMS].[dbo].[TblTimetableManagerTimetables]
	WHERE intPublished = '1')), 2) + '-' + RIGHT(CONVERT(varchar(12), (CONVERT(int, (SELECT [txtStartYear] FROM [iSAMS].[dbo].[TblTimetableManagerTimetables]
	WHERE intPublished = '1') + CONVERT(int, 1)))), 2)) AS txtNCYearRange) AS txtSetCode, '5' AS intRoleID
FROM dbo.TblTeachingManagerSubjects INNER JOIN dbo.TblTeachingManagerSets ON dbo.TblTeachingManagerSubjects.TblTeachingManagerSubjectsID = dbo.TblTeachingManagerSets.intSubject INNER JOIN dbo.TblTeachingManagerSetLists ON dbo.TblTeachingManagerSets.TblTeachingManagerSetsID = dbo.TblTeachingManagerSetLists.intSetID INNER JOIN dbo.TblPupilManagementPupils ON dbo.TblTeachingManagerSetLists.txtSchoolID = dbo.TblPupilManagementPupils.txtSchoolID
WHERE (dbo.TblPupilManagementPupils.intSystemStatus = 1) AND (dbo.TblPupilManagementPupils.txtEmailAddress IS NOT NULL) AND (dbo.TblTeachingManagerSubjects.txtSubjectName <> 'Private Study') AND (dbo.TblTeachingManagerSubjects.txtSubjectName <> 'Non Class') AND (dbo.TblTeachingManagerSubjects.txtSubjectName <> 'Conversation') AND (dbo.TblTeachingManagerSubjects.txtSubjectName <> 'Fixtures') AND (dbo.TblTeachingManagerSubjects.txtSubjectName <> 'Sport') AND (dbo.TblTeachingManagerSubjects.txtSubjectName <> 'Study') AND (dbo.TblTeachingManagerSubjects.txtSubjectName <> 'SEN')
UNION ALL
/* SELECT all staff's timetabled enrolements - Main teacher */
SELECT TblStaff.Firstname AS txtForename, TblStaff.Surname AS txtSurname, TblStaff.SchoolEmailAddress AS txtEmailAddress, TblTeachingManagerSubjects.txtSubjectName, dbo.TblTeachingManagerSets.txtSetCode + ' - ' +
	(SELECT (RIGHT(CONVERT(varchar(12), (SELECT [txtStartYear] FROM [iSAMS].[dbo].[TblTimetableManagerTimetables]
	WHERE intPublished = '1')), 2) + '-' + RIGHT(CONVERT(varchar(12), (CONVERT(int, (SELECT [txtStartYear] FROM [iSAMS].[dbo].[TblTimetableManagerTimetables]
	WHERE intPublished = '1') + CONVERT(int, 1)))), 2)) AS txtNCYearRange) AS txtSetCode, '3' AS intRoleID
FROM TblTeachingManagerSets INNER JOIN TblTeachingManagerSubjects ON TblTeachingManagerSets.intSubject = TblTeachingManagerSubjects.TblTeachingManagerSubjectsID LEFT OUTER JOIN TblStaff ON TblTeachingManagerSets.txtTeacher = TblStaff.User_Code
WHERE (dbo.TblTeachingManagerSets.txtTeacher IS NOT NULL) AND (TblTeachingManagerSubjects.txtSubjectName <> 'Private Study') AND (dbo.TblTeachingManagerSubjects.txtSubjectName <> 'Non Class') AND (dbo.TblTeachingManagerSubjects.txtSubjectName <> 'Conversation') AND (dbo.TblTeachingManagerSubjects.txtSubjectName <> 'Fixtures') AND (dbo.TblTeachingManagerSubjects.txtSubjectName <> 'Sport') AND (dbo.TblTeachingManagerSubjects.txtSubjectName <> 'Study') AND (dbo.TblTeachingManagerSubjects.txtSubjectName <> 'SEN')
UNION ALL
/* SELECT all staff's timetabled enrolements - Associated teacher */
SELECT TblAssStaff.Firstname AS txtForename, TblAssStaff.Surname AS txtSurname, TblAssStaff.SchoolEmailAddress AS txtEmailAddress, TblTeachingManagerSubjects.txtSubjectName, dbo.TblTeachingManagerSets.txtSetCode + ' - ' +
	(SELECT (RIGHT(CONVERT(varchar(12), (SELECT [txtStartYear] FROM [iSAMS].[dbo].[TblTimetableManagerTimetables]
	WHERE intPublished = '1')), 2) + '-' + RIGHT(CONVERT(varchar(12), (CONVERT(int, (SELECT [txtStartYear] FROM [iSAMS].[dbo].[TblTimetableManagerTimetables]
	WHERE intPublished = '1') + CONVERT(int, 1)))), 2)) AS txtNCYearRange) AS txtSetCode, '3' AS intRoleID
FROM TblStaff AS TblAssStaff INNER JOIN TblTeachingManagerSetAssociatedTeachers ON TblAssStaff.User_Code = TblTeachingManagerSetAssociatedTeachers.txtTeacher INNER JOIN TblTeachingManagerSubjects INNER JOIN TblTeachingManagerSets ON TblTeachingManagerSubjects.TblTeachingManagerSubjectsID = TblTeachingManagerSets.intSubject ON TblTeachingManagerSetAssociatedTeachers.intSetID = TblTeachingManagerSets.TblTeachingManagerSetsID
WHERE (dbo.TblTeachingManagerSetAssociatedTeachers.txtTeacher IS NOT NULL) AND (TblTeachingManagerSubjects.txtSubjectName <> 'Private Study') AND (dbo.TblTeachingManagerSubjects.txtSubjectName <> 'Non Class') AND (dbo.TblTeachingManagerSubjects.txtSubjectName <> 'Conversation') AND (dbo.TblTeachingManagerSubjects.txtSubjectName <> 'Fixtures') AND (dbo.TblTeachingManagerSubjects.txtSubjectName <> 'Sport') AND (dbo.TblTeachingManagerSubjects.txtSubjectName <> 'Study') AND (dbo.TblTeachingManagerSubjects.txtSubjectName <> 'SEN')
UNION
/* SELECT all departmental staff - Main teacher */
SELECT DISTINCT TblStaff.Firstname AS txtForename, TblStaff.Surname AS txtSurname, TblStaff.SchoolEmailAddress AS txtEmailAddress, TblTeachingManagerSubjects.txtSubjectName + ' - Staff Area' AS txtSubjectName, LEFT('Stf/' + REPLACE(TblTeachingManagerSubjects.txtSubjectName, ' ', ''), 100) AS txtSetCode, '3' AS intRoleID
FROM TblTeachingManagerSets INNER JOIN TblTeachingManagerSubjects ON TblTeachingManagerSets.intSubject = TblTeachingManagerSubjects.TblTeachingManagerSubjectsID LEFT OUTER JOIN TblStaff ON TblTeachingManagerSets.txtTeacher = TblStaff.User_Code
WHERE (dbo.TblTeachingManagerSets.txtTeacher IS NOT NULL) AND (TblTeachingManagerSubjects.txtSubjectName <> 'Private Study') AND (dbo.TblTeachingManagerSubjects.txtSubjectName <> 'Non Class') AND (dbo.TblTeachingManagerSubjects.txtSubjectName <> 'Conversation') AND (dbo.TblTeachingManagerSubjects.txtSubjectName <> 'Fixtures') AND (dbo.TblTeachingManagerSubjects.txtSubjectName <> 'Sport') AND (dbo.TblTeachingManagerSubjects.txtSubjectName <> 'Study') AND (dbo.TblTeachingManagerSubjects.txtSubjectName <> 'SEN')
UNION
/* SELECT all departmental staff - Associated teacher */
SELECT DISTINCT TblAssStaff.Firstname AS txtForename, TblAssStaff.Surname AS txtSurname, TblAssStaff.SchoolEmailAddress AS txtEmailAddress, TblTeachingManagerSubjects.txtSubjectName + ' - Staff Area' AS txtSubjectName, LEFT('Stf/' + REPLACE(TblTeachingManagerSubjects.txtSubjectName, ' ', ''), 100) AS txtSetCode, '3' AS intRoleID
FROM TblStaff AS TblAssStaff INNER JOIN TblTeachingManagerSetAssociatedTeachers ON TblAssStaff.User_Code = TblTeachingManagerSetAssociatedTeachers.txtTeacher INNER JOIN TblTeachingManagerSubjects INNER JOIN TblTeachingManagerSets ON TblTeachingManagerSubjects.TblTeachingManagerSubjectsID = TblTeachingManagerSets.intSubject ON TblTeachingManagerSetAssociatedTeachers.intSetID = TblTeachingManagerSets.TblTeachingManagerSetsID
WHERE (dbo.TblTeachingManagerSetAssociatedTeachers.txtTeacher IS NOT NULL) AND (TblTeachingManagerSubjects.txtSubjectName <> 'Private Study') AND (dbo.TblTeachingManagerSubjects.txtSubjectName <> 'Non Class') AND (dbo.TblTeachingManagerSubjects.txtSubjectName <> 'Conversation') AND (dbo.TblTeachingManagerSubjects.txtSubjectName <> 'Fixtures') AND (dbo.TblTeachingManagerSubjects.txtSubjectName <> 'Sport') AND (dbo.TblTeachingManagerSubjects.txtSubjectName <> 'Study') AND (dbo.TblTeachingManagerSubjects.txtSubjectName <> 'SEN')
UNION ALL
/* SELECT all student Year Groups */
SELECT DISTINCT dbo.TblPupilManagementPupils.txtForename, dbo.TblPupilManagementPupils.txtSurname, dbo.TblPupilManagementPupils.txtEmailAddress, dbo.TblSchoolManagementYears.txtYearName AS txtSubjectName, dbo.TblSchoolManagementYears.txtYearName AS txtSetCode, '5' AS intRoleID
FROM dbo.TblSchoolManagementYears INNER JOIN dbo.TblPupilManagementPupils ON dbo.TblSchoolManagementYears.intNCYear = dbo.TblPupilManagementPupils.intNCYear
WHERE (dbo.TblPupilManagementPupils.intSystemStatus = 1) AND (dbo.TblPupilManagementPupils.txtEmailAddress IS NOT NULL)
UNION ALL
/* SELECT all staff */
SELECT DISTINCT Firstname AS txtForename, Surname AS txtSurname, SchoolEmailAddress AS txtEmailAddress, 'iSAMS_Staff' AS txtSubjectName, 'iSAMS_Staff' AS txtSetCode, '5' AS intRoleID
FROM dbo.TblStaff
WHERE (SchoolEmailAddress IS NOT NULL) AND (SchoolEmailAddress <> '') AND (SystemStatus = '1')
UNION ALL
/* SELECT all academic staff */
SELECT DISTINCT Firstname AS txtForename, Surname AS txtSurname, SchoolEmailAddress AS txtEmailAddress, 'iSAMS_AcademicStaff' AS txtSubjectName, 'iSAMS_AcademicStaff' AS txtSetCode, '5' AS intRoleID
FROM dbo.TblStaff
WHERE (SchoolEmailAddress IS NOT NULL) AND (SchoolEmailAddress <> '') AND (SystemStatus = '1') AND (TeachingStaff = '1')
UNION ALL
/* SELECT all student Houses */
SELECT DISTINCT dbo.TblPupilManagementPupils.txtForename, dbo.TblPupilManagementPupils.txtSurname, dbo.TblPupilManagementPupils.txtEmailAddress, dbo.TblPupilManagementPupils.txtAcademicHouse AS txtSubjectName, dbo.TblPupilManagementPupils.txtAcademicHouse AS txtSetCode, '5' AS intRoleID
FROM dbo.TblPupilManagementPupils
WHERE (dbo.TblPupilManagementPupils.intSystemStatus = 1) AND (dbo.TblPupilManagementPupils.txtEmailAddress IS NOT NULL)
UNION ALL
/* SELECT all staff Houses */
SELECT TblStaff.Firstname AS txtForename, TblStaff.Surname AS txtSurname, TblStaff.SchoolEmailAddress AS txtEmailAddress, TblSchoolManagementHouses.txtHouseName AS txtSubjectName, TblSchoolManagementHouses.txtHouseName AS txtSetCode, '5' AS intRoleID
FROM TblSchoolManagementHouses INNER JOIN TblStaffManagementAcademicHouses ON TblSchoolManagementHouses.TblSchoolManagementHousesID = TblStaffManagementAcademicHouses.intAcademicHouse RIGHT OUTER JOIN TblStaff ON TblStaffManagementAcademicHouses.intStaff = TblStaff.TblStaffID
WHERE (SchoolEmailAddress IS NOT NULL) AND (SchoolEmailAddress <> '') AND (SystemStatus = '1') AND (txtHouseName IS NOT NULL)