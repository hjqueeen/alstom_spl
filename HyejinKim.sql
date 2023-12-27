-- ############ --
-- CREATE TABLE --
-- ############ --

CREATE TABLE Kunde (
    KundeID VARCHAR(10),
    Name VARCHAR(100),
    Email VARCHAR(100),
    Adresse VARCHAR(100)
);

CREATE TABLE Auftrag (
    AuftragID VARCHAR(10),
    KundeID VARCHAR(10),
    Bestelldatum TEXT, -- DATE
    Lieferdatum TEXT, -- DATE
    Status VARCHAR(50)
);

CREATE TABLE Zugmodell (
    ZugmodellID VARCHAR(10),
    Name VARCHAR(100),
    Typ VARCHAR(50),
    Kapazitaet INT
);

CREATE TABLE Produktionsplan (
    PlanID VARCHAR(10),
    AuftragID VARCHAR(10),
    Startdatum TEXT, -- DATE
    Enddatum TEXT, -- DATE
    Status VARCHAR(50)
);

CREATE TABLE Komponente (
    KomponenteID VARCHAR(10),
    Name VARCHAR(100),
    Typ VARCHAR(50),
    Lagerbestand INT
);

-- Tabelle fuer die Zuordnung von Auftraegen zu Zugmodellen erstellen
CREATE TABLE AuftragZugmodell (
    AuftragID VARCHAR(10),
    ZugmodellID INT
);

-- Tabelle fuer die Zuordnung von Produktionsplaenen zu Komponenten erstellen
CREATE TABLE ProduktionsplanKomponente (
    PlanID VARCHAR(10),
    KomponenteID INT
);

-- ############# --
-- INSERT VALUES --
-- ############# --

INSERT INTO Kunde (KundeID, Name, Email, Adresse) VALUES 
('K12345', 'Max Mueller', 'max.mueller@email.com', 'Musterstraße 1, Stadt'),
('K12346', 'Anna Schmidt', 'anna.schmidt@email.com', 'Beispielweg 2, Stadt');

INSERT INTO Auftrag (AuftragID, KundeID, Bestelldatum, Lieferdatum, Status) VALUES 
('A38658', 'K12345', '2023-01-15', '2023-03-20', 'in Bearbeitung'),
('A38659', 'K12346', '2023-02-01', '2023-04-15', 'abgeschlossen');

INSERT INTO Zugmodell (ZugmodellID, Name, Typ, Kapazitaet) VALUES 
('Z59473', 'Modell A', 'Hochgeschwindigkeit', 250),
('Z59474', 'Modell B', 'Regionalzug', 180);

INSERT INTO Produktionsplan (PlanID, AuftragID, Startdatum, Enddatum, Status) VALUES 
('P47620', 'A38658', '2023-01-20', '2023-03-15', 'in Bearbeitung'),
('P47621', 'A38659', '2023-02-05', '2023-04-10', 'abgeschlossen');

INSERT INTO Komponente (KomponenteID, Name, Typ, Lagerbestand) VALUES 
('K52784', 'Motor', 'Antrieb', 50),
('K52785', 'Steuerungseinheit', 'Elektronik', 30);

INSERT INTO AuftragZugmodell (AuftragID, ZugmodellID) VALUES 
('A38658', 'Z59473'),
('A38659', 'Z59474');

INSERT INTO ProduktionsplanKomponente (PlanID, KomponenteID) VALUES 
('P47620', 'K52784'),
('P47621', 'K52785');


-- ######## --
-- ABFRAGEN --
-- ######## --

-- Um alle Auftraege eines bestimmten Kunden zusammen mit den Details des Zugmodells zu erhalten
SELECT K.KundeID, K.Name, A.AuftragID, A.Bestelldatum, A.Lieferdatum, A.Status, Z.ZugmodellID, Z.Name AS ZugmodellName
FROM Kunde K
JOIN Auftrag A ON K.KundeID = A.KundeID
JOIN AuftragZugmodell AZ ON A.AuftragID = AZ.AuftragID
JOIN Zugmodell Z ON AZ.ZugmodellID = Z.ZugmodellID
WHERE K.KundeID = 'K12345'; 

-- Um den Gesamtstatus der Produktionsplaene fuer jeden Auftrag anzuzeigen 
SELECT A.AuftragID, A.KundeID, A.Bestelldatum, A.Lieferdatum, A.Status AS AuftragsStatus, P.PlanID, P.Status AS ProduktionsplanStatus
FROM Auftrag A
JOIN Produktionsplan P ON A.AuftragID = P.AuftragID;

-- Anzahl der Auftraege pro Kunde ermitteln
SELECT K.KundeID, K.Name, COUNT(A.AuftragID) AS AnzahlAuftraege
FROM Kunde K
JOIN Auftrag A ON K.KundeID = A.KundeID 
GROUP BY K.KundeID, K.Name;

-- Durchschnittliche Anzahl von Komponenten pro Produktionsplan ermitteln
SELECT P.PlanID, AVG(KomponentenAnzahl) AS DurchschnittlicheAnzahlKomponenten
FROM (
    SELECT PK.PlanID, COUNT(PK.KomponenteID) AS KomponentenAnzahl
    FROM ProduktionsplanKomponente PK
    JOIN Produktionsplan P ON PK.PlanID = P.PlanID
    GROUP BY PK.PlanID
) AS P
GROUP BY P.PlanID;

-- Zugmodelle finden, deren Kapazitaet einen bestimmten Wert überschreitet
SELECT Z.ZugmodellID, Z.Name, Z.Kapazitaet, AZ.AuftragID
FROM Zugmodell Z
JOIN AuftragZugmodell AZ ON Z.ZugmodellID = AZ.ZugmodellID
WHERE Z.Kapazitaet > 200;