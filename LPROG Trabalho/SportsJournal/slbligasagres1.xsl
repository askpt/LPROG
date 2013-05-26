<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
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
					<!-- reference to CSS stylesheet -->
    				<link rel="stylesheet" type="text/css" href="CSS/styles.css"/>
				</head>	
				
				<!-- HTML body -->
				<body>
								
				<div id="menubar" align="center">
						<nav>
    						<!-- UL for MENUBAR -->
							<ul>
								<!-- LI for LOGO -->
								<!-- add img later!!!!! or delete -->
								<li><img src="" /></li> 
	
	    						<!-- LI for menu Home -->
								<li><a href="html/welcome.html">HOME</a>
									<ul>
										<!-- uncomment below to add menu option -->
										<!-- <li><a href="pageNotFound.htm">Upload file</a></li> -->
									</ul>
								</li> 
		
								<!-- LI for menu News -->
								<li><a href="#">NEWS</a>
									<ul>
										<li><a href="#">All news</a></li>
										<li><a href="#">Apply Filters</a>
											<ul>
												<li><a href="html/sportsfilter.html">By Sport</a></li>
												<li><a href="pageNotFound.htm">By Club</a></li>
											<!-- uncomment below to add menu option -->
											<!-- <hr /> -->
											<!-- <li><a href="pageNotFound.htm">All Accounts	</a></li> -->
											</ul>
										</li>
									</ul>
								</li>
		
								<!-- LI for menu EXPORT -->
								<li><a href="#">EXPORT</a>
									<ul>
										<li><a href="pageNotFound.htm">Export to xml</a></li>
										<!-- uncomment below to add menu option -->
										<!-- <li><a href="pageNotFound.htm">Delete Label</a></li> -->
									</ul>
								</li>
		
								<!-- LI for menu About -->
								<li><a href="#">ABOUT</a>
									<ul>
										<li><a href="pageNotFound.htm">Report</a></li>
										<hr />
										<li><a href="html/authors.html">Authors</a></li>
									</ul>
								</li>
							</ul>
						</nav>
					</div>
					<!-- displays the title at the top of the page -->
					<div id="title" style="position:relative; top:30px">
						<h1 align="center">Sports Journal</h1>
						<h2 align="center">All News</h2>
					
						<!-- displays the total number of news -->
						<p align="center">(Total news: <xsl:value-of select="count(sportsJournal/news[sport='Football' and championship/name='Liga Sagres' and clubs/club/shortname='SLB' and clubs/club/position=1 ])"/>)</p>
						<br /><hr /><br />
					</div>
					
					<!-- div for links table -->
					<div id="links" style="position:relative; top:30px;">
						<!-- series of links at the top of the page to go to a specific news -->
						
						<h3 align="center">Table of contents</h3>
						
						<!-- table with links -->
							<table border="2" align="center">
								<tr>
									<th>Title</th>
									<th>Sport</th>
									<th>Tags</th>
								</tr>
								<tr>
									<td>
										<xsl:for-each select="sportsJournal/news[sport='Football' and championship/name='Liga Sagres' and clubs/club/shortname='SLB' and clubs/club/position=1 ]">
											<a href="#{generate-id(title)}">
												<!-- getting the value of the title of a given news -->
												<xsl:value-of select="title" /> <br />
											</a>
										</xsl:for-each>
									</td>
									<td>
										<xsl:for-each select="sportsJournal/news[sport='Football' and championship/name='Liga Sagres' and clubs/club/shortname='SLB' and clubs/club/position=1 ]">
											<xsl:value-of select="sport" /> <br />
										</xsl:for-each>
									</td>
									<td>
										<xsl:for-each select="sportsJournal/news[sport='Football' and championship/name='Liga Sagres' and clubs/club/shortname='SLB' and clubs/club/position=1 ]">
											<xsl:value-of select="clubs/club/shortname" /> <br />
										</xsl:for-each>
									</td>
								</tr>
							</table> <!-- end table -->
						
						<br /><hr /><br />
					</div> <!-- end div title -->
					
					<!-- div for news (main section of the html document) -->
					<div id="news">
					
						<!-- getting data and showing it up on the screen -->
						<xsl:for-each select="sportsJournal/news[sport='Football' and championship/name='Liga Sagres' and clubs/club/shortname='SLB' and clubs/club/position=1 ]">
						
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
						
							<!-- prints news body -->
							<p><xsl:value-of select="newsBody" /></p>
						
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
								on the <xsl:value-of select="dateTime" />. Follow the original link <a href="{source/sourceURL}">here</a>)
							</p>
									
							<!-- break and horizontal line for the next news item -->
							<br /> <br /> <hr />
						
						</xsl:for-each>
					
					</div> <!-- end div news -->
				</body>
			
			</html> <!-- HTML end tag -->
		
		</xsl:template>
</xsl:stylesheet>