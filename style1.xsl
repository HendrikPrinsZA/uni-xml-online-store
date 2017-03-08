<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns="http://www.w3.org/1999/xhtml">
<xsl:output method="html"/>

<xsl:template match="/">
    <html>
        <head>
            <title>OSBA</title>
        </head>
        <body style="background-color:#F68828">
            <table border="0" cellspacing="10" align="center">
                <tr>
                    <h1 align="center">
                        <img src="osba-logo.jpg" width="200" />
                    </h1>
                </tr>
                <tr>
                    <h1 align="center">Online Store for Bluray Animations</h1>
                </tr>
                <tr>
                    <h2 align="center">Latest Newsletter</h2>
                    <p align="center">Greetings OSBA client,<br/>

               We at OSBA have some interesting things to let you know about.<br/>
               Theres been some changes in the movie world.<br/>
               Here are the details of some of them:</p>
                </tr>
            </table>
            <table border="0" style="background-color:#6666CC">
                <tr>
                    <h1 align="left">
                        <b>
			<ul>Available</ul>
			<div align="center">
				<xsl:for-each select="Movies/Available/Movie">
					<img width="10%" height="10%">
						<xsl:attribute name="src">
							<xsl:value-of select="@coverImage" />
						</xsl:attribute>
						<xsl:attribute name="title">
							<xsl:value-of select="title" />
						</xsl:attribute>
					</img>	
					<xsl:choose>
						<xsl:when test="position()&lt;last()">
							- - - -
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
                        </b>
                    </h1>
                </tr>
                <tr style="background-color:#6666CC">
                    <xsl:for-each select="Movies/Available/Movie">
                        <table border="1" style="background-color:#E6E6FA">
                            <tr border="0">
                                <h1 align="center">
                                    <xsl:value-of select="title" />
                                </h1>
                                <p align="center" font-color="red">Rated:
                                    <xsl:value-of select="rated" />
                                </p>
                            </tr>
                            <tr>
                                <table border="0.5" align="center">
                                    <xsl:for-each select="reception/stills/still">
                                        <td width="33%">
                                            <img width="350" height="220">
                                                <xsl:attribute name="src">
                                                    <xsl:value-of select="@img" />
                                                </xsl:attribute>
                                                <xsl:attribute name="title">
                                                    <xsl:value-of select="." />
                                                </xsl:attribute>
                                            </img>
                                        </td>
                                    </xsl:for-each>
                                </table>
                            </tr>
                            <tr>
                                <p>
                                    <div align="center">
                                        <h3>
                                            <i>
                                                <xsl:value-of select="studio" />
                                            </i>
                                        </h3>
                                    </div>
                                    <div align="left">
                                        <span style="color:green">Release Date:
                                            <xsl:value-of select="bdReleaseDate/year" />/<xsl:value-of select="bdReleaseDate/month" />/<xsl:value-of select="bdReleaseDate/day" />
                                        </span>
                                    </div>
                                    <div>
                                        <u>Directed by</u>
                                        <xsl:for-each select="directors/director">
                                            <br />
                                            <xsl:value-of select="." />
                                        </xsl:for-each>
                                    </div>
                                    <div>
                                        <br />
                                        Playtime: <xsl:value-of select="runtime" />
                                        <xsl:value-of select="runtime/@unit" />
                                    </div>
                                </p>
                            </tr>
                            <tr align="center" padding="5">
                                <h3>Reception</h3>
                                <xsl:for-each select="reception/content/paragraph">
                                    <p align="left">
                                        <xsl:value-of select="." />
                                    </p>
                                </xsl:for-each>
                            </tr>
                        </table>
                        <br></br>
                    </xsl:for-each>
                </tr>
                <tr style="background-color:#B5E61D">
                    <h1 align="left">
                        <b>
                            <ul>Upcomming</ul>
                        </b>
                    </h1>
                </tr>
                <tr style="background-color:#B5E61D">
                    <table style="background-color:#B5E61D" width="100%" align="center" border="1">
                        <xsl:for-each select="Movies/Upcomming/Movie">
                            <tr>
                                <h2 align="center">
                                    <xsl:value-of select="title" />
                                </h2>
                                <i>
                                    <h3 align="center">
                                        <xsl:value-of select="studio" />
                                    </h3>
                                </i>
                            </tr>
                            <tr>
                                <table width="100%" border="1%" cellspacing="0">
                                    <tr>
                                        <td>
                                            Rated: <xsl:value-of select="rated" />
                                        </td>
                                        <td>
                                            Playtime: <xsl:value-of select="runtime" />
                                            <xsl:value-of select="runtime/@unit" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div align="left">
                                                <span style="color:green">Release Date:<xsl:value-of select="bdReleaseDate/year" />/<xsl:value-of select="bdReleaseDate/month" />/<xsl:value-of select="bdReleaseDate/day" />
                                                </span>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </tr>
                        </xsl:for-each>
                    </table>
                </tr>
            </table>
        </body>
        <div>
            <br></br>
            <h2 align="center" ><a href="http://www.google.co.za">We hope to see online soon</a></h2>
            <p align="center">Who wants to <a href="http://thepiratebay.org/">download</a> if you can <a href="http://en.wikipedia.org/wiki/Money">pay</a> for it...</p>
        </div> 
    </html>  
    
    
    
</xsl:template>
    
</xsl:stylesheet>
