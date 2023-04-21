<img width="200" height="37" src="images/Gematik_Logo_Flag.png"/> <br/>

# Telematik API Specification

 ## About the Project
This repository contains interface definitions in XSD as well as in WSDL format.

 ## Folder Structure

| Folder            | Subfolder         |Content (German)
|---                |---                |---
|cm\                |                   |__Kartenmanagement__
|conn\              |                   |__Konnektorschnittstellen__
|                   |amtss\             |AMTS
|                   |nfds\              |NFDM
|                   |phrs\              |ePA
|                   |tbauth\            |TBAuth
|                   |vsds\              |VSDM
|consumer\          |                   | __Basis-/KTR-Consumer__
|ext\               |                   |Schemadateien internationaler Standardisierungsgremien
|ext\\\*hardened*   |                   |Gehärtete Schemadateien, Bezeichner _XSD_HARDENED_
|fa\                |                   |__Fachanwendungen__
|                   |amts\              |Fachdaten AMTS
|                   |nfds\              |Fachdaten NFDM
|                   |vsds\              |Fachdaten VSDM
|fd\                |                   |__Fachdienste__
|                   |phr\               |ePA
|ksr\               |                   |__Konfigurationsdienst__
|stoerungsampel\    |                   |__Störungsampel__
|tel\               |                   |__Architektur und übergreifende Dokumente__
|vpnzugd\           |                   |__VPN-Zugangsdienst__
|vzd\               |                   |__Verzeichnisdienst__
### Hint WRT Moving the Interface of the 'ePA-Aktensystem'

   > The interface of the 'ePA-Aktensystem' has been moved out of this repository over to https://github.com/gematik/api-ePA.git and thus will not be maintained any further here.