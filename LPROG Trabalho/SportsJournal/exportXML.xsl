<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="UTF-8"
		indent="yes" />

	<xsl:template match="/">
		<!-- creating new root -->
		<teamsList>
			<xsl:for-each
				select="sportsJournal/news/clubs/club[not(shortname=following::shortname)]/shortname">
				<xsl:sort select="." data-type="text" order="ascending" />
				<xsl:variable name="short" select="." />
				<team>
					<teamid>
						<xsl:copy-of select="../shortname" />
					</teamid>
					<country>
						<xsl:copy-of select="../country" />
					</country>

					<newsList>
						<xsl:for-each select="/sportsJournal/news">
							<xsl:if test="$short=clubs/club/shortname">
								<news>
									<xsl:copy-of select="title" />
								</news>
							</xsl:if>

						</xsl:for-each>
					</newsList>
				</team>
			</xsl:for-each>
		</teamsList>
	</xsl:template>
</xsl:stylesheet>