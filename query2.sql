SELECT p1.personName AS contributorName, p2.personName AS candidateName, c.contribution AS contribution
FROM Persons p1, Persons p2, Contributions c, CandidatesForOffice cfo
WHERE p1.personID = c.contributorID
    AND p2.personID = cfo.candidateID
    AND c.candidateID = cfo.candidateID
    AND (c.officeID, c.electionDate) = (cfo.officeID, cfo.electionDate)
    AND cfo.party = 'Gold'
ORDER BY c.contribution DESC, p1.personName;