# Release 3.1.3-H9
- Konnektor: Context added to GetSignatureMode request. CardHandle, Context removed from GetSignatureModeResponse. (C_10555)
 - Konnektor: Fixed Pattern Attribut Shorttext (C_10614)


# Release 3.1.3-H5
- All: fix version in comments, documentation-, annotation tag and schema to be the same 
 - Konnektor: remove LDSM (LogDatenSendeModul) XSD (C_7009) 


# Release 3.1.3-H5-Pre1
- Konnektor: add Comfort Signature (C_6997)
 - Konnektor: fix versions AuthSignatureService (C_10306)
 - Konnektor: fix CardService filenames and includes (C_10308)
 - VZD: fix for more than 100 search results (C_10299)


# Release 3.1.3-H4.1
NFDM: Fehlerhaft Veröffentlichung von NFD_Document_v1_5.xsd revidiert


# Release 3.1.3-H4
- Konnektor: C_10282 - Defaultwert für Parameter "Crypt" aus XML-Schema entfernen


# Release 3.1.3-H3
- Keine Änderungen gegenüber dem 3.1.3-H3-Pre1


# Release 3.1.3-H3-Pre1
- Konnektor: add old versions of Signature-, Encryption-, Signature Service (C_10215)
 - ePA FD: bugfixing
 - testtreiber_fdv.yaml: remove some mandatory parameter (C_10203)


# Release 3.1.3-1
- ePA: Fehlerkorrektur im PHRManagement- und PHRService 
- ePA: APPC-Policies für das kommende Release (neues Berechtigungssystem) angepasst. 
- ePA: Einarbeitung von Kommentaren von Aktensystemherstellern (C_10121, C_10117)

# Release 3.1.3
testtreiber_fdv.yaml: 
- Korrektur Attributsbezeichnung für XDSDocumentAuthorInstitution
- Entfernen von Default-Werten an der Testtreiberschnittstelle PermissionLeiProp 
- Ermöglichen der Testung der protocolEntries aus dem login 
- Interoperabilitätsproblem in der Testtreiberschnittstelle auflösen  
- Ergänzung Parameter für Codesysteme für Metadaten 
- Korrektur Schreibweise Parameter in Testtreiber 

AuthorizationService.xsd: Fehlerkorrektur Datentyp der DeviceID 

DirectoryAdministration.yaml: VZD DirectoryAdministration Unterstützung der Arbeitsteilung zwischen Kartenherausgeber und TSP 

AccountManagementService.xsd: Datenstruktur für Eingangsnachricht zum Suspendieren des Aktenkontos angepasst

# Release 3.1.2-1
30.10.2019

# Release 3.1.2
07.10.2019

# Release 3.1.1
(26.06.2019)

# Release 3.1.0
15.05.2019

# Release 3.1.0-1
06.06.2019

# Release 3.0.0
01.01.2019
