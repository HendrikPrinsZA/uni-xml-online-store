<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" omit-xml-declaration="no" indent="yes"/>
		<xsl:template match="/">
			<xsl:element name="Movies">
				<xsl:element name="Available">
					<xsl:for-each select="document('available.xml')/available/bd">
						<xsl:element name="Movie">
							<xsl:attribute name="coverImage">
								<xsl:value-of select="@coverImg"/>	
							</xsl:attribute>
							<xsl:copy-of select="title"/>
							<xsl:copy-of select="rated"/>
							<xsl:copy-of select="studio"/>
							<xsl:copy-of select="directors"/>
							<xsl:copy-of select="bdReleaseDate"/>
							<xsl:copy-of select="runtime"/>
							<xsl:variable name="MovieTitle">
								<xsl:value-of select="title"/> 
							</xsl:variable>
							<xsl:for-each select="document('reception.xml')/reception/bd">
								<xsl:if test="$MovieTitle=title">
									<xsl:element name="reception">
										<xsl:copy-of select="stills"/>
										<xsl:copy-of select="content"/>
									</xsl:element>
								</xsl:if>
							</xsl:for-each>
						</xsl:element>
					</xsl:for-each>
				</xsl:element>
				<xsl:element name="Upcomming">
					<xsl:element name="Movie">
						<xsl:element name="title">
							<xsl:value-of select="document('sterkinekor.xml')/coming_soon/title/details/@name"/>
						</xsl:element>
						<xsl:element name="rated">
							<xsl:value-of select="document('sterkinekor.xml')/coming_soon/title/details/@rated"/>
						</xsl:element>
						<xsl:element name="studio">
							<xsl:value-of select="document('sterkinekor.xml')/coming_soon/title/details/@studio"/>
						</xsl:element>
						<xsl:element name="bdReleaseDate">
							<xsl:element name="day">
								<xsl:value-of select="substring-before(document('sterkinekor.xml')/coming_soon/title/details/@release,'/')"/>
							</xsl:element>
							<xsl:element name="month">
								<xsl:value-of select="substring(document('sterkinekor.xml')/coming_soon/title/details/@release,4,2)"/>
							</xsl:element>
							<xsl:element name="year">
								<xsl:value-of select="substring(document('sterkinekor.xml')/coming_soon/title/details/@release,7,4)"/>
							</xsl:element>
						</xsl:element>
						<xsl:element name="runtime">
							<xsl:attribute name="unit">
								<xsl:text>min</xsl:text>
							</xsl:attribute>
							<xsl:value-of select="document('sterkinekor.xml')/coming_soon/title/details/@running"/>
						</xsl:element>
					</xsl:element>

					<xsl:element name="Movie">
						<xsl:element name="title">
							<xsl:value-of select="document('numetro.xml')/NuMetro/NextUp/@bluray"/>
						</xsl:element>
						<xsl:element name="rated">
							<xsl:value-of select="document('numetro.xml')/NuMetro/NextUp/WithTheRating"/>
						</xsl:element>
						<xsl:element name="studio">
							<xsl:value-of select="document('numetro.xml')/NuMetro/NextUp/MadeBy"/>
						</xsl:element>
						<xsl:element name="bdReleaseDate">
							<xsl:element name="day">
								<xsl:value-of select="substring-after(substring-before(document('numetro.xml')/NuMetro/NextUp/Release,','),' ')"/>
							</xsl:element>
							<xsl:element name="month">
								<xsl:value-of select="substring-before(document('numetro.xml')/NuMetro/NextUp/Release,' ')"/>
							</xsl:element>
							<xsl:element name="year">
								<xsl:value-of select="substring-after(document('numetro.xml')/NuMetro/NextUp/Release,', ')"/>
							</xsl:element>
						</xsl:element>
						<xsl:element name="runtime">
							<xsl:attribute name="unit">
								<xsl:text>min</xsl:text>
							</xsl:attribute>
							<xsl:value-of select="substring-before(document('numetro.xml')/NuMetro/NextUp/TheLength,' ')"/>
						</xsl:element>
					</xsl:element>
				</xsl:element>
			</xsl:element>
		</xsl:template>
</xsl:stylesheet>
