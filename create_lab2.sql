DROP SCHEMA Lab2 CASCADE; 
CREATE SCHEMA Lab2;

CREATE TABLE Persons(
    personID INT,
    personName VARCHAR(40) NOT NULL,
    city VARCHAR(40),
    state CHAR(2),
    occupation VARCHAR(20),
    isFelon BOOLEAN,
    PRIMARY KEY (personID),
    UNIQUE (personName)
);

CREATE TABLE ElectedOffices(
    officeID INT,
    officeName VARCHAR(20),
    city VARCHAR(40),
    state CHAR(2),
    salary NUMERIC(8,2),
    PRIMARY KEY (officeID),
    UNIQUE (officeName, city, state)
);

CREATE TABLE Elections(
    officeID INT,
    electionDate DATE,
    officeStartDate DATE NOT NULL,
    officeEndDate DATE,
    PRIMARY KEY (officeID, electionDate),
    FOREIGN KEY (officeID) REFERENCES ElectedOffices
);

CREATE TABLE CandidatesForOffice(
    candidateID INT,
    officeID INT,
    electionDate DATE,
    party VARCHAR(20),
    votes INT,
    totalContributions NUMERIC(9,2),
    wonElection BOOLEAN,
    PRIMARY KEY (candidateID, officeID, electionDate),
    FOREIGN KEY (candidateID) REFERENCES Persons(personID),
    FOREIGN key (officeID, electionDate) REFERENCES Elections,
    UNIQUE (officeID, electionDate, party)
);

CREATE TABLE Contributions(
    contributorID INT,
    candidateID INT,
    officeID INT,
    electionDate DATE,
    contribution NUMERIC(8,2) NOT NULL,
    PRIMARY KEY (contributorID, candidateID, officeID, electionDate),
    FOREIGN KEY (contributorID) REFERENCES Persons(personID),
    FOREIGN KEY (candidateID, officeID, electionDate) REFERENCES CandidatesForOffice
);

CREATE TABLE OfficeHolders(
    candidateID INT,
    officeID INT,
    electionDate DATE,
    rating CHAR(1),
    PRIMARY KEY (candidateID, officeID, electionDate),
    FOREIGN KEY (candidateID, officeID, electionDate) REFERENCES CandidatesForOffice
);
