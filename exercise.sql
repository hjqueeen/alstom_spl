-- Um alle Auftraege eines bestimmten Kunden zusammen mit den Details des Zugmodells zu erhalten
SELECT K.KundeID, K.Name, A.AuftragID, A.Bestelldatum, A.Lieferdatum, A.Status, Z.ZugmodellID, Z.Name AS ZugmodellName
FROM Kunde K, Auftrag A, AuftragZugmodell AZ, Zugmodell Z
WHERE K.KundeID = A.KundeID
AND A.AuftragID = AZ.AuftragID
AND AZ.ZugmodellID = Z.ZugmodellID;

-- Um alle Auftraege eines bestimmten Kunden zusammen mit den Details des Zugmodells zu erhalten
SELECT K.KundeID, K.Name, A.AuftragID, A.Bestelldatum, A.Lieferdatum, A.Status, Z.ZugmodellID, Z.Name AS ZugmodellName
FROM Kunde K
JOIN Auftrag A ON K.KundeID = A.KundeID
JOIN AuftragZugmodell AZ ON A.AuftragID = AZ.AuftragID
JOIN Zugmodell Z ON AZ.ZugmodellID = Z.ZugmodellID
WHERE K.KundeID = 'K12345'; 