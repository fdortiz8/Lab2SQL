SELECT DISTINCT p.personName, oh.rating, eo.salary, p.occupation, eo.officeName
FROM Persons p, OfficeHolders oh, ElectedOffices eo
WHERE p.personID = oh.candidateID
    AND p.occupation = IS NOT NULL
    AND oh.officeID = eo.officeID
    AND (oh.rating = 'A' OR oh.rating = 'B')
    AND eo.salary > 125000
    AND eo.officeName LIKE '%or'