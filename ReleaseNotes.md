<img align="right" width="250" height="47" src="images/Gematik_Logo_Flag_With_Background.png"/> <br/>    
 
# Release Notes api-telematik

## Release 4.1.4
- VSDM: add new DMP elements to documentation in xsd schema

## Release 4.1.3
- ePA: PHRManagementService_V2_0.xsd and PHRManagementService_V2_0.wsdl removed (C_11252)


## Release 4.1.2
- Konnektor: In Operating Data made some elements and subelements optional (C_11076)
- VZD: Dummy DirectoryAdministration.yaml removed


## Release 4.1.2-Pre1
- C_11076: Made some elements optional in Operating Data


## Release 4.1.1
- Konnektor: Datatype of manifest/Reference/@URI corrected in hardened schemas (C_11022)


## Release 4.1.0-1
- VZD: Update DirectoryAdministration.yaml
- VPNZugD: xsd:base64Binary fixed (C_10996)


## Release 4.1.0
- ePA: Sequence AuditMessages added (C_10890)


## Release 4.0.5-Pre
- epa: new (additional) version 2.0.1 for PHRManagementService (C-10933) 
- epa: new operation GetAuthorizationState in PHRManagementService_2.0.1 (C-10933) 
- epa: new upper limit for DocumentCategoryElement cardinality (PHRManagementService_2.0.1)(C-10836) 


## Release 4.0.4-1
- Structure: File OperatingData_vpnzugd_hardened.xsd added to directory vpnzugd


## Release 4.0.4-0
- Structure: removals from content of the directory /phr corrected


## Release 4.0.4
- VPNZugD: data type of user data specified (C_10805 in ProvisioningService.xsd)
- Structure: directories /tel and /ext linked via subtree with the repo api-ePA
- Structure: content of the directory /phr moved to the repo api-ePA
- Other: Readme updated


## Release 4.0.3-3
- VZD: new operation delete_Directory_Entry_Certificate


## Release 4.0.3-2
Changes for ePA Release 2.0.4-1
- ePA_2.0.4-1: add parameter ProviderEncCertificate to SuspendAccountRequest (AccountManagementService.xsd)


## Release 4.0.3-1
Changes for ePA Release 2.0.4
- ePA_2.0.4: clarification for DocumentUniqueId type (now rim:LongName in KeyManagementService.xsd)
- ePA_2.0.4: changed cardinality of DocumentCategorElement in DocumentCategoryList (C_10796, PHRManagementService_V2_0.xsd)


## Release 4.0.3
- VPN_ZugD: Reverted ProvisioningService namespace to 1.1 (C_10724)
- Konnektor (ePA): Removed PHRService 1.4.0. File names adapted to service version 2.0.1 (C_10725)
- Konnektor (ePA): Removed files PHRService_V2_0.wsdl/xsd (C_10725)
- Konnektor (Operating Data): Update SiteType value range, UpdateMode optional (C_10701)


## Release 4.0.3-Pre1
- ePA 2.0.4: C_10766 - removed GetRecordProviderList from AuthorizationService
- ePA 2.0.4: add version v1.3 in Version History (PHR_Common.xsd)
- ePA 2.0.4: remove pattern from DisplayName of DeviceIdType (PHR_Common.xsd)
- ePA 2.0.4: add include schemaLocation="../../ext/IHE/RMD.xsd" in DocumentManagementService.wsdl


## Release 4.0.2-7
- ePA: bugfix binding "mixed style" (DocumentManagementService.wsdl)


## Release 4.0.2-6
- epa: fixed wrong type of OkDate to dateTime in finishKeyChangeResponse (AccountManagementService.xsd)
- epa: removed wrong parameter RecordIdentifier and DeviceID from GetAuditEvents (AccountManagementService.xsd)
- epa: removed wrong parameter RecordIdentifier and DeviceID from GetAuditEvents (AccountManagementService.xsd)
- epa: fixed wrong parameters in ResumeAccountRequest (AuthorizationService.xsd)
- epa: fixed cardinality of ActorID in GetNotificationInfo to 0..1 (AuthorizationService.xsd)
- epa: fixed cardinality of NotificationInfoListEntry in GetNotificationInfoResponse to unbound (AuthorizationService.xsd)
- epa: added RestrictedUpdateDocumentSet to I_Document_Management (DocumentManagementService.wsdl)
- epa: bugfix Actions in DeleteDocumentSet (DocumentManagementService.wsdl)


## Release 4.0.2-5
- ePA: removed testtreiber_fdv (now in epa/src)
- ePA: Added comments to new RecordStateType elements
- ePA: removed namespace vsd: in PHR_Commons
- ePA: Parameter restriction for GetAuditEvents
- ePA: Changes according to ePA-Maintenance P21.1


## Release 4.0.2-4
- VZD: Header 'Accept: application/json' added to delete_Directory_Entry.
- VSDM: Correction of namespace for schema vsd pkv


## Release 4.0.2-3
- Konnektor: Context added to GetSignatureMode request. CardHandle, Context removed from GetSignatureModeResponse (C_10555)
- Konnektor: Minus character escaped in pattern attribute Shorttext (C_10614)
- FdV: GetNotificationInfoList, GetNotificationInformationRequestDTO added; Spelling corrected (testtreiber_fdv.yaml)
- ePA: Bugfix in AuthorizationService


## Release 4.0.2-2
- FdV: GetNotificationInfoList added
- FdV: GetNotificationInformationRequestDTO added
- FdV: Spelling corrected


## Release 4.0.2-1
- epa: Bugfix in AuthenticationService


# Release 4.0.2
- KSR: limit FQDN according to RFC1035
- VZD/DirectoryAdministration: new operation read_Directory_Entry_for_Sync and removal of enum formats for attribute usage
- VZD/DirectoryAdministraton: renamed owner to holder
- ePA: simplifying APPC Policies (C_10475)
- ePA: new interface GetNotificationInfo (C_10469)
- FDV/testtreiber: interface update
- FDV/testtreiber: errorMessage renamed to statusMessages (C_10385)
- VSDS: update schema Schema_VSD_PKV.xsd and new schema Pruefungsnachweis_PKV.xsd
- VSDS: new values for DMP_Kennzeichnung in Schema_VSD.xsd


## Release 4.0.2-Pre1
- Konnektor: add schema for operating data (C_10340)
- VPNZugD: add operation sendData (C_10340)
- ePA: add operation GetSignedAuditEvents (C_10360)
- ePA: add operation RemoveDocuments (C_10383)
- ePA: fix in operation DeleteDocumentSet
- KSR: limit String length in InfrastrukturKonfig.xsd (C_10314)
- KSR: limit character set for strings (ID, Name, DomainName) (C_10365)
- VSDM: add VSD Schema for PKV (C_10435)
- VZD: updated I_ Directory_Administration read_Directory_Entry: add unlimited results & search parameters telematikID and telematikID-SubStr (C_10334)
- VZD: add attributes countryCode and changeDateTime in data model (C_10334)
- VZD: removed I_Directory_Search (C_10334)


## Release 4.0.1
- Konnektor: C_7009: remove of LDSM
- Konnektor: AuthSignatureService in 2 versions (C_10306)
- Konnektor: fix: version mismatches
- Konnektor: fix: CardService filenames and includes (C_10308)
- Konnektor/ePA: version V2.0.1 is consistent to WSDL
- Konnektor/ePA: renaming in V2_0: changes for V2.0.1 are also included 
- FD/ePA: operations for rekeying R4.0.1
- FD/ePA: correction: <fault name="FaultMessage"> must not contain use="literal"
- Consumer: fix: version mismatches
- VZD: fix: version mismatches
- VZD: Rel. 3.1.3 Hotfix 5 added (C_10299)


## Release 4.0.1-Pre2
- vzd: baseEntryOnly Suchparameter in GET Operation hinzugefügt
- Konnektor: C_10282 - Defaultwert für Parameter "Crypt" aus XML-Schema entfernen
- Konnektor, NFDM: revert C_7098 NFD_Document_1_5 -> 1_4


## Release 4.0.1-Pre1
- VZD: changes in admin interface
- Konnektor: SignatureService hardening of attribute ShortText (C_10147)
- Konnektor: added old schema versions, which must be supported (C_10215)
- Konnektor (Fachmodul ePA): DocumentCategoryEnum improved
- Konnektor (Fachmodul ePA): operation RemoveDocuments removed
- Konnektor (Fachmodul ePA): operation DeleteDocumentSet added
- ePA: Policies for 4.0.1 improved
- ePA: Policy for eArztbrief added


## Release 4.0.0
- ePA: Fehlerkorrektur im PHRManagement- und PHRService
- ePA: APPC-Policies für das kommende Release (neues Berechtigungssystem) angepasst.
- ePA: Einarbeitung von Kommentaren von Aktensystemherstellern (C_10121, C_10117)
- ePA: Berechtigungserteilung zum Zugriff auf die Akte grob-, mittel- und feingranular
- Konnektor (Fachmodul ePA): Unterstützung der Berechtigungserteilung zum Zugriff auf die Akte grob-, mittelgranular
- Konnektor: SignatureService V7.5 unterstützt jetzt die Komfortsignatur (C_6997)
- Basis-KTR-Consumer: Änderungen der Außenschnittstelle EncryptionService und SignatureService in Bezug auf XML-Dokumente (C_10068 und C_10070)


## Release 4.0.0-Pre1
- Änderungen die für ePA 2.0 notwendig wurden 
- Änderungen an der Schnittstelle des VZD, die für das eRezept notwendig wurden 
- Aufnahme von Schemahärtungen für die Signatur Schnittstelle des Konnektors 
- Aufnahme notwendiger Korrekturen und Optimierungen, die sich aus den laufenden Entwicklungs- bzw. Zulassungsprozessen ergeben haben
