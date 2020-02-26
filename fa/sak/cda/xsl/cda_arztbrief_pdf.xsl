<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- gematik revision="\main\rel_ors1\2" -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
 xmlns:fo="http://www.w3.org/1999/XSL/Format"
 xmlns:n1="urn:hl7-org:v3"
 xmlns:sciphox="urn::sciphox-org/sciphox"
 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 version="1.0">

	<!--	
		Organisation: KV Nordrhein
		Autor: Hans-Joachim Marschall
		Stand: 16.09.2011

        Organisation: gematik
        Stand: 12.02.2014
        Änderungen: 
          - font-family von Arial auf Helvetica angepasst
          - XSLT-Version von 1.00 auf 1.0 korrigiert
-->

<xsl:output method="xml" encoding="ISO-8859-1" indent="yes"/>

<xsl:param name="briefkopf">hl7</xsl:param> <!-- Globale Variable, Wert wird über Konsole eingegeben -->
<xsl:param name="logo"></xsl:param> <!-- Globale Variable, Wert wird über Konsole eingegeben -->
<xsl:param name="logorandLinks">9.0cm</xsl:param> <!-- Globale Variable, Wert wird über Konsole eingegeben -->


<xsl:variable name="title">
	<xsl:choose>
		<xsl:when test="/n1:ClinicalDocument/n1:title">
			<xsl:value-of select="/n1:ClinicalDocument/n1:title"/>
		</xsl:when>
		<xsl:otherwise>Clinical Document</xsl:otherwise>
	</xsl:choose>
</xsl:variable>


<xsl:template match="/">
	<xsl:call-template name="start"/>
</xsl:template>


<xsl:template name="start">

	<xsl:element name="fo:root">
		<xsl:attribute name="font-family"><xsl:value-of select="'Helvetica'"/></xsl:attribute>
	
		<xsl:element name="fo:layout-master-set">
			<xsl:element name="fo:simple-page-master">
				<xsl:attribute name="master-name"><xsl:value-of select="'seite'"/></xsl:attribute>
				<xsl:attribute name="page-height"><xsl:value-of select="'29.7cm'"/></xsl:attribute>          <!-- Seitenhoehe -->
				<xsl:attribute name="page-width"><xsl:value-of select="'21cm'"/></xsl:attribute>              <!-- Seitenbreite -->
				<xsl:call-template name="raender">
					<xsl:with-param name="typ" select="$briefkopf"/>
				</xsl:call-template>
				<xsl:element name="fo:region-body">
					<xsl:attribute name="margin-top"><xsl:value-of select="'1.0cm'"/></xsl:attribute>
					<xsl:attribute name="margin-bottom"><xsl:value-of select="'2.0cm'"/></xsl:attribute>
					<xsl:attribute name="margin-left"><xsl:value-of select="'0.0cm'"/></xsl:attribute>
					<xsl:attribute name="margin-right"><xsl:value-of select="'0.0cm'"/></xsl:attribute>
				</xsl:element>
				<xsl:element name="fo:region-before">
					<xsl:attribute name="extent"><xsl:value-of select="'0.0cm'"/></xsl:attribute>
				</xsl:element>
				<xsl:element name="fo:region-after">
					<xsl:attribute name="extent"><xsl:value-of select="'0.4cm'"/></xsl:attribute>
				</xsl:element>
			</xsl:element>
			
			<xsl:element name="fo:page-sequence-master">
				<xsl:attribute name="master-name"><xsl:value-of select="'inhalt'"/></xsl:attribute>
				
				<xsl:element name="fo:repeatable-page-master-reference">
					<xsl:attribute name="master-reference"><xsl:value-of select="'seite'"/></xsl:attribute>
				</xsl:element>
			</xsl:element>
		</xsl:element>  <!-- fo:layout-master-set -->
		
		<xsl:element name="fo:declarations">
			<x:xmpmeta xmlns:x="adobe:ns:meta/">
				<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
					<rdf:Description rdf:about="" xmlns:xmp="http://ns.adobe.com/xap/1.0/"/>
					<rdf:Description rdf:about="" xmlns:pdf="http://ns.adobe.com/pdf/1.3/">
						<pdf:Keywords>PDF FOP Apache XSL-FO</pdf:Keywords>
					</rdf:Description>
					<rdf:Description rdf:about="" xmlns:dc="http://purl.org/dc/elements/1.1/">
						<dc:title>Arztbrief im Format PDF/A-1b</dc:title>
						<dc:subject>PDF/A-1b</dc:subject>
						<dc:creator>Praxisverwaltungssystem / KIS</dc:creator>
					</rdf:Description>
				</rdf:RDF>
			</x:xmpmeta>
		</xsl:element>
		
		<xsl:element name="fo:page-sequence">
			<xsl:attribute name="master-reference"><xsl:value-of select="'inhalt'"/></xsl:attribute>
			
			<xsl:element name="fo:static-content">
				<xsl:attribute name="flow-name"><xsl:value-of select="'xsl-region-before'"/></xsl:attribute>
				<fo:block text-align="left" font-size="8pt"></fo:block>
			</xsl:element>
			
			<xsl:element name="fo:static-content">
				<xsl:attribute name="flow-name"><xsl:value-of select="'xsl-region-after'"/></xsl:attribute>
				<fo:block text-align="right" font-size="8pt">
					Seite <fo:page-number/>
					/ <fo:page-number-citation ref-id="terminator"/>
				</fo:block>
			</xsl:element>
			
			<xsl:element name="fo:flow">
				<xsl:attribute name="flow-name"><xsl:value-of select="'xsl-region-body'"/></xsl:attribute>
				
				<xsl:choose>
					<xsl:when test=" $briefkopf='din' ">
						<xsl:call-template name="DIN"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="Kopfdaten"/>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:call-template name="Trennstrich"/>
				<xsl:if test=" $briefkopf='din' ">
					<xsl:call-template name="Patient"/>
					<xsl:call-template name="Trennstrich"/>
				</xsl:if>
				<xsl:call-template name="Dokumententitel"/>
				<xsl:call-template name="StructuredBody"/>
				<xsl:call-template name="Trennstrich"/>
				<xsl:call-template name="Autor"/>
				<xsl:call-template name="Trennstrich"/>
				<xsl:call-template name="Heilberufler"/>
				<xsl:call-template name="FachAnsprechpartner"/>
				<xsl:call-template name="Hausarzt"/>
				<xsl:call-template name="Notfallkontakt"/>
				<xsl:call-template name="Einweiser"/>
				<xsl:call-template name="Versicherung"/>

				<!-- Endemarke fuer den Seitenzaehler -->
				<xsl:element name="fo:block">
					<xsl:attribute name="id"><xsl:value-of select="'terminator'"/></xsl:attribute>
				</xsl:element>
				
			</xsl:element>
		</xsl:element>

	</xsl:element>  <!-- fo:root -->
</xsl:template>

<xsl:template name="raender">
	<xsl:param name="typ"/>
	<xsl:choose>
		<xsl:when test="$typ='hl7' ">
			<xsl:attribute name="margin-top"><xsl:value-of select="'1.5cm'"/></xsl:attribute>              <!-- oberer Rand -->
			<xsl:attribute name="margin-bottom"><xsl:value-of select="'1.0cm'"/></xsl:attribute>        <!-- unterer Rand -->
			<xsl:attribute name="margin-left"><xsl:value-of select="'1.0cm'"/></xsl:attribute>               <!-- linker Seitenrand -->
			<xsl:attribute name="margin-right"><xsl:value-of select="'1.0cm'"/></xsl:attribute>                <!-- rechter Seitenrand -->
		</xsl:when>
		<xsl:when test="$typ='din' ">
			<xsl:attribute name="margin-top"><xsl:value-of select="'1.5cm'"/></xsl:attribute>              <!-- oberer Rand -->
			<xsl:attribute name="margin-bottom"><xsl:value-of select="'1.0cm'"/></xsl:attribute>        <!-- unterer Rand -->
			<xsl:attribute name="margin-left"><xsl:value-of select="'2.0cm'"/></xsl:attribute>               <!-- linker Seitenrand -->
			<xsl:attribute name="margin-right"><xsl:value-of select="'1.0cm'"/></xsl:attribute>                <!-- rechter Seitenrand -->
		</xsl:when>
	</xsl:choose>
