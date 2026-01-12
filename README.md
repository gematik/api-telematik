<img align="right" width="250" height="47" src="images/Gematik_Logo_Flag_With_Background.png"/> <br/> 

# Telematik API Specification

<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
       <ul>
        <li><a href="#release-notes">Release Notes</a></li>
      </ul>
	</li>
    <li>
      <a href="#Folder Structure">Folder Structure</a>
      <ul>
        <li><a href="#Hint WRT Moving the Interface of the 'ePA-Aktensystem'">Hint WRT Moving the Interface of the 'ePA-Aktensystem'</a></li>
      </ul>
    </li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
  </ol>
</details>

 ## About the Project
This repository contains interface definitions in XSD as well as in WSDL format.

### Release Notes
See [ReleaseNotes.md](./ReleaseNotes.md) for all information regarding the (newest) releases.

 ## Folder Structure

| Folder            | Subfolder         |Content (German)
|---                |---                |---
|cm\                |                   |__Kartenmanagement__
|conn\              |                   |__Konnektorschnittstellen__
|                   |amtss\             |AMTS
|                   |nfds\              |NFDM
|                   |vsds\              |VSDM
|consumer\          |                   | __Basis-/KTR-Consumer__
|ext\               |                   |Schemadateien internationaler Standardisierungsgremien
|ext\\\*hardened*   |                   |Gehärtete Schemadateien, Bezeichner _XSD_HARDENED_
|fa\                |                   |__Fachanwendungen__
|                   |amts\              |Fachdaten AMTS
|                   |nfds\              |Fachdaten NFDM
|                   |vsds\              |Fachdaten VSDM
|ksr\               |                   |__Konfigurationsdienst__
|stoerungsampel\    |                   |__Störungsampel__
|tel\               |                   |__Architektur und übergreifende Dokumente__
|vpnzugd\           |                   |__VPN-Zugangsdienst__
|vzd\               |                   |__Verzeichnisdienst__

## Contributing
If you want to contribute, please check our [CONTRIBUTING.md](./CONTRIBUTING.md). 

## License

Copyright 2025 gematik GmbH

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.

See the [LICENSE](./LICENSE) for the specific language governing permissions and limitations under the License.

## Additional Notes and Disclaimer from gematik GmbH

1. Copyright notice: Each published work result is accompanied by an explicit statement of the license conditions for use. These are regularly typical conditions in connection with open source or free software. Programs described/provided/linked here are free software, unless otherwise stated.
2. Permission notice: Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions::
    1. The copyright notice (Item 1) and the permission notice (Item 2) shall be included in all copies or substantial portions of the Software.
    2. The software is provided "as is" without warranty of any kind, either express or implied, including, but not limited to, the warranties of fitness for a particular purpose, merchantability, and/or non-infringement. The authors or copyright holders shall not be liable in any manner whatsoever for any damages or other claims arising from, out of or in connection with the software or the use or other dealings with the software, whether in an action of contract, tort, or otherwise.
    3. The software is the result of research and development activities, therefore not necessarily quality assured and without the character of a liable product. For this reason, gematik does not provide any support or other user assistance (unless otherwise stated in individual cases and without justification of a legal obligation). Furthermore, there is no claim to further development and adaptation of the results to a more current state of the art.
3. Gematik may remove published results temporarily or permanently from the place of publication at any time without prior notice or justification.
4. Please note: Parts of this code may have been generated using AI-supported technology.’ Please take this into account, especially when troubleshooting, for security analyses and possible adjustments.