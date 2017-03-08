<?xml version="1.0" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="text"/>
    
<xsl:template match="/">Greetings OSBA client,

We at OSBA have some interesting things to let you know about.
There's been some changes in the movie world.
Here are the details of some of them:

==============================================================    
--------------------------Available---------------------------
============================================================== 
<xsl:for-each select="Movies/Available/Movie">
                  ===<xsl:value-of select="title" />===
-Studio:        <xsl:value-of select="studio" />
-Rated:         <xsl:value-of select="rated"/>
-Release Date:  <xsl:value-of select="bdReleaseDate/year" />/<xsl:value-of select="bdReleaseDate/month" />/<xsl:value-of select="bdReleaseDate/day" />
-Play time:     <xsl:value-of select="runtime" /><xsl:value-of select="runtime/@unit" />
-Directed by
<xsl:for-each select="directors/director">
<xsl:text> </xsl:text><xsl:value-of select="." /><xsl:text>&#xa;</xsl:text>
</xsl:for-each>  
-Reception
 <xsl:value-of select="normalize-space(substring-before(reception/content/paragraph[1], '. '))"/>...
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
</xsl:for-each>  
    
==============================================================    
--------------------------Upcomming---------------------------
==============================================================
<xsl:for-each select="Movies/Upcomming/Movie">
                  ===<xsl:value-of select="title" />===
-Studio:        <xsl:value-of select="studio" />
-Rated:         <xsl:value-of select="rated"/>
-Release Date:  <xsl:value-of select="bdReleaseDate/year" />/<xsl:value-of select="bdReleaseDate/month" />/<xsl:value-of select="bdReleaseDate/day" />
-Play time:     <xsl:value-of select="runtime" /><xsl:value-of select="runtime/@unit" />
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
</xsl:for-each>
    
                We hope to see online soon
            Who wants to download if you can pay. . .
</xsl:template>
    
</xsl:stylesheet>
