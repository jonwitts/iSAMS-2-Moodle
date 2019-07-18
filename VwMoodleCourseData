SELECT DISTINCT TblSubjects.txtSubjectName, TblSets.txtSetCode + ' - ' +
                             (SELECT        RIGHT(CONVERT(varchar(12),
                                                             (SELECT        txtStartYear
                                                               FROM            TblTimetableManagerTimetables
                                                               WHERE        (intPublished = '1'))), 2) + '-' + RIGHT(CONVERT(varchar(12), CONVERT(int,
                                                             (SELECT        txtStartYear
                                                               FROM            TblTimetableManagerTimetables AS TblTimetableManagerTimetables_5
                                                               WHERE        (intPublished = '1')) + CONVERT(int, 1))), 2) AS txtNCYearRange) AS txtCourseID, TblSubjects.txtSubjectName + ' - ' + TblSets.txtSetCode + ' - ' +
                             (SELECT        RIGHT(CONVERT(varchar(12),
                                                             (SELECT        txtStartYear
                                                               FROM            TblTimetableManagerTimetables AS TblTimetableManagerTimetables_4
                                                               WHERE        (intPublished = '1'))), 2) + '-' + RIGHT(CONVERT(varchar(12), CONVERT(int,
                                                             (SELECT        txtStartYear
                                                               FROM            TblTimetableManagerTimetables AS TblTimetableManagerTimetables_3
                                                               WHERE        (intPublished = '1')) + CONVERT(int, 1))), 2) AS txtNCYearRange) AS txtFullName, TblSubjects.txtSubjectName + ' - ' + TblSets.txtSetCode + ' - ' +
                             (SELECT        RIGHT(CONVERT(varchar(12),
                                                             (SELECT        txtStartYear
                                                               FROM            TblTimetableManagerTimetables AS TblTimetableManagerTimetables_2
                                                               WHERE        (intPublished = '1'))), 2) + '-' + RIGHT(CONVERT(varchar(12), CONVERT(int,
                                                             (SELECT        txtStartYear
                                                               FROM            TblTimetableManagerTimetables AS TblTimetableManagerTimetables_1
                                                               WHERE        (intPublished = '1')) + CONVERT(int, 1))), 2) AS txtNCYearRange) AS txtShortName, '47' AS intCategoryID
FROM            TblTeachingManagerSets AS TblSets INNER JOIN
                         TblTeachingManagerSubjects AS TblSubjects ON TblSets.intSubject = TblSubjects.TblTeachingManagerSubjectsID
WHERE        (TblSubjects.txtSubjectName <> 'Private Study') AND (TblSubjects.txtSubjectName <> 'Non Class') AND (TblSubjects.txtSubjectName <> 'Conversation') AND (TblSubjects.txtSubjectName <> 'Fixtures') AND 
                         (TblSubjects.txtSubjectName <> 'Sport') AND (TblSubjects.txtSubjectName <> 'Study') AND (TblSubjects.txtSubjectName <> 'SEN')
UNION ALL
SELECT DISTINCT 
                         TblSubjects.txtSubjectName, LEFT('Stf/' + REPLACE(TblSubjects.txtSubjectName, ' ', ''), 100) AS txtCourseID, TblSubjects.txtSubjectName + ' - Staff Area' AS txtFullName, 
                         TblSubjects.txtSubjectName + ' - Staff Area' AS txtShortName, 
                         CASE TblSubjects.txtSubjectName WHEN 'Academic Extension' THEN 6 WHEN 'Arabic' THEN 29 WHEN 'Art' THEN 16 WHEN 'Art Graphic' THEN 16 WHEN 'Art Photography' THEN 22 WHEN 'Art Textiles' THEN 17 WHEN 'Biology'
                          THEN 11 WHEN 'Business Studies' THEN 15 WHEN 'Chemistry' THEN 12 WHEN 'Chinese' THEN 30 WHEN 'Classics' THEN 34 WHEN 'Computer Science' THEN 14 WHEN 'Drama' THEN 18 WHEN 'Economics' THEN 15 WHEN 'English'
                          THEN 27 WHEN 'English as an Additional Language' THEN 28 WHEN 'English Language' THEN 27 WHEN 'English Literature' THEN 27 WHEN 'Film Studies' THEN 19 WHEN 'Fine Art' THEN 16 WHEN 'Fitness' THEN 33 WHEN 'Food Technology'
                          THEN 21 WHEN 'French' THEN 29 WHEN 'Further Mathematics' THEN 23 WHEN 'Geography' THEN 25 WHEN 'German' THEN 29 WHEN 'Greek' THEN 31 WHEN 'Gym' THEN 33 WHEN 'Health Education' THEN 33 WHEN 'History'
                          THEN 26 WHEN 'History of Art' THEN 20 WHEN 'Hockey' THEN 33 WHEN 'Home Economics' THEN 21 WHEN 'Lacrosse' THEN 33 WHEN 'Latin' THEN 31 WHEN 'Learning Support' THEN 37 WHEN 'Mandarin' THEN 30 WHEN 'Mathematics'
                          THEN 23 WHEN 'Music' THEN 32 WHEN 'Music Practice' THEN 32 WHEN 'Netball' THEN 33 WHEN 'Philosophy & Ethics' THEN 36 WHEN 'Physical Education' THEN 33 WHEN 'Physics' THEN 13 WHEN 'Politics' THEN 35 WHEN
                          'Religious Studies' THEN 36 WHEN 'Science' THEN 10 WHEN 'Spanish' THEN 29 WHEN 'Sport' THEN 33 WHEN 'Swimming' THEN 33 WHEN 'Textiles Technology' THEN 17 WHEN 'Theatre Studies' THEN 18 WHEN 'Chinese Mandarin'
                          THEN 30 WHEN 'Drama and Theatre' THEN 18 WHEN 'Extended Project' THEN 6 WHEN 'Gov and Politics' THEN 35 WHEN 'PSHE' THEN 6 WHEN 'Psychology' THEN 45 ELSE 8 END AS intCategoryID
FROM            dbo.TblTeachingManagerSets AS TblSets INNER JOIN
                         dbo.TblTeachingManagerSubjects AS TblSubjects ON TblSets.intSubject = TblSubjects.TblTeachingManagerSubjectsID
WHERE        (TblSubjects.txtSubjectName <> 'Private Study') AND (TblSubjects.txtSubjectName <> 'Non Class') AND (TblSubjects.txtSubjectName <> 'Conversation') AND (TblSubjects.txtSubjectName <> 'Fixtures') AND 
                         (TblSubjects.txtSubjectName <> 'Sport') AND (TblSubjects.txtSubjectName <> 'Study') AND (TblSubjects.txtSubjectName <> 'SEN')
UNION ALL
SELECT DISTINCT txtYearName AS txtSubjectName, txtYearName AS txtCourseID, 'iSAMS Sync - ' + txtYearName AS txtFullName, 'iSAMS Sync - ' + txtYearName AS txtShortName, '40' AS intCategoryID
FROM            dbo.TblSchoolManagementYears
UNION ALL
SELECT DISTINCT 'iSAMS_Staff' AS txtSubjectName, 'iSAMS_Staff' AS txtCourseID, 'iSAMS Sync - Staff' AS txtFullName, 'iSAMS Sync - Staff' AS txtShortName, '40' AS intCategoryID
UNION ALL
SELECT DISTINCT txtHouseName AS txtSubjectName, txtHouseName AS txtCourseID, 'House - ' + txtHouseName AS txtFullName, 'House - ' + txtHouseName AS txtShortName, '38' AS intCategoryID
FROM            dbo.TblSchoolManagementHouses
WHERE        txtHouseType = 'Academic'
