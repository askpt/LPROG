<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="UTF-8"
		indent="yes" />

	<xsl:template match="/">
		<!-- creating new root -->
		<teams>
			<xsl:apply-templates select="/././name">
				<xsl:sort select="." />
			</xsl:apply-templates>
		</teams>
	</xsl:template>

	<xsl:template match="name">

		<xsl:element name="team">
			<xsl:attribute name="id">
			<xsl:value-of select="../shortname" />
		</xsl:attribute>

			<xsl:element name="name">
				<xsl:value-of select="." />
			</xsl:element>

			<xsl:element name="origin">
				<xsl:value-of select="../country" />
			</xsl:element>
		</xsl:element>

		<xsl:element name="competitions">
			<xsl:element name="competetion">
				<xsl:value-of select="../../championship/name" />
			</xsl:element>
		</xsl:element>

		<xsl:element name="news">

			<xsl:attribute name="id">
			<xsl:value-of select="../../../@id" />
		</xsl:attribute>

			<xsl:value-of select="../../source/sourceURL" />

		</xsl:element>

	</xsl:template>
</xsl:stylesheet>