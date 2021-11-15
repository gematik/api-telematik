 ## Allgemeines
Dieses Repository enthält Schnittstellendefinitionen im XSD- und WSDL-Format für die unten gelisteten Produkttypversionen.
 ## Struktur

| Verzeichnis       | Unterverzeichnis  |Zuordnung 
|---                |---                |---
|cm\                |                   | __Kartenmanagement__
|conn\              |                   | __Konnektorschnittstellen__
|                   |amtss\             | AMTS
|                   |nfds\              | NFDM
|                   |phrs\              | ePA
|                   |tbauth\            | TBAuth
|                   |vsds\              | VSDM
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
### Hinweis zum Umzug der Schnittstelle des Aktensystems
   > Die Schnittstellen des ePA-Aktensystems wurden aus diesem Repository nach https://github.com/gematik/api-ePA.git verlagert und werden hier nicht weiter gepflegt.