INSERT INTO Kunde (KundeID, Name, Email, Adresse) VALUES 
('K12345', 'Max Mueller', 'max.mueller@email.com', 'Musterstraße 1, Stadt'),
('K12346', 'Anna Schmidt', 'anna.schmidt@email.com', 'Beispielweg 2, Stadt'),
('K12347', 'Laura Neumann', 'laura.neumann@email.com', 'Stadtweg 3, Stadt'),
('K12348', 'Felix Becker', 'felix.becker@email.com', 'Landstraße 4, Stadt'),
('K12349', 'Sarah Lehmann', 'sarah.lehmann@email.com', 'Dorfplatz 5, Dorf'),
('K12350', 'David Schröder', 'david.schroeder@email.com', 'Hauptstraße 6, Stadt'),
('K12351', 'Marie Fischer', 'marie.fischer@email.com', 'Parkallee 7, Stadt'),
('K12352', 'Lukas Weber', 'lukas.weber@email.com', 'Seeweg 8, Stadt'),
('K12353', 'Sophia Meyer', 'sophia.meyer@email.com', 'Bergstraße 9, Stadt'),
('K12354', 'Paul Schneider', 'paul.schneider@email.com', 'Flussufer 10, Stadt');

INSERT INTO Auftrag (AuftragID, KundeID, Bestelldatum, Lieferdatum, Status) VALUES 
('A38658', 'K12345', '2023-01-15', '2023-03-20', 'in Bearbeitung'),
('A38659', 'K12346', '2023-02-01', '2023-04-15', 'abgeschlossen'),
('A38660', 'K12347', '2023-01-20', '2023-03-25', 'in Bearbeitung'),
('A38661', 'K12348', '2023-02-05', '2023-04-20', 'abgeschlossen'),
('A38662', 'K12349', '2023-01-25', '2023-03-30', 'in Bearbeitung'),
('A38663', 'K12350', '2023-02-10', '2023-04-25', 'abgeschlossen'),
('A38664', 'K12351', '2023-01-30', '2023-04-05', 'in Bearbeitung'),
('A38665', 'K12352', '2023-02-15', '2023-05-01', 'abgeschlossen'),
('A38666', 'K12353', '2023-02-20', '2023-05-05', 'in Bearbeitung'),
('A38667', 'K12354', '2023-02-25', '2023-05-10', 'abgeschlossen');

;

INSERT INTO Zugmodell (ZugmodellID, Name, Typ, Kapazitaet) VALUES 
('Z59473', 'Modell A', 'Hochgeschwindigkeit', 250),
('Z59474', 'Modell B', 'Regionalzug', 180),
('Z59475', 'Modell C', 'Stadtbahn', 100),
('Z59476', 'Modell D', 'Güterzug', 400),
('Z59477', 'Modell A', 'Hochgeschwindigkeit', 300),
('Z59478', 'Modell B', 'Regionalzug', 200),
('Z59479', 'Modell C', 'Stadtbahn', 150),
('Z59480', 'Modell D', 'Güterzug', 500),
('Z59481', 'Modell A', 'Hochgeschwindigkeit', 350),
('Z59482', 'Modell B', 'Regionalzug', 250);
;

INSERT INTO Produktionsplan (PlanID, AuftragID, Startdatum, Enddatum, Status) VALUES 
('P47620', 'A38658', '2023-01-20', '2023-03-15', 'in Bearbeitung'),
('P47621', 'A38659', '2023-02-05', '2023-04-10', 'abgeschlossen'),
('P47622', 'A38660', '2023-01-25', '2023-03-20', 'in Bearbeitung'),
('P47623', 'A38661', '2023-02-10', '2023-04-15', 'abgeschlossen'),
('P47624', 'A38662', '2023-02-01', '2023-03-28', 'in Bearbeitung'),
('P47625', 'A38663', '2023-02-15', '2023-04-20', 'abgeschlossen'),
('P47626', 'A38664', '2023-02-05', '2023-04-02', 'in Bearbeitung'),
('P47627', 'A38665', '2023-02-20', '2023-04-27', 'abgeschlossen'),
('P47628', 'A38666', '2023-02-25', '2023-05-01', 'in Bearbeitung'),
('P47629', 'A38667', '2023-03-01', '2023-05-15', 'abgeschlossen');

INSERT INTO Komponente (KomponenteID, Name, Typ, Lagerbestand) VALUES 
('K52784', 'Motor', 'Antrieb', 50),
('K52785', 'Steuerungseinheit', 'Elektronik', 30),
('K52786', 'Batterie', 'Elektronik', 40),
('K52787', 'Bremsen', 'Mechanik', 60),
('K52788', 'Türen', 'Mechanik', 30),
('K52789', 'Fenster', 'Glas', 50),
('K52790', 'Sitze', 'Innenausstattung', 200),
('K52791', 'Steuerung', 'Elektronik', 25),
('K52792', 'Lichter', 'Elektronik', 100),
('K52793', 'Räder', 'Mechanik', 80);

INSERT INTO AuftragZugmodell (AuftragID, ZugmodellID) VALUES
('A38660', 'Z59475'),
('A38661', 'Z59476'),
('A38662', 'Z59477'),
('A38663', 'Z59478'),
('A38664', 'Z59479'),
('A38665', 'Z59480'),
('A38666', 'Z59481'),
('A38667', 'Z59482');

INSERT INTO ProduktionsplanKomponente (PlanID, KomponenteID) VALUES
('P47622', 'K52786'),
('P47623', 'K52787'),
('P47624', 'K52788'),
('P47625', 'K52789'),
('P47626', 'K52790'),
('P47627', 'K52791'),
('P47628', 'K52792'),
('P47629', 'K52793');
