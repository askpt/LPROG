<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 	xmlns:fn="http://www.w3.org/2005/02/xpath-functions"
    xmlns:xs="http://www.w3.org/2001/XMLSchema">
	
	<!-- setting output for html -->
	<xsl:output method="html" />

		<xsl:template match="/">
			
			<!-- HTML tag -->
			<html>
				<!-- HTML head tag -->
				<head>
					<title>Sports Journal</title>
				</head>	
				
				<!-- HTML body -->
				<body>
					<!-- displays the title at the top of the page -->
					<h1 align="center">Sports Journal</h1>
					<h2 align="center">All News</h2>
					
					<!-- series of links at the top of the page to go to a specific news -->
					<xsl:for-each select="sportsJournal/news">
						<a href="#{generate-id(title)}">
							<!-- getting the value of the title of a given news -->
							<xsl:value-of select="title" /> <br />
						</a>
					</xsl:for-each>
					
					<!-- getting data and showing it up on the screen -->
					<xsl:for-each select="sportsJournal/news">
						
						<!-- sorting by most recent date -->
						<xsl:sort select="dateTime" order="descending" data-type="dateTime" />
						
						<!-- prints news title and abstract -->
						<h3> 
							<a name="{generate-id(title)}"><xsl:value-of select="title" /></a>
						</h3>
						<h4> 
							<a name="{generate-id(title)}"><xsl:value-of select="abstract" /></a>
						</h4>
						
						<!-- prints the cover photo -->
						<img>
							<xsl:attribute name="src">
								<xsl:value-of select="photos/coverPhoto/photo/@href" />
							</xsl:attribute>
						</img> 
						
						<!-- 
						the following
						<xsl:value-of select="source/sourceURL" /> 
						needs to go into href
						
						<xsl:value-of select="dateTime" />
						needs to be replace with working function 
						<xsl:value-of select="day-from-dateTime(dateTime)"/>
						-->
						<p>
							(this news was originally published by <xsl:value-of select="author/name" /> on <xsl:value-of select="source/sourceName" />
							on the <xsl:value-of select="dateTime" />. Follow the original link <a href="">here</a>)
						</p>
									
						<!-- break and horizontal line for the next news item -->
						<br /> <br /> <hr />
						
					</xsl:for-each>
					
				</body>
			
			</html> <!-- HTML end tag -->
		
		</xsl:template>
</xsl:stylesheet>