SELECT e.officeID, e.electionDate, e.officeStartDate, e.officeEndDate 
FROM Elections e 
WHERE (e.officeID, e.electionDate) IN (SELECT DISTINCT o.officeID, o.electionDate
                                    FROM CandidatesForOffice o
                                    WHERE (candidateID) IN (SELECT DISTINCT s.personID
                                            FROM Persons s
                                            WHERE s.isFelon = 'true')
);