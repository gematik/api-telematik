<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- gematik revision="\main\rel_ors1\2" -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:cda="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="1.0">
	<!-- Kurztext -->
	<xsl:output method="text" encoding="ISO-8859-15"/>
	<xsl:template match="/">CDA-R2: <xsl:apply-templates select="/cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:patient"/>
	</xsl:template>
	<xsl:template match="cda:patient">
		<xsl:value-of select="cda:name/cda:given/text()"/>&#160;<xsl:value-of select="cda:name/cda:family/text()"/>,&#160;<xsl:value-of select="cda:birthTime/@value"/>
	</xsl:template>
</xsl:stylesheet>
