<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- gematik revision="\main\rel_ors1\2" -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:kvno="urn::kvno-org/kvabrechnung" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="1.0">
	<!-- Kurztext -->
	<xsl:output method="text" encoding="ISO-8859-15"/>
	<xsl:template match="/">EGES: <xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="kvno:anlage_hvv/kvno:header/kvno:absender/kvno:praxisinhaber">
		<xsl:for-each select="kvno:arzt">
			<xsl:value-of select="kvno:vorname/@V"/>&#160;<xsl:value-of select="kvno:nachname/@V"/>,&#160;</xsl:for-each>
	</xsl:template>
	<xsl:template match="kvno:anlage_hvv/kvno:header/kvno:abrechnungsquartal">
		<xsl:value-of select="@V"/>
	</xsl:template>
</xsl:stylesheet>