</xsl:template>

<xsl:template name="Kopfdaten">
	<fo:table border="0.5pt solid black" table-layout="fixed" width="100%">
		<xsl:attribute name="space-before"><xsl:value-of select=" '15pt' "/></xsl:attribute>
		<xsl:attribute name="font-size"><xsl:value-of select=" '10pt' "/></xsl:attribute>
		<xsl:attribute name="font-weight"><xsl:value-of select="'normal'"/></xsl:attribute>
		<xsl:attribute name="text-align"><xsl:value-of select="'left'"/></xsl:attribute>
		<xsl:attribute name="space-after.optimum"><xsl:value-of select="'15pt'"/></xsl:attribute>
		<fo:table-column column-width="10.6%"/>   <!-- 100% = 19 cm Seitenbreite -->
		<fo:table-column column-width="44.6%"/>
		<fo:table-column column-width="19.8%"/>
		<fo:table-column column-width="25%"/>
		<fo:table-body>
			<fo:table-row>
				<fo:table-cell padding="2pt" border="0.5pt solid black">
					<fo:block font-style="italic">Patient:	</fo:block>
				</fo:table-cell>
				<fo:table-cell padding="2pt" border="0.5pt solid black">
					<fo:block>
						<xsl:call-template name="getName">
						<xsl:with-param name="name" select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name"/>
						</xsl:call-template>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell padding="2pt" border="0.5pt solid black" text-align="right">
					<fo:block font-style="italic">Patient-Nr: </fo:block>
				</fo:table-cell>
				<fo:table-cell padding="2pt" border="0.5pt solid black">
					<fo:block>
						<xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:id[1]/@extension"/>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
			<fo:table-row>
				<fo:table-cell padding="2pt" border="0.5pt solid black">
					<fo:block font-style="italic">Kontakt: </fo:block>
				</fo:table-cell>
				<fo:table-cell padding="2pt" border="0.5pt solid black">
					<fo:block>
						<xsl:call-template name="getContactInfo">
						<xsl:with-param name="contact" select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole"/>
						</xsl:call-template>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell padding="2pt" border="0.5pt solid black" text-align="right" display-align="center">
					<fo:block font-style="italic">Versichertennummer: </fo:block>
				</fo:table-cell>
				<fo:table-cell padding="2pt" border="0.5pt solid black" display-align="center">
					<fo:block>
						<xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:id[2]/@extension"/>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
			<fo:table-row>
				<fo:table-cell padding="2pt" border="0.5pt solid black">
					<fo:block font-style="italic">geb.:	</fo:block>
				</fo:table-cell>
				<fo:table-cell padding="2pt" border="0.5pt solid black">
					<fo:block>
						<xsl:call-template name="formatDate">
						<xsl:with-param name="date" select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:birthTime/@value"/>
						</xsl:call-template>
						<xsl:text>, </xsl:text>
						<xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:birthplace//n1:city"/>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell padding="2pt" border="0.5pt solid black" text-align="right">
					<fo:block font-style="italic">Geschlecht: </fo:block>
				</fo:table-cell>
				<fo:table-cell padding="2pt" border="0.5pt solid black">
					<fo:block>
						<xsl:variable name="sex" select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:administrativeGenderCode/@code"/>
						<xsl:choose>
							<xsl:when test="$sex='M'">männlich</xsl:when>
							<xsl:when test="$sex='F'">weiblich</xsl:when>
							<xsl:otherwise>unbekannt</xsl:otherwise>
						</xsl:choose>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
			<xsl:if test="/n1:ClinicalDocument/n1:componentOf/n1:encompassingEncounter">
				<xsl:variable name="pointer" select="/n1:ClinicalDocument/n1:componentOf/n1:encompassingEncounter"/>
				<fo:table-row>
					<fo:table-cell padding="2pt" border="0.5pt solid black" number-columns-spanned="4">
						<fo:block><xsl:value-of select="$pointer/n1:code/@displayName"/>
							<xsl:text> vom </xsl:text>
							<xsl:call-template name="formatDate">
								<xsl:with-param name="date" select="$pointer/n1:effectiveTime/n1:low/@value"/>
							</xsl:call-template>
							<xsl:text> bis </xsl:text>
							<xsl:call-template name="formatDate">
								<xsl:with-param name="date" select="$pointer/n1:effectiveTime/n1:high/@value"/>
							</xsl:call-template>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</xsl:if>
			<fo:table-row>
				<fo:table-cell padding="2pt" border="0.5pt solid black">
					<fo:block font-style="italic">Behandeln-</fo:block>
					<fo:block font-style="italic">der Arzt: </fo:block>
				</fo:table-cell>
				<fo:table-cell padding="2pt" border="0.5pt solid black">
					<fo:block>
						<xsl:choose>
							<xsl:when test="/n1:ClinicalDocument/n1:responsibleParty/n1:assignedEntity/n1:assignedPerson/n1:name">
								<xsl:call-template name="getName">
									<xsl:with-param name="name" select="/n1:ClinicalDocument/n1:responsibleParty/n1:assignedEntity/n1:assignedPerson/n1:name"/>
								</xsl:call-template>
								<fo:block/>
								<xsl:call-template name="getContactInfo">
									<xsl:with-param name="contact" select="/n1:ClinicalDocument/n1:responsibleParty/n1:assignedEntity/n1:representedOrganization"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="getName">
									<xsl:with-param name="name" select="/n1:ClinicalDocument/n1:legalAuthenticator/n1:assignedEntity/n1:assignedPerson/n1:name"/>
								</xsl:call-template>
								<fo:block/>
								<xsl:call-template name="getContactInfo">
									<xsl:with-param name="contact" select="/n1:ClinicalDocument/n1:legalAuthenticator/n1:assignedEntity/n1:representedOrganization"/>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell padding="2pt" border="0.5pt solid black" text-align="right" display-align="center">
					<fo:block font-style="italic">Erzeugt am: </fo:block>
				</fo:table-cell>
				<fo:table-cell padding="2pt" border="0.5pt solid black" display-align="center">
					<fo:block>
						<xsl:call-template name="formatDate">
							<xsl:with-param name="date" select="/n1:ClinicalDocument/n1:effectiveTime/@value"/>
						</xsl:call-template>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-body>
	</fo:table>
</xsl:template>


	<!--	Briefkopf angelehnt an die Norm DIN5008
		 1 Zoll = 2,54 cm; 1pt = 1/72 inches; 1pt = 0,03528 cm
-->
<xsl:template name="DIN">
	<fo:table table-layout="fixed" width="100%" margin-top="0cm" margin-bottom="2.0cm">
		<xsl:attribute name="font-weight"><xsl:value-of select="'normal'"/></xsl:attribute>
		<xsl:attribute name="font-style"><xsl:value-of select="'normal'"/></xsl:attribute>
		<xsl:attribute name="text-align"><xsl:value-of select="'left'"/></xsl:attribute>
		<fo:table-column column-width="55%"/>
		<fo:table-column column-width="45%"/>
		<fo:table-body>
			<fo:table-row>
				<fo:table-cell height="1.7cm" padding="0pt" border="1pt none blue"  number-columns-spanned="2">
					<xsl:choose>
						<xsl:when test="string-length($logo) > 0">
							<fo:block border="1pt none black" margin-top="0.0cm" margin-left="{$logorandLinks}">
									<!--  Setzt voraus, dass die Grafik 7.0 cm breit und 1.6 cm hoch ist. Es wird nur bedingt skaliert.
								-->
								<fo:external-graphic src="{$logo}" content-width="7.0cm" content-height="1.6cm"/>
							</fo:block>
						</xsl:when>
						<xsl:otherwise>
							<fo:block margin-top="0.0cm" margin-left="9.0cm">&#160;</fo:block>
						</xsl:otherwise>
					</xsl:choose>
				</fo:table-cell>
			</fo:table-row>
			<fo:table-row>
				<fo:table-cell font-size="6.0pt" padding="0pt">
					<fo:block>
					<xsl:call-template name="getAutorAbsenderzeile">
						<xsl:with-param name="firmenadr" select="/n1:ClinicalDocument/n1:author[1]/n1:assignedAuthor/n1:representedOrganization"/>
					</xsl:call-template>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell font-size="7.5pt" padding-top="3pt">
					<fo:block>
						<xsl:call-template name="getFachAnsprechpartnerAdrZeile">
							<xsl:with-param name="ansprechadr" select="/n1:ClinicalDocument/n1:participant[@typeCode='CALLBCK']/n1:associatedEntity/n1:scopingOrganization"/>
						</xsl:call-template>
					</fo:block>
					<fo:block>
						<xsl:call-template name="getContactTelekom">
							<xsl:with-param name="contact" select="/n1:ClinicalDocument/n1:participant[@typeCode='CALLBCK']/n1:associatedEntity/n1:scopingOrganization"/>
						</xsl:call-template>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
			<fo:table-row>
				<fo:table-cell font-size="10.0pt" padding-top="28.3pt">
					<fo:block>
					<xsl:call-template name="getName">
						<xsl:with-param name="name" select="/n1:ClinicalDocument/n1:informationRecipient/n1:intendedRecipient/n1:informationRecipient/n1:name"/>
					</xsl:call-template>
					</fo:block>
					<fo:block>
					<xsl:apply-templates select="/n1:ClinicalDocument/n1:informationRecipient/n1:intendedRecipient/n1:receivedOrganization/n1:addr"/>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell font-size="7.5pt" padding-top="20pt">
					<fo:block/>
					<xsl:call-template name="DINBrief-Ansprechpartner"/>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-body>
	</fo:table>
</xsl:template>

<xsl:template name="DINBrief-Ansprechpartner">
	<fo:block>
		<fo:table table-layout="fixed" width="100%">
		<fo:table-column column-width="30%"/>
		<fo:table-column column-width="70%"/>
		<fo:table-body font-size="7.5pt" border="0.0pt none black">
			<fo:table-row>
				<fo:table-cell padding="1pt"><fo:block>Ansprechpartner</fo:block></fo:table-cell>
				<fo:table-cell padding="1pt">
					<fo:block>
					<xsl:call-template name="getName">
						<xsl:with-param name="name" select="/n1:ClinicalDocument/n1:participant[@typeCode='CALLBCK']/n1:associatedEntity/n1:associatedPerson"/>
					</xsl:call-template>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
			<fo:table-row>
				<fo:table-cell padding="1pt"><fo:block>Telefon</fo:block></fo:table-cell>
				<fo:table-cell padding="1pt">
					<fo:block>
						<xsl:for-each select="/n1:ClinicalDocument/n1:participant[@typeCode='CALLBCK']/n1:associatedEntity/n1:telecom">
						<xsl:call-template name="chooseTelekomContact">
							<xsl:with-param name="contact" select="@value"/>
							<xsl:with-param name="wert" select=" 'tel' "/>
						</xsl:call-template>
						</xsl:for-each>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
			<fo:table-row>
				<fo:table-cell padding="1pt"><fo:block>Telefax</fo:block></fo:table-cell>
				<fo:table-cell padding="1pt">
					<fo:block>
						<xsl:for-each select="/n1:ClinicalDocument/n1:participant[@typeCode='CALLBCK']/n1:associatedEntity/n1:telecom">
						<xsl:call-template name="chooseTelekomContact">
							<xsl:with-param name="contact" select="@value"/>
							<xsl:with-param name="wert" select=" 'fax' "/>
						</xsl:call-template>
						</xsl:for-each>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
			<fo:table-row>
				<fo:table-cell padding="1pt"><fo:block>E-Mail</fo:block></fo:table-cell>
				<fo:table-cell padding="1pt">
					<fo:block>
						<xsl:for-each select="/n1:ClinicalDocument/n1:participant[@typeCode='CALLBCK']/n1:associatedEntity/n1:telecom">
						<xsl:call-template name="chooseTelekomContact">
							<xsl:with-param name="contact" select="@value"/>
							<xsl:with-param name="wert" select=" 'mail' "/>
						</xsl:call-template>
						</xsl:for-each>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
			<fo:table-row>
				<fo:table-cell padding="1pt"><fo:block>Datum</fo:block></fo:table-cell>
				<fo:table-cell padding="1pt">
					<fo:block>
						<xsl:call-template name="formatDate">
							<xsl:with-param name="date" select="/n1:ClinicalDocument/n1:effectiveTime/@value"/>
						</xsl:call-template>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
			
		</fo:table-body>
		</fo:table>
	</fo:block>
</xsl:template>

<xsl:template name="Autor">
	<fo:table border="0.5pt solid black" table-layout="fixed" width="100%">
		<xsl:attribute name="space-before"><xsl:value-of select=" '15pt' "/></xsl:attribute>
		<xsl:attribute name="font-size"><xsl:value-of select=" '10pt' "/></xsl:attribute>
		<xsl:attribute name="font-weight"><xsl:value-of select="'normal'"/></xsl:attribute>
		<xsl:attribute name="text-align"><xsl:value-of select="'left'"/></xsl:attribute>
		<xsl:attribute name="space-after.optimum"><xsl:value-of select="'15pt'"/></xsl:attribute>
		<fo:table-column column-width="20%"/>   <!-- ca. 10% von 19 cm Seitenbreite -->
		<fo:table-column column-width="80%"/>
		<fo:table-body border="0pt">
			<xsl:for-each select="/n1:ClinicalDocument/n1:author">
				<fo:table-row>
					<fo:table-cell padding="2pt" border-top="0.5pt solid black" border-bottom="0pt none black"
							border-left="0.5pt solid black" border-right="0.5pt solid black">
						<fo:block>Autor:	</fo:block>
					</fo:table-cell>
					<fo:table-cell padding="2pt" border-top="0.5pt solid black" border-bottom="0.8pt dashed black"
							border-left="0.5pt solid black" border-right="0.5pt solid black">
						<fo:block>
							<xsl:call-template name="getName">
							<xsl:with-param name="name" select="n1:assignedAuthor/n1:assignedPerson/n1:name"/>
							</xsl:call-template>
							<xsl:if test="n1:assignedAuthoringDevice">
								<xsl:value-of select="n1:assignedAuthoringDevice/n1:softwareName"/>
							</xsl:if>
							<xsl:text> am </xsl:text>
							<xsl:call-template name="formatDate">
								<xsl:with-param name="date" select="n1:time/@value"/>
							</xsl:call-template>
							<xsl:text> (</xsl:text>
							<xsl:call-template name="rolle_autor">
								<xsl:with-param name="function" select="n1:functionCode/@code"/>
							</xsl:call-template>
							<xsl:text>)</xsl:text>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
				<fo:table-row>
					<fo:table-cell padding="2pt" border-top="0pt none black" border-bottom="0.5pt solid black"
							border-left="0.5pt solid black" border-right="0.5pt solid black">
						<fo:block> </fo:block>
					</fo:table-cell>
					<fo:table-cell padding="2pt" border-top="0pt none black" border-bottom="0.5pt solid black"
							border-left="0.5pt solid black" border-right="0.5pt solid black">
						<fo:block>
							<xsl:call-template name="getContactInfo">
								<xsl:with-param name="contact" select="n1:assignedAuthor/n1:representedOrganization"/>
							</xsl:call-template>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</xsl:for-each>
			<xsl:for-each select="/n1:ClinicalDocument/n1:legalAuthenticator">
				<fo:table-row>
					<fo:table-cell padding="2pt" border-top="0.5pt solid black" border-bottom="0pt none black"
							border-left="0.5pt solid black" border-right="0.5pt solid black">
						<fo:block>Unterzeichnet: </fo:block>
					</fo:table-cell>
					<fo:table-cell padding="2pt" border-top="0.5pt solid black" border-bottom="0.8pt dashed black"
							border-left="0.5pt solid black" border-right="0.5pt solid black">
						<fo:block>
							<xsl:call-template name="getName">
								<xsl:with-param name="name" select="n1:assignedEntity/n1:assignedPerson/n1:name"/>
							</xsl:call-template>
							<xsl:text> am </xsl:text>
							<xsl:call-template name="formatDate">
								<xsl:with-param name="date" select="n1:time/@value"/>
							</xsl:call-template>
							<xsl:text>, </xsl:text>
							<xsl:call-template name="signierung">
								<xsl:with-param name="sign" select="n1:signatureCode/@code"/>
							</xsl:call-template>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
				<fo:table-row>
					<fo:table-cell><fo:block/></fo:table-cell>
					<fo:table-cell padding="2pt" border-top="0pt none black" border-bottom="0.5pt solid black"
							border-left="0.5pt solid black" border-right="0.5pt solid black">
						<fo:block>
							<xsl:call-template name="getContactInfo">
								<xsl:with-param name="contact" select="n1:assignedEntity/n1:representedOrganization"/>
							</xsl:call-template>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</xsl:for-each>
			<xsl:for-each select="/n1:ClinicalDocument/n1:dataEnterer">
				<fo:table-row>
					<fo:table-cell padding="2pt" border-top="0.5pt solid black" border-bottom="0.5pt solid black"
							border-left="0.5pt solid black" border-right="0.5pt solid black">
						<fo:block>Eingegeben durch:</fo:block>
					</fo:table-cell>
					<fo:table-cell padding="2pt" border="0.5pt solid black">
						<fo:block>
							<xsl:call-template name="getName">
								<xsl:with-param name="name" select="n1:assignedEntity/n1:assignedPerson/n1:name"/>
							</xsl:call-template>
							<xsl:if test="n1:time">
								<xsl:value-of select=" ' am ' "/>
								<xsl:call-template name="formatDate">
									<xsl:with-param name="date" select="n1:time/@value"/>
								</xsl:call-template>
							</xsl:if>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</xsl:for-each>
			<xsl:for-each select="/n1:ClinicalDocument/n1:informationRecipient">
				<fo:table-row>
					<fo:table-cell padding="2pt" border-top="0.5pt solid black" border-bottom="0pt none black"
							border-left="0.5pt solid black" border-right="0.5pt solid black">
						<fo:block>Kopie an: </fo:block>
					</fo:table-cell>
					<fo:table-cell padding="2pt" border-top="0.5pt solid black" border-bottom="0.8pt dashed black"
							border-left="0.5pt solid black" border-right="0.5pt solid black">
						<fo:block>
							<xsl:if test="n1:intendedRecipient/n1:informationRecipient">
								<xsl:call-template name="getName">
									<xsl:with-param name="name" select="n1:intendedRecipient/n1:informationRecipient/n1:name"/>
								</xsl:call-template>
								<xsl:if test="n1:intendedRecipient/n1:receivedOrganization">
									<xsl:value-of select="n1:intendedRecipient/n1:receivedOrganization/n1:name"/>
								</xsl:if>
							</xsl:if>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
				<fo:table-row>
					<fo:table-cell><fo:block/></fo:table-cell>
					<fo:table-cell padding="2pt" border-top="0pt none black" border-bottom="0.5pt solid black"
							border-left="0.5pt solid black" border-right="0.5pt solid black">
						<fo:block>
							<xsl:call-template name="getContactInfo">
								<xsl:with-param name="contact" select="n1:intendedRecipient/n1:receivedOrganization"/>
							</xsl:call-template>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</xsl:for-each>
		</fo:table-body>
	</fo:table>
</xsl:template>

<xsl:template name="Heilberufler">
	<xsl:if test="//n1:serviceEvent/n1:performer">
	<fo:table border="0.5pt solid black" table-layout="fixed" width="100%">
		<xsl:attribute name="space-before"><xsl:value-of select=" '15pt' "/></xsl:attribute>
		<xsl:attribute name="font-size"><xsl:value-of select=" '10pt' "/></xsl:attribute>
		<xsl:attribute name="font-weight"><xsl:value-of select="'normal'"/></xsl:attribute>
		<xsl:attribute name="text-align"><xsl:value-of select="'left'"/></xsl:attribute>
		<xsl:attribute name="space-after.optimum"><xsl:value-of select="'15pt'"/></xsl:attribute>
		<fo:table-column column-width="20%"/>   <!-- 4cm sind ca. 20% von 19 cm Seitenbreite -->
		<fo:table-column column-width="80%"/>
		<fo:table-body border="0pt">
			<xsl:for-each select="//n1:serviceEvent/n1:performer">
				<fo:table-row>
					<fo:table-cell padding="2pt" border="0.5pt solid black">
						<fo:block>Heilberufler: </fo:block>
					</fo:table-cell>
					<fo:table-cell padding="2pt" border="0.5pt solid black">
						<fo:block>
							<xsl:call-template name="translateCode">
								<xsl:with-param name="code" select="n1:functionCode"/>
							</xsl:call-template>
							<xsl:call-template name="getName">
								<xsl:with-param name="name" select="n1:assignedEntity/n1:assignedPerson/n1:name"/>
							</xsl:call-template>
							<xsl:text> am </xsl:text>
							<xsl:call-template name="formatDate">
								<xsl:with-param name="date" select="n1:time/@value"/>
							</xsl:call-template>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
				<fo:table-row>
					<fo:table-cell padding="2pt" border="0.5pt solid black">
						<fo:block> </fo:block>
					</fo:table-cell>
					<fo:table-cell padding="2pt" border="0.5pt solid black">
						<fo:block>
							<xsl:call-template name="getContactInfo">
								<xsl:with-param name="contact" select="n1:assignedAuthor/n1:representedOrganization"/>
							</xsl:call-template>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</xsl:for-each>
			<xsl:for-each select="/n1:ClinicalDocument/n1:participant[@typeCode='IND']">
				<fo:table-row>
					<fo:table-cell padding="2pt" border-top="0.5pt solid black" border-bottom="0pt none black"
							border-left="0.5pt solid black" border-right="0.5pt solid black" number-rows-spanned="2">
						<fo:block>Mitbehandelnde</fo:block><fo:block>Heilberufler: </fo:block>
					</fo:table-cell>
					<fo:table-cell padding="2pt" border-top="0.5pt solid black" border-bottom="0.8pt dashed black"
							border-left="0.5pt solid black" border-right="0.5pt solid black">
						<fo:block>
							<xsl:call-template name="getName">
								<xsl:with-param name="name" select="n1:associatedEntity/n1:associatedPerson/n1:name"/>
							</xsl:call-template>
							<xsl:text> am </xsl:text>
							<xsl:call-template name="formatDate">
								<xsl:with-param name="date" select="n1:time/@value"/>
							</xsl:call-template>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
				<fo:table-row>
					<fo:table-cell padding="2pt" border-top="0pt none black" border-bottom="0.5pt solid black"
							border-left="0.5pt solid black" border-right="0.5pt solid black">
						<fo:block>
							<xsl:call-template name="getContactInfo">
								<xsl:with-param name="contact" select="n1:associatedEntity/n1:scopingOrganization"/>
							</xsl:call-template>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</xsl:for-each>
		</fo:table-body>
	</fo:table>
	</xsl:if>
</xsl:template>

	<!-- fachlicher Ansprechpartner
-->
<xsl:template name="FachAnsprechpartner">
	<xsl:if test="/n1:ClinicalDocument/n1:participant[@typeCode='CALLBCK'] and
			/n1:ClinicalDocument/n1:participant/n1:associatedEntity[@classCode='PROV']">
		<fo:table border="0.0pt none black" table-layout="fixed" width="100%">
			<xsl:attribute name="space-before"><xsl:value-of select=" '15pt' "/></xsl:attribute>
			<xsl:attribute name="font-size"><xsl:value-of select=" '10pt' "/></xsl:attribute>
			<xsl:attribute name="font-weight"><xsl:value-of select="'normal'"/></xsl:attribute>
			<xsl:attribute name="text-align"><xsl:value-of select="'left'"/></xsl:attribute>
			<xsl:attribute name="space-after.optimum"><xsl:value-of select="'15pt'"/></xsl:attribute>
			<fo:table-column column-width="20%"/>
			<fo:table-column column-width="80%"/>
			<fo:table-body border="0.5pt solid black">
				<xsl:for-each select="/n1:ClinicalDocument/n1:participant[@typeCode='CALLBCK']">
					<fo:table-row border="0.5pt solid black">
						<fo:table-cell padding="2pt" border="0.5pt solid black">
							<fo:block>Fachlicher</fo:block><fo:block>Ansprechpartner: </fo:block>
						</fo:table-cell>
						<fo:table-cell padding="2pt" border="0.5pt none black">
							<fo:block>
								<xsl:call-template name="getName">
								<xsl:with-param name="name" select="n1:associatedEntity/n1:associatedPerson/n1:name"/>
								</xsl:call-template>
							</fo:block>
							<fo:block>
								<xsl:call-template name="getContactInfo">
									<xsl:with-param name="contact" select="n1:associatedEntity"/>
								</xsl:call-template>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</xsl:for-each>
			</fo:table-body>
		</fo:table>
	</xsl:if>
</xsl:template>

	<!-- Patient
-->
<xsl:template name="Patient">
	<xsl:if test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole">
		<fo:table border="1.0pt none black" table-layout="fixed" width="100%">
			<xsl:attribute name="space-before"><xsl:value-of select=" '7pt' "/></xsl:attribute>
			<xsl:attribute name="font-size"><xsl:value-of select=" '10pt' "/></xsl:attribute>
			<xsl:attribute name="font-weight"><xsl:value-of select="'normal'"/></xsl:attribute>
			<xsl:attribute name="text-align"><xsl:value-of select="'left'"/></xsl:attribute>
			<xsl:attribute name="space-after.optimum"><xsl:value-of select=" '7pt' "/></xsl:attribute>
			<fo:table-column column-width="10%"/>
			<fo:table-column column-width="90%"/>
			<fo:table-body border="0.5pt none black">
				<xsl:for-each select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole">
					<fo:table-row>
						<fo:table-cell padding="1pt" border="0.5pt none black">
							<fo:block>Patient: </fo:block>
						</fo:table-cell>
						<fo:table-cell padding="1pt" border="0.5pt none black">
							<fo:block>
								<xsl:call-template name="getName">
								<xsl:with-param name="name" select="n1:patient/n1:name"/>
								</xsl:call-template>
								<xsl:value-of select=" ', ' "/>
								<xsl:call-template name="getFachAnsprechpartnerAdrZeile">
									<xsl:with-param name="ansprechadr" select="."/>
								</xsl:call-template>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell><fo:block/></fo:table-cell>
						<fo:table-cell padding="1pt">
							<fo:block>
								<xsl:variable name="sex" select="n1:patient/n1:administrativeGenderCode/@code"/>
								<xsl:choose>
									<xsl:when test="$sex='M'">männlich</xsl:when>
									<xsl:when test="$sex='F'">weiblich</xsl:when>
									<xsl:otherwise>unbekannt</xsl:otherwise>
								</xsl:choose>
								<xsl:value-of select=" ', geb. ' "/>
								<xsl:call-template name="formatDate">
								<xsl:with-param name="date" select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:birthTime/@value"/>
								</xsl:call-template>
								<xsl:if test="n1:patient/n1:birthplace//n1:city">
									<xsl:text> in </xsl:text>
									<xsl:value-of select="n1:patient/n1:birthplace//n1:city"/>
								</xsl:if>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</xsl:for-each>
			</fo:table-body>
		</fo:table>
	</xsl:if>
</xsl:template>

	<!-- einweisender Arzt
-->
<xsl:template name="Einweiser">
	<xsl:if test="/n1:ClinicalDocument/n1:participant[@typeCode='REF'] and
			/n1:ClinicalDocument/n1:participant/n1:functionCode[@code='ADMPHYS'] and
			/n1:ClinicalDocument/n1:participant/n1:associatedEntity[@classCode='PROV']">
		<fo:table border="0.0pt none black" table-layout="fixed" width="100%">
			<xsl:attribute name="space-before"><xsl:value-of select=" '15pt' "/></xsl:attribute>
			<xsl:attribute name="font-size"><xsl:value-of select=" '10pt' "/></xsl:attribute>
			<xsl:attribute name="font-weight"><xsl:value-of select="'normal'"/></xsl:attribute>
			<xsl:attribute name="text-align"><xsl:value-of select="'left'"/></xsl:attribute>
			<xsl:attribute name="space-after.optimum"><xsl:value-of select="'15pt'"/></xsl:attribute>
			<xsl:attribute name="keep-together"><xsl:value-of select="'auto'"/></xsl:attribute>
			<fo:table-column column-width="20%"/>
			<fo:table-column column-width="80%"/>
			<fo:table-body border="0.5pt solid black">
				<xsl:for-each select="/n1:ClinicalDocument/n1:participant[@typeCode='REF']">
					<fo:table-row border="0.5pt solid black">
						<fo:table-cell padding="2pt" border="0.5pt solid black">
							<fo:block>Einweisender</fo:block><fo:block>Arzt: </fo:block>
						</fo:table-cell>
						<fo:table-cell padding="2pt" border="0.5pt none black">
							<fo:block>
								<xsl:call-template name="getName">
								<xsl:with-param name="name" select="n1:associatedEntity/n1:associatedPerson/n1:name"/>
								</xsl:call-template>
							</fo:block>
							<fo:block>
								<xsl:call-template name="getName">
									<xsl:with-param name="name" select="n1:associatedEntity/n1:scopingOrganization/n1:name"/>
								</xsl:call-template>
							</fo:block>
							<fo:block>
								<xsl:call-template name="getContactInfo">
									<xsl:with-param name="contact" select="n1:associatedEntity/n1:scopingOrganization"/>
								</xsl:call-template>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</xsl:for-each>
			</fo:table-body>
		</fo:table>
	</xsl:if>
</xsl:template>

	<!-- Hausarzt
-->
<xsl:template name="Hausarzt">
	<xsl:if test="/n1:ClinicalDocument/n1:participant[@typeCode='IND'] and
			/n1:ClinicalDocument/n1:participant/n1:functionCode[@code='PCP'] and
			/n1:ClinicalDocument/n1:participant/n1:associatedEntity[@classCode='PROV']">
		<fo:table border="0.0pt none black" table-layout="fixed" width="100%">
			<xsl:attribute name="space-before"><xsl:value-of select=" '15pt' "/></xsl:attribute>
			<xsl:attribute name="font-size"><xsl:value-of select=" '10pt' "/></xsl:attribute>
			<xsl:attribute name="font-weight"><xsl:value-of select="'normal'"/></xsl:attribute>
			<xsl:attribute name="text-align"><xsl:value-of select="'left'"/></xsl:attribute>
			<xsl:attribute name="space-after.optimum"><xsl:value-of select="'15pt'"/></xsl:attribute>
			<xsl:attribute name="keep-together"><xsl:value-of select="'always'"/></xsl:attribute>
			<fo:table-column column-width="20%"/>
			<fo:table-column column-width="80%"/>
			<fo:table-body border="0.5pt solid black">
				<xsl:for-each select="/n1:ClinicalDocument/n1:participant[@typeCode='IND']/n1:functionCode[@code='PCP']">
					<fo:table-row border="0.5pt solid black">
						<fo:table-cell padding="2pt" border="0.5pt solid black">
							<fo:block>Hausarzt:</fo:block>
						</fo:table-cell>
						<fo:table-cell padding="2pt" border="0.5pt none black">
							<fo:block>
								<xsl:call-template name="getName">
								<xsl:with-param name="name" select="following-sibling::n1:associatedEntity/n1:associatedPerson/n1:name"/>
								</xsl:call-template>
							</fo:block>
							<fo:block>
								<xsl:call-template name="getName">
									<xsl:with-param name="name" select="following-sibling::n1:associatedEntity/n1:scopingOrganization/n1:name"/>
								</xsl:call-template>
							</fo:block>
							<fo:block>
								<xsl:call-template name="getContactInfo">
									<xsl:with-param name="contact" select="following-sibling::n1:associatedEntity/n1:scopingOrganization"/>
								</xsl:call-template>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</xsl:for-each>
			</fo:table-body>
		</fo:table>
	</xsl:if>
</xsl:template>


	<!-- Notfallkontakt
-->
<xsl:template name="Notfallkontakt">
	<xsl:if test="/n1:ClinicalDocument/n1:participant[@typeCode='IND'] and
			/n1:ClinicalDocument/n1:participant/n1:associatedEntity[@classCode='ECON']">
		<fo:table border="0.0pt none black" table-layout="fixed" width="100%">
			<xsl:attribute name="space-before"><xsl:value-of select=" '15pt' "/></xsl:attribute>
			<xsl:attribute name="font-size"><xsl:value-of select=" '10pt' "/></xsl:attribute>
			<xsl:attribute name="font-weight"><xsl:value-of select="'normal'"/></xsl:attribute>
			<xsl:attribute name="text-align"><xsl:value-of select="'left'"/></xsl:attribute>
			<xsl:attribute name="space-after.optimum"><xsl:value-of select="'15pt'"/></xsl:attribute>
			<xsl:attribute name="keep-together"><xsl:value-of select="'auto'"/></xsl:attribute>
			<fo:table-column column-width="20%"/>
			<fo:table-column column-width="80%"/>
			<fo:table-body border="0.5pt solid black">
				<xsl:for-each select="/n1:ClinicalDocument/n1:participant[@typeCode='IND']/n1:associatedEntity[@classCode='ECON']">
					<fo:table-row border="0.5pt solid black">
						<fo:table-cell padding="2pt" border="0.5pt solid black">
							<fo:block>Notfallkontakt:</fo:block>
						</fo:table-cell>
						<fo:table-cell padding="2pt" border="0.5pt none black">
							<fo:block>
								<xsl:call-template name="getName">
								<xsl:with-param name="name" select="n1:associatedPerson/n1:name"/>
								</xsl:call-template>
							</fo:block>
							<fo:block>
								<xsl:call-template name="getName">
									<xsl:with-param name="name" select="n1:scopingOrganization/n1:name"/>
								</xsl:call-template>
							</fo:block>
							<fo:block>
								<xsl:call-template name="getContactInfo">
									<xsl:with-param name="contact" select="n1:scopingOrganization"/>
								</xsl:call-template>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</xsl:for-each>
			</fo:table-body>
		</fo:table>
	</xsl:if>
</xsl:template>

	<!-- Versicherung
-->
<xsl:template name="Versicherung">
	<fo:table border="0.0pt none black" table-layout="fixed" width="100%">
		<xsl:attribute name="space-before"><xsl:value-of select=" '15pt' "/></xsl:attribute>
		<xsl:attribute name="font-size"><xsl:value-of select=" '10pt' "/></xsl:attribute>
		<xsl:attribute name="font-weight"><xsl:value-of select="'normal'"/></xsl:attribute>
		<xsl:attribute name="text-align"><xsl:value-of select="'left'"/></xsl:attribute>
		<xsl:attribute name="space-after.optimum"><xsl:value-of select="'15pt'"/></xsl:attribute>
		<xsl:attribute name="keep-together"><xsl:value-of select="'auto'"/></xsl:attribute>
		<fo:table-column column-width="20%"/>
		<fo:table-column column-width="15%"/>
		<fo:table-column column-width="25%"/>
		<fo:table-column column-width="14%"/>
		<fo:table-column column-width="26%"/>
		<fo:table-body border="0.5pt solid black">
			<xsl:choose>
			<xsl:when test="/n1:ClinicalDocument/n1:participant[@typeCode='HLD'] and
				/n1:ClinicalDocument/n1:participant/n1:associatedEntity[@classCode='POLHOLD']">
				<xsl:for-each select="/n1:ClinicalDocument/n1:participant[@typeCode='HLD']/n1:associatedEntity[@classCode='POLHOLD']">
					<fo:table-row border="0.5pt solid black">
						<fo:table-cell padding="2pt" border="0.5pt solid black">
							<fo:block>Versicherungs-</fo:block><fo:block>Information: </fo:block>
						</fo:table-cell>
						<fo:table-cell padding="2pt" border="0.5pt none black" font-size="9pt">
							<fo:block>Versicherungs-</fo:block>
							<fo:block>nehmer: </fo:block>
						</fo:table-cell>
						<fo:table-cell padding="2pt" border="0.5pt none black">
							<fo:block>
								<xsl:call-template name="getName">
								<xsl:with-param name="name" select="n1:associatedPerson/n1:name"/>
								</xsl:call-template>
							</fo:block>
							<fo:block>
								<xsl:text>ID: </xsl:text>
								<xsl:value-of select="n1:id/@extension"/>
							</fo:block>
							<fo:block>
								<xsl:call-template name="getVersichertenart">
									<xsl:with-param name="vart" select="n1:code/@code"/>
								</xsl:call-template>
							</fo:block>
							<fo:block>
								<xsl:call-template name="getContactInfo">
									<xsl:with-param name="contact" select="."/>
								</xsl:call-template>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding="2pt" border="0.5pt none black" font-size="9pt">
							<fo:block>Versicherung: </fo:block>
						</fo:table-cell>
						<fo:table-cell padding="2pt" border="0.5pt none black">
							<fo:block>
								<xsl:call-template name="getName">
									<xsl:with-param name="name" select="n1:scopingOrganization/n1:name"/>
								</xsl:call-template>
							</fo:block>
							<fo:block>
								<xsl:call-template name="getContactInfo">
									<xsl:with-param name="contact" select="n1:scopingOrganization"/>
								</xsl:call-template>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
				<fo:table-row>
					<fo:table-cell padding="2pt" border="0.5pt solid black">
						<fo:block>Versicherungs-</fo:block><fo:block>Information: </fo:block>
					</fo:table-cell>
					<fo:table-cell padding="2pt" border="0.5pt none black" font-size="9pt">
						<fo:block>Versicherungs-</fo:block>
						<fo:block>nehmer: </fo:block>
					</fo:table-cell>
					<fo:table-cell padding="2pt" border="0.5pt none black">
						<fo:block> </fo:block>
					</fo:table-cell>
					<fo:table-cell padding="2pt" border="0.5pt none black" font-size="9pt">
						<fo:block>Versicherung: </fo:block>
					</fo:table-cell>
					<fo:table-cell padding="2pt" border="0.5pt none black">
						<fo:block> </fo:block>
					</fo:table-cell>
				</fo:table-row>
			</xsl:otherwise>
			</xsl:choose>
		</fo:table-body>
	</fo:table>
</xsl:template>



<xsl:template name="Dokumententitel">
	<fo:table border="0" table-layout="fixed" width="100%">
		<xsl:attribute name="space-before"><xsl:value-of select=" '15pt' "/></xsl:attribute>
		<xsl:attribute name="font-size"><xsl:value-of select=" '12pt' "/></xsl:attribute>
		<xsl:attribute name="font-weight"><xsl:value-of select="'bold'"/></xsl:attribute>
		<xsl:attribute name="text-align"><xsl:value-of select="'left'"/></xsl:attribute>
		<xsl:attribute name="space-after.optimum"><xsl:value-of select="'15pt'"/></xsl:attribute>
		<fo:table-body>
			<fo:table-row>
				<fo:table-cell padding="0pt">
					<fo:block><xsl:value-of select="$title"/></fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-body>
	</fo:table>
</xsl:template>


<!-- medizinische Daten -->
<xsl:template name="StructuredBody">
	<xsl:apply-templates select="//n1:component/n1:structuredBody | //n1:component/n1:nonXMLBody"/>
</xsl:template>

<xsl:template match="//n1:component/n1:structuredBody">
	<xsl:apply-templates select="n1:component/n1:section"/>
</xsl:template>

<xsl:template match="n1:component/n1:section">

	<xsl:apply-templates select="n1:title">
		<xsl:with-param name="code" select="n1:code/@code"/>
	</xsl:apply-templates>

	<fo:block space-after="20pt">
		<xsl:apply-templates select="n1:text"/>
	</fo:block>	
</xsl:template>



<xsl:template match="n1:title">
	<xsl:param name="code" select="''"/>
	<fo:block keep-with-next="always"><xsl:value-of select="."/></fo:block>
</xsl:template>

<xsl:template match="n1:text">
	<xsl:choose>
		<xsl:when test="child::*">
			<xsl:choose>
				<xsl:when test="preceding-sibling::n1:code[attribute::code='29308-4']">
					<fo:block space-before="2pt" space-after="10pt" start-indent="1cm">
						<xsl:apply-templates mode="diagnose"/>
					</fo:block>
				</xsl:when>
				<xsl:otherwise>
					<fo:block space-before="2pt" space-after="10pt" start-indent="1cm">
						<xsl:apply-templates/>
					</fo:block>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:when>
		<xsl:when test="not(child::*)">
			<fo:block margin-left="1cm" space-before="2pt" space-after="10pt"><xsl:value-of select="."/></fo:block>
		</xsl:when>
	</xsl:choose>
</xsl:template>

<xsl:template match="n1:table" mode="diagnose">
	<xsl:call-template name="tab_diagnose"/>
</xsl:template>

<xsl:template name="tab_diagnose">
	<fo:table table-layout="fixed" width="100%" border="0.5pt solid black">
		<fo:table-column column-width="12%"/>
		<fo:table-column column-width="60%"/>
		<fo:table-column column-width="17%"/>
		<fo:table-column column-width="11%"/>
		<xsl:apply-templates/>
	</fo:table>
</xsl:template>



<xsl:template match="n1:paragraph">
	<fo:block margin-left="1cm" space-before="2pt" space-after="10pt"><xsl:apply-templates/></fo:block>
</xsl:template>

<xsl:template match="n1:br">
	<fo:block margin-left="1cm" space-before="2pt" space-after="10pt"><xsl:apply-templates/></fo:block>
</xsl:template>

  <!--     Content w/ deleted text is hidden -->
<xsl:template match="n1:content[@revised='delete']"/>

<xsl:template match="n1:content">
	<fo:block space-before="2pt" space-after="10pt"><xsl:apply-templates/></fo:block>
</xsl:template>

<xsl:template match="n1:list">
	<xsl:if test="n1:caption">
		<fo:block><xsl:apply-templates select="n1:caption"/></fo:block>
	</xsl:if>

	<xsl:choose>
		<xsl:when test="@listType='ordered'">
			<!-- list ist nummeriert -->
			<fo:list-block>
				<xsl:for-each select="n1:item">
					<fo:list-item>
						<fo:list-item-label end-indent="label-end()">
							<fo:block><xsl:value-of select="position()"/>. </fo:block>
						</fo:list-item-label>
						<fo:list-item-body start-indent="body-start()">
							<fo:block><xsl:value-of select="."/></fo:block>
						</fo:list-item-body>
					</fo:list-item>
				</xsl:for-each>
			</fo:list-block>
		</xsl:when>
		<xsl:otherwise>
			<!-- list ist nicht nummeriert -->
			<fo:list-block>
				<xsl:for-each select="n1:item">
					<fo:list-item>
						<fo:list-item-label start-indent="1cm" end-indent="label-end()">
							<fo:block>&#45;</fo:block>
						</fo:list-item-label>
						<fo:list-item-body start-indent="body-start()">
							<fo:block><xsl:value-of select="."/></fo:block>
						</fo:list-item-body>
					</fo:list-item>
				</xsl:for-each>
			</fo:list-block>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
  
  
<xsl:template match="n1:table">
	<xsl:variable name="umrandung">
		<xsl:choose>
			<xsl:when test="./@border>0" >
				<xsl:text>0.5pt solid black</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>0.0pt 1 white</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<fo:table table-layout="fixed" width="100%" border=" {$umrandung} ">
		<xsl:apply-templates/>
	</fo:table>
</xsl:template>

<xsl:template match="n1:thead">
	<fo:table-header>
		<xsl:apply-templates/>
	</fo:table-header>
</xsl:template>

<xsl:template match="n1:tfoot">
	<fo:table-footer>
		<xsl:apply-templates/>
	</fo:table-footer>
</xsl:template>

<xsl:template match="n1:tbody">
	<fo:table-body>
		<xsl:apply-templates/>
	</fo:table-body>
</xsl:template>

<xsl:template match="n1:colgroup/n1:col">
	<fo:table-column column-width="{./@width}">
		<xsl:apply-templates/>
	</fo:table-column>
</xsl:template>

<xsl:template match="n1:tr">
	<fo:table-row>
		<xsl:apply-templates/>
	</fo:table-row>
</xsl:template>

<xsl:template match="n1:th">
	<xsl:variable name="umrandung">
		<xsl:choose>
			<xsl:when test="count(ancestor::n1:tr/child::*)>1">
				<xsl:text>0.5pt solid black</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>0pt dotted black</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<fo:table-cell border=" {$umrandung} " padding="2pt" margin-left="0">
		<fo:block><xsl:apply-templates/></fo:block>
	</fo:table-cell>
</xsl:template>

<xsl:template match="n1:td">
	<xsl:variable name="umrandung">
		<xsl:choose>
			<xsl:when test="count(ancestor::n1:tr/child::*)>1">
				<xsl:text>0.5pt solid black</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>0pt dotted black</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<fo:table-cell border=" {$umrandung} " padding="2pt" margin-left="0">
		<fo:block><xsl:apply-templates/></fo:block>
	</fo:table-cell>
</xsl:template>

<xsl:template match="n1:table/n1:caption">
	<xsl:apply-templates/>
</xsl:template>






	



<xsl:template name="Trennstrich">
	<fo:block text-align="center">
		<fo:leader leader-length="100%" leader-pattern="rule" rule-thickness="0.8pt" color="black"></fo:leader>
	</fo:block>
</xsl:template>


<xsl:template name="Datum">
	<xsl:param name="Date"/>
	<xsl:variable name="Time" select="substring-after($Date, 'T')"/>
	<xsl:choose>
		<xsl:when test="$Date">
			<xsl:value-of select="substring($Date,9,2)"/><xsl:text>.</xsl:text>
			<xsl:value-of select="substring($Date,6,2)"/><xsl:text>.</xsl:text>
			<xsl:value-of select="substring($Date,1,4)"/>
		</xsl:when>
		<xsl:otherwise><xsl:text>&#160;</xsl:text></xsl:otherwise>
	</xsl:choose>
	<xsl:if test="$Time">
		<xsl:text>&#160;&#160;</xsl:text><xsl:value-of select="concat($Time, ' Uhr')"/>
	</xsl:if>
</xsl:template>

<xsl:template name="quartal">
	<xsl:param name="intervall"/>
	<xsl:choose>
		<xsl:when test="substring($intervall,6,7)='01-01..' ">
			<xsl:text>1. Quartal </xsl:text><xsl:value-of select="substring($intervall,1,4)"/>
		</xsl:when>
		<xsl:when test="substring($intervall,6,7)='04-01..' ">
			<xsl:text>2. Quartal </xsl:text><xsl:value-of select="substring($intervall,1,4)"/>
		</xsl:when>
		<xsl:when test="substring($intervall,6,7)='07-01..' ">
			<xsl:text>3. Quartal </xsl:text><xsl:value-of select="substring($intervall,1,4)"/>
		</xsl:when>
		<xsl:when test="substring($intervall,6,7)='10-01..' ">
			<xsl:text>4. Quartal </xsl:text><xsl:value-of select="substring($intervall,1,4)"/>
		</xsl:when>
		<xsl:otherwise><xsl:text>&#160;</xsl:text></xsl:otherwise>
	</xsl:choose>
</xsl:template>


<xsl:template name="getName">
	<xsl:param name="name"/>
	<xsl:choose>
		<xsl:when test="$name/n1:family">
			<xsl:if test="$name/n1:prefix">
				<xsl:value-of select="$name/n1:prefix"/>
				<xsl:text> </xsl:text>
			</xsl:if>
			<xsl:value-of select="$name/n1:given"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="$name/n1:family"/>
			<xsl:text> </xsl:text>
			<xsl:if test="$name/n1:suffix">
				<xsl:text>, </xsl:text>
				<xsl:value-of select="$name/n1:suffix"/>
			</xsl:if>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$name"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="getContactInfo">
	<xsl:param name="contact"/>
	<xsl:apply-templates select="$contact/n1:addr"/>
	<xsl:apply-templates select="$contact/n1:telecom"/>
</xsl:template>

<xsl:template name="getContactTelekom">
	<xsl:param name="contact"/>
	<xsl:apply-templates select="$contact/n1:telecom"/>
</xsl:template>

<xsl:template match="n1:addr">
	<xsl:for-each select="n1:streetAddressLine">
		<xsl:value-of select="."/>
		<fo:block/>
	</xsl:for-each>
	<xsl:if test="n1:streetName">
		<xsl:value-of select="n1:streetName"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="n1:houseNumber"/>
		<fo:block/>
	</xsl:if>
	<xsl:value-of select="n1:postalCode"/>
	<xsl:text> </xsl:text>
	<xsl:value-of select="n1:city"/>
	<xsl:if test="n1:state">
		<xsl:text>, </xsl:text>
		<xsl:value-of select="n1:state"/>
	</xsl:if>
	<fo:block/>
</xsl:template>

<xsl:template name="getAutorAbsenderzeile">
	<xsl:param name="firmenadr"/>
	<xsl:value-of select="concat($firmenadr/n1:name, ' ')"/>
	<fo:inline font-weight="bold"> &#183; </fo:inline>
	<xsl:value-of select="concat($firmenadr/n1:addr/n1:streetName, ' ')"/>
	<xsl:value-of select="concat($firmenadr/n1:addr/n1:houseNumber, ' ')"/>
	<fo:inline font-weight="bold"> &#183; </fo:inline>
	<xsl:value-of select="concat($firmenadr/n1:addr/n1:postalCode, ' ')"/>
	<xsl:value-of select="concat($firmenadr/n1:addr/n1:city, ' ')"/>
</xsl:template>

	<!--  fachlicher Ansprechpartner
-->
<xsl:template name="getFachAnsprechpartnerAdrZeile">
	<xsl:param name="ansprechadr"/>
	<xsl:choose>
		<xsl:when test="$ansprechadr/n1:addr">
			<xsl:value-of select="concat($ansprechadr/n1:addr/n1:streetName, ' ')"/>
			<xsl:value-of select="concat($ansprechadr/n1:addr/n1:houseNumber, ' ')"/>
			<fo:inline font-weight="bold"> &#183; </fo:inline>
			<xsl:value-of select="concat($ansprechadr/n1:addr/n1:postalCode, ' ')"/>
			<xsl:value-of select="concat($ansprechadr/n1:addr/n1:city, ' ')"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select=" 'keine Adresse vorhanden' "/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="n1:telecom">
	<xsl:variable name="type" select="substring-before(@value, ':')"/>
	<xsl:variable name="value" select="substring-after(@value, ':')"/>
	<xsl:if test="$type">
		<xsl:call-template name="translateCode">
			<xsl:with-param name="code" select="$type"/>
		</xsl:call-template>
		<xsl:text>: </xsl:text>
		<xsl:text> </xsl:text>
		<xsl:value-of select="$value"/>
		<xsl:if test="@use">
			<xsl:text> (</xsl:text>
			<xsl:call-template name="translateCode">
				<xsl:with-param name="code" select="@use"/>
			</xsl:call-template>
			<xsl:text>)</xsl:text>
		</xsl:if>
		<fo:block/>
	</xsl:if>
</xsl:template>

<xsl:template name="translateCode">
	<xsl:param name="code"/>
	<xsl:choose>
		<!-- lookup table Telecom URI -->
		<xsl:when test="$code='tel'">
			<xsl:text>Tel</xsl:text>
		</xsl:when>
		<xsl:when test="$code='fax'">
			<xsl:text>Fax</xsl:text>
		</xsl:when>
		<xsl:when test="$code='mailto'">
			<xsl:text>Mailto</xsl:text>
		</xsl:when>
		<xsl:when test="$code='web'">
			<xsl:text>Web</xsl:text>
		</xsl:when>
		<xsl:when test="$code='HP'">
			<xsl:text>zu Hause</xsl:text>
		</xsl:when>
		<xsl:when test="$code='WP'">
			<xsl:text>Arbeitsplatz</xsl:text>
		</xsl:when>
		<xsl:otherwise>
			<xsl:text>{$code}?</xsl:text>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="chooseTelekomContact">
	<xsl:param name="contact"/>
	<xsl:param name="wert"/>
	<xsl:variable name="type" select="substring-before($contact, ':')"/>
	<xsl:variable name="value" select="substring-after($contact, ':')"/>
	<xsl:choose>
		<xsl:when test="$type='tel' and $wert='tel' ">
			<xsl:value-of select="$value"/>
		</xsl:when>
		<xsl:when test="$type='fax' and $wert='fax' ">
			<xsl:value-of select="$value"/>
		</xsl:when>
		<xsl:when test="$type='mailto' and $wert='mail' ">
			<xsl:value-of select="$value"/>
		</xsl:when>
		<xsl:when test="$type='web' and $wert='web' ">
			<xsl:value-of select="$value"/>
		</xsl:when>
		<xsl:when test="$type='HP' and $wert='home' ">
			<xsl:value-of select="$value"/>
		</xsl:when>
		<xsl:when test="$type='WP' and $wert='work' ">
			<xsl:value-of select="$value"/>
		</xsl:when>
	</xsl:choose>
</xsl:template>

<xsl:template name="signierung">
	<xsl:param name="sign"/>
	<xsl:choose>
		<xsl:when test="$sign='S' ">
			<xsl:text>Signatur vorhanden</xsl:text>
		</xsl:when>
		<xsl:when test="$sign='I' ">
			<xsl:text>Signatur beabsichtigt</xsl:text>
		</xsl:when>
		<xsl:when test="$sign='X' ">
			<xsl:text>Signatur erforderlich</xsl:text>
		</xsl:when>
		<xsl:otherwise>
			<xsl:text>keine Angabe zum Signaturstatus</xsl:text>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="rolle_autor">
	<xsl:param name="function"/>
	<xsl:choose>
		<xsl:when test="$function='PCP' ">
			<xsl:text>Hausarzt</xsl:text>
		</xsl:when>
		<xsl:when test="$function='ADMPHYS' ">
			<xsl:text>einweisender Arzt</xsl:text>
		</xsl:when>
		<xsl:otherwise>
			<xsl:text>keine Angabe zur Rolle des Arztes</xsl:text>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="getVersichertenart">
	<xsl:param name="vart"/>
	<xsl:choose>
		<xsl:when test="$vart='SELF' or $vart='self' or $vart='Self' ">
			<xsl:text>selbst versichert</xsl:text>
		</xsl:when>
		<xsl:when test="$vart='FAMDEP' or $vart='famdep' or $vart='Famdep' ">
			<xsl:text>familienversichert</xsl:text>
		</xsl:when>
		<xsl:otherwise>
			<xsl:text>keine Angabe zur Versichertenart</xsl:text>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="formatDate">
	<xsl:param name="date"/>
	<xsl:choose>
		<xsl:when test="substring ($date, 7, 1)='0'">
			<xsl:value-of select="substring ($date, 8, 1)"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="substring ($date, 7, 2)"/>
		</xsl:otherwise>
	</xsl:choose>
	<xsl:text>. </xsl:text>
	<xsl:variable name="month" select="substring ($date, 5, 2)"/>
	<xsl:choose>
		<xsl:when test="$month='01'">
			<xsl:text>Januar </xsl:text>
		</xsl:when>
		<xsl:when test="$month='02'">
			<xsl:text>Februar </xsl:text>
		</xsl:when>
		<xsl:when test="$month='03'">
			<xsl:text>März </xsl:text>
		</xsl:when>
		<xsl:when test="$month='04'">
			<xsl:text>April </xsl:text>
		</xsl:when>
		<xsl:when test="$month='05'">
			<xsl:text>Mai </xsl:text>
		</xsl:when>
		<xsl:when test="$month='06'">
			<xsl:text>Juni </xsl:text>
		</xsl:when>
		<xsl:when test="$month='07'">
			<xsl:text>Juli </xsl:text>
		</xsl:when>
		<xsl:when test="$month='08'">
			<xsl:text>August </xsl:text>
		</xsl:when>
		<xsl:when test="$month='09'">
			<xsl:text>September </xsl:text>
		</xsl:when>
		<xsl:when test="$month='10'">
			<xsl:text>Oktober </xsl:text>
		</xsl:when>
		<xsl:when test="$month='11'">
			<xsl:text>November </xsl:text>
		</xsl:when>
		<xsl:when test="$month='12'">
			<xsl:text>Dezember </xsl:text>
		</xsl:when>
	</xsl:choose>
	<xsl:value-of select="substring ($date, 1, 4)"/>
</xsl:template>

</xsl:stylesheet>
