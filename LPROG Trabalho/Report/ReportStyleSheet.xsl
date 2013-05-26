<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fn="http://www.w3.org/2005/02/xpath-functions"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:p="http://www.dei.isep.ipp.pt/lprog">

	<xsl:output method="html" />
	<xsl:template match="/">
		<html>
			<head>
				<title>Report</title>
				<link rel="stylesheet" type="text/css" href="../SportsJournal/CSS/styles.css" />
			</head>
			<body>
				<div id="header">

					<!-- div for CSS-based drop-down menu -->
					<div id="menubar" align="center">
						<nav>
							<!-- UL for MENUBAR -->
							<ul>
								<!-- LI for LOGO -->
								<!-- add img later!!!!! or delete -->
								<li>
									<img src="" />
								</li>

								<!-- LI for menu Home -->
								<li>
									<a href="#">HOME</a>
									<ul>
										<!-- uncomment below to add menu option -->
										<!-- <li><a href="pageNotFound.htm">Upload file</a></li> -->
									</ul>
								</li>

								<!-- LI for menu News -->
								<li>
									<a href="#">NEWS</a>
									<ul>
										<li>
											<a href="../SportsJournal/AllNews.xml">All news</a>
										</li>
										<li>
											<a href="#">Apply Filters</a>
											<ul>
												<li>
													<a href="../SportsJournal/html/sportsfilter.html">By Sport</a>
												</li>
												<li>
													<a href="../SportsJournal/html/clubfilter.html">By Club</a>
												</li>
												<!-- uncomment below to add menu option -->
												<!-- <hr /> -->
												<!-- <li><a href="pageNotFound.htm">All Accounts</a></li> -->
											</ul>
										</li>
									</ul>
								</li>

								<!-- LI for menu EXPORT -->
								<li>
									<a href="#">EXPORT</a>
									<ul>
										<li>
											<a href="../SportsJournal/pageNotFound.htm">Export to xml</a>
										</li>
										<!-- uncomment below to add menu option -->
										<!-- <li><a href="pageNotFound.htm">Delete Label</a></li> -->
									</ul>
								</li>

								<!-- LI for menu About -->
								<li>
									<a href="#">ABOUT</a>
									<ul>
										<li>
											<a href="../SportsJournal/pageNotFound.htm">Report</a>
										</li>
										<hr />
										<li>
											<a href="../SportsJournal/html/authors.html">Authors</a>
										</li>
									</ul>
								</li>
							</ul>
						</nav>
					</div>
				</div>
				<xsl:apply-templates select="p:relatório" />
			</body>
		</html>
	</xsl:template>

	<xsl:template match="p:relatório">
		<xsl:apply-templates select="p:páginaRosto" />
		<xsl:apply-templates select="p:corpo" />
		<xsl:apply-templates select="p:anexos" />
	</xsl:template>

	<xsl:template match="p:páginaRosto">
		<div>
			<img>
				<xsl:attribute name="src">         
				<xsl:value-of select="p:logotipoDEI" />
       			</xsl:attribute>
			</img>
			<h3>
				<xsl:value-of select="p:tema" />
			</h3>
			<h3>
				<xsl:value-of select="p:disciplina/p:designação" />
			</h3>
			<h3>
				<xsl:value-of select="p:disciplina/p:anoCurricular" />
			</h3>
			<h3>
				<xsl:value-of select="p:disciplina/p:sigla" />
			</h3>

			<h3>Authors</h3>
			<xsl:for-each select="p:autor">
				<p>
					<a href="mailto:#{generate-id(mail)}">
						<xsl:value-of select="p:nome" />
					</a>
				</p>
				<p>
					<xsl:value-of select="p:numero" />
				</p>
			</xsl:for-each>

			<h3>
				Data:
				<xsl:value-of select="p:data" />
			</h3>
			<h3>
				Turma:
				<xsl:value-of select="p:turmaPL" />
			</h3>
			<h3>
				Professor:
				<a href="mailto:#{generate-id(mail)}">
					<xsl:value-of select="p:profPL" />
				</a>
			</h3>
		</div>
	</xsl:template>

	<xsl:template match="p:corpo">
		<div>
			<xsl:apply-templates match="p:introdução" />
			<xsl:apply-templates match="p:secções" />
			<xsl:apply-templates match="p:conclusão" />
			<xsl:apply-templates match="p:referências" />
		</div>

	</xsl:template>
	<xsl:template match="p:bloco">
		<xsl:for-each select="p:paragráfo">
			<p>
				<xsl:value-of select="." />
			</p>
		</xsl:for-each>

		<xsl:for-each select="p:figura">
			<p>
				<img>
					<xsl:attribute name="src">
						<xsl:value-of select="@src" />
					</xsl:attribute>
				</img>
				<xsl:value-of select="@descrição"/>
			</p>
		</xsl:for-each>
	</xsl:template>

	<xsl:template match="p:introdução">
		<h3>
			<xsl:value-of select="@tituloSecção" />
		</h3>
		<xsl:apply-templates select="p:bloco" />
	</xsl:template>

	<xsl:template match="p:secções">
		<h3>
			<xsl:value-of select="p:análise/@tituloSecção" />
		</h3>
		<xsl:apply-templates select="p:análise/p:bloco" />

		<h3>
			<xsl:value-of select="p:linguagem/@tituloSecção" />
		</h3>
		<xsl:apply-templates select="p:linguagem/p:bloco" />

		<h3>
			<xsl:value-of select="p:transformações/@tituloSecção" />
		</h3>
		<xsl:apply-templates select="p:transformações/p:bloco" />
	</xsl:template>

	<xsl:template match="p:conclusão">
		<h3>
			<xsl:value-of select="@tituloSecção" />
		</h3>
		<xsl:apply-templates select="p:bloco" />
	</xsl:template>

	<xsl:template match="p:referências">
		<h3>Referências</h3>
		<xsl:for-each select="p:refBibliográfica">
			<p>
				<xsl:value-of select="@idRef" />
				-
				<xsl:value-of select="p:título" />
				(
				<xsl:value-of select="p:dataPublicação" />
				);
				<xsl:value-of select="p:autor" />
			</p>
		</xsl:for-each>
	</xsl:template>

	<xsl:template match="p:anexos">
		<h3>
			<xsl:value-of select="@id" /> - 
			<xsl:value-of select="@tituloSecção" />
		</h3>
		<xsl:apply-templates select="p:bloco" />
	</xsl:template>






</xsl:stylesheet>

























