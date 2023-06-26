SELECT personID, occupation
FROM Persons p 
WHERE p.personID IN (SELECT candidateID 
                    FROM CandidatesForOffice c 
                    WHERE c.candidateID NOT IN (SELECT m.candidateID
                                                FROM officeHolders m)
);