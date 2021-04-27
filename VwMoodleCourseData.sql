SELECT DISTINCT TblSubjects.txtSubjectName, TblSets.txtSetCode + ' - ' +
	(SELECT RIGHT(CONVERT(varchar(12), (SELECT txtStartYear FROM TblTimetableManagerTimetables WHERE (intPublished = '1'))), 2) 
	+ '-' + RIGHT(CONVERT(varchar(12), CONVERT(int,(SELECT txtStartYear FROM TblTimetableManagerTimetables AS TblTimetableManagerTimetables_5 
	WHERE (intPublished = '1')) + CONVERT(int, 1))), 2) AS txtNCYearRange) AS txtCourseID, TblSubjects.txtSubjectName + ' - ' + TblSets.txtSetCode + ' - ' +
	(SELECT RIGHT(CONVERT(varchar(12), (SELECT txtStartYear FROM TblTimetableManagerTimetables AS TblTimetableManagerTimetables_4
	WHERE (intPublished = '1'))), 2) + '-' + RIGHT(CONVERT(varchar(12), CONVERT(int, (SELECT txtStartYear FROM TblTimetableManagerTimetables AS TblTimetableManagerTimetables_3
	WHERE (intPublished = '1')) + CONVERT(int, 1))), 2) AS txtNCYearRange) AS txtFullName, TblSubjects.txtSubjectName + ' - ' + TblSets.txtSetCode + ' - ' +
	(SELECT RIGHT(CONVERT(varchar(12), (SELECT txtStartYear FROM TblTimetableManagerTimetables AS TblTimetableManagerTimetables_2 
	WHERE (intPublished = '1'))), 2) + '-' + RIGHT(CONVERT(varchar(12), CONVERT(int, (SELECT txtStartYear FROM TblTimetableManagerTimetables AS TblTimetableManagerTimetables_1
	WHERE (intPublished = '1')) + CONVERT(int, 1))), 2) AS txtNCYearRange) AS txtShortName, '52' AS intCategoryID
FROM  TblTeachingManagerSets AS TblSets INNER JOIN TblTeachingManagerSubjects AS TblSubjects ON TblSets.intSubject = TblSubjects.TblTeachingManagerSubjectsID
WHERE (TblSubjects.txtSubjectName NOT IN ('Private Study', 'Non Class', 'Conversation', 'Fixtures', 'Sport', 'Study', 'SEN', 'Lunch/Activities', 'Scholarship', 'Enrichment', 'Lifeskills')) 
UNION ALL
SELECT DISTINCT txtYearName AS txtSubjectName, txtYearName AS txtCourseID, 'iSAMS Sync - ' + txtYearName AS txtFullName, 'iSAMS Sync - ' + txtYearName AS txtShortName, '40' AS intCategoryID
FROM dbo.TblSchoolManagementYears
UNION ALL
SELECT DISTINCT 'iSAMS_Staff' AS txtSubjectName, 'iSAMS_Staff' AS txtCourseID, 'iSAMS Sync - Staff' AS txtFullName, 'iSAMS Sync - Staff' AS txtShortName, '40' AS intCategoryID
UNION ALL
SELECT DISTINCT 'iSAMS_AcademicStaff' AS txtSubjectName, 'iSAMS_AcademicStaff' AS txtCourseID, 'iSAMS Sync - Academic Staff' AS txtFullName, 'iSAMS Sync - Academic Staff' AS txtShortName, '40' AS intCategoryID
UNION ALL
SELECT DISTINCT txtHouseName AS txtSubjectName, txtHouseName AS txtCourseID, 'House - ' + txtHouseName AS txtFullName, 'House - ' + txtHouseName AS txtShortName, '38' AS intCategoryID
FROM dbo.TblSchoolManagementHouses
WHERE txtHouseType = 'Academic'