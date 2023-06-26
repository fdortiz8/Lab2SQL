SELECT DISTINCT eo.officeID AS theOfficeID, eo.officeName AS theOfficeName, eo.city AS theOfficeCity
FROM ElectedOffices eo, OfficeHolders oh1, OfficeHolders oh2
WHERE eo.state = 'CA'
    AND eo.officeID = oh1.officeID
    AND eo.officeID = oh2.officeID
    AND oh1.candidateID != oh2.candidateID;