<img align="right" width="250" height="47" src="images/Gematik_Logo_Flag_With_Background.png"/> <br/>    
 
# Release Notes api-telematik

## Release Consumer 1.2.1
- Add OptionalInputs to ExternalAuthenticate
  
## Release Consumer 1.2.0
- C_12110: Enable Consumer to sign an access permission to the ePA 3.0 using plain ECDSA signatures

## Release 6.0.0-2
- Fix of invalid Schema in CardService

## Release Consumer 1.1.0
- Remove OptionalInputs from Operation ExternalAuthenticate
- C_11771: Semantic Changes in EncryptionService

## Release 6.0.0
- Extension of operating data in CertificateDataType with Cryptography
- Clarification of connector status information format (similar to GetResourceInformation)
- Removal of Elements "TlsCertSource" and "TlsKeyCrypt" in order to avoid adaptations of OperatingData_vpnzugd_hardened.xsd
- Support of PoPP-26 Feature by adding operations SecureSendAPDU, StartCardSession and StopCardSession in CardService
- Comfort Signature: Integrate error handling of error 4018 inside the operation ActivateComfortSignature
- eIDAS compliant semantic changes in SignatureService 7.4
- Removal of older 7.4 and 7.5 versions of SignatureService

## Release 5.0.8
- C_11600: Extend OperatingData with used TLS-Certificate Source and Algorithm at the Client System Interface

## Release Consumer 1.0.0-1
- Fix: add missing SOAP operations for ReadCertificate
- Fix: update Consumer SOAP actions to match correct WSDL namespace versions

## Release Consumer 1.0.0
- Extend Consumer Operations for "ePA für alle"

## Release 5.0.7
- VSDM: add new DMP elements to documentation in xsd schema
- (editorial) refine project readme
- (editorial) add security and contribution notes with code of conduct
- (editorial) add project license information
- (editorial) add release notes file
- ePA: fix inconsistency in formatCode for ePA service

## Release 5.0.6
- Konnektor: Semantic Changes (C_11276)


## Release 5.0.5
- ePA: Semantic change => If some operation calls are not ePA capable the processing is aborted and returns an error (C_11334)

- ePA: PHRManagementService V2.0.2 added (C_11334)

- Release process: Pipelines for publishing project added


## Release 5.0.4
- ePA: ePA 1.0 interface added (C_11265)

 
- Konnektor: Vesion of xmldsig_hardened.xsd and xmldsig_NFDM_hardened.xsd incremented (correction of C_11022)

 
- ePA: PHRManagementService_V2_5_1.xsd and PHRManagementService_V2_5_1.wsdl removed (correction of C_11196)

 
- ePA: PHRManagementService_V2_0.xsd and PHRManagementService_V2_0.wsdl removed (C_11252)


## Release 5.0.4-Pre2
- ePA: ePA 1.0 interface added (C_11265)

 
- Konnektor: Vesion of xmldsig_hardened.xsd and xmldsig_NFDM_hardened.xsd incremented (correction of C_11022)

 
- ePA: PHRManagementService_V2_5_1.xsd and PHRManagementService_V2_5_1.wsdl removed (correction of C_11196)

 
- ePA: PHRManagementService_V2_0.xsd and PHRManagementService_V2_0.wsdl removed (C_11252)


## Release 5.0.4-Pre1
- ePA: maxOccur changed to 25 in DocumentCategoryList (C_11196)


## Release 5.0.3
- VPN-ZugD: In Operating Data schema locations corrected for namespace imports.


- VZD: Dummy DirectoryAdministration.yaml removed.


## Release 5.0.3-Pre1
C_11076: Made some elements optional in Operating Data

## Release 5.0.2
- ePA: RegEx for UserAgent pattern added


## Release 5.0.1
- Konnektor: Datatype of manifest/Reference/@URI corrected in hardened schemas (C_11022)



## Release 5.0.0
- ePA 2.5: new interface Version PHRManagementService for Feature DiGA; no more support of interfaces for ePA1
