<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="text"/> 
	
<xsl:template match="/">Product title,Cover URL,Rating,Studio,Release date,Running time
<xsl:for-each select="Movies/Available/Movie">
	<xsl:value-of select="title" />,<xsl:value-of select="@coverImage" />,<xsl:value-of select="rated"/>,<xsl:value-of select="studio" />,<xsl:value-of select="bdReleaseDate/day" />/<xsl:value-of select="bdReleaseDate/month" />/<xsl:value-of select="bdReleaseDate/year" />,<xsl:value-of select="runtime" />
	<xsl:text>&#xa;</xsl:text>
</xsl:for-each>
</xsl:template>
    
</xsl:stylesheet>
