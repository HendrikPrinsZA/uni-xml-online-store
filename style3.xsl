<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:fo="http://www.w3.org/1999/XSL/Format">
  <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master 
                    master-name="cover"
                    page-width="8.5in"
                    page-height="11in">
                    <fo:region-body margin="1in" background-color="#A5C9E1" />
                    <fo:region-before extent="1in" background-color="#A5C9E1"/>
					<fo:region-after extent="1in" background-color="#A5C9E1"/>
					<fo:region-start extent="1in" background-color="#A5C9E1"/>
					<fo:region-end extent="1in" background-color="#A5C9E1"/>
                </fo:simple-page-master>
                <fo:simple-page-master  master-name="subPages"
                                        page-width="8.5in" 
                                        page-height="11in">
                    <fo:region-body margin="1in" background-color="#A5C9E1"/>
                    <fo:region-before extent="1in" background-color="#A5C9E1"/>
                    <fo:region-after extent="1in" background-color="#A5C9E1"/>
					<fo:region-start extent="1in" background-color="#A5C9E1"/>
					<fo:region-end extent="1in" background-color="#A5C9E1"/>
                </fo:simple-page-master>
			</fo:layout-master-set>
            
            <fo:page-sequence master-reference="cover">
                <fo:flow flow-name="xsl-region-body">
                    <fo:block space-before="5in" text-align="center">
                        <fo:external-graphic src="url('osba-logo.jpg')" />
                    </fo:block>
                    <fo:block space-before="1in" font-size="28pt" text-align="center">
                        Online Store for Bluray Animations
					</fo:block>
					<fo:block space-before="1in" font-size="14pt" text-align="left">
						<fo:block font-weight="bold">Greetings OSBA client,</fo:block>
						<fo:block>We at OSBA have some interesting things to let you know about.</fo:block>
						<fo:block>There's been some changes in the movie world.</fo:block>
						<fo:block>Here are the details of some of them:</fo:block>
                    </fo:block>
				</fo:flow>    
			</fo:page-sequence>
			
			
			<fo:page-sequence master-reference="subPages">
      			<fo:static-content flow-name="xsl-region-after">
          			<fo:block font-size="9pt" text-align="right" margin="0.5in" margin-top="0.25in">
          				Page <fo:page-number />
					</fo:block>
        		</fo:static-content>
				
				<fo:flow flow-name="xsl-region-body">
					<fo:block break-after="page" text-align="center">
						<fo:block text-align="center" font-size="35pt" space-after="15pt">
							~ITEMS~
                        </fo:block> 
						<fo:block text-align="center" font-size="20pt" space-after="50pt">
							Available
							<fo:block text-align="center">
								<fo:table>
									<fo:table-column column-width="200pt"/>
									<fo:table-column column-width="200pt"/>
									<fo:table-body>
									<xsl:for-each select="Movies/Available/Movie">
										<fo:table-row>
											<fo:table-cell>
												<fo:block text-align="center" font-size="14pt">
													<xsl:value-of select="position()"/><xsl:text>: </xsl:text><xsl:value-of select="title" />
												</fo:block>
											</fo:table-cell>
											<fo:table-cell>
												<fo:block>
														<fo:external-graphic scaling="non-uniform" content-width="10%" content-height="10%">
															<xsl:attribute name="src">
																url("<xsl:value-of select="@coverImage" />")
															</xsl:attribute>
														</fo:external-graphic>
													</fo:block>	
											</fo:table-cell>
										</fo:table-row>			
									</xsl:for-each>
									</fo:table-body>
                            	</fo:table>
							</fo:block>
                    	</fo:block>
						
						<fo:block text-align="center" font-size="20pt" background-color="#B5E61D" border-style="ridge" border-width="thick">
							Coming soon
							<fo:block text-align="left" font-size="18pt">
								<xsl:for-each select="Movies/Upcomming/Movie">
									<fo:block>
										<fo:block text-align="center">
											<xsl:value-of select="title" />
                                        </fo:block>
										
										<fo:block font-size="12pt" text-align="center">
											<fo:block font-size="14pt" font-style="italic">
												<xsl:value-of select="studio" />
											</fo:block>
											<fo:block>
												Rated:        <xsl:value-of select="rated" />
											</fo:block>
											<fo:block>
												Release Date: <xsl:value-of select="bdReleaseDate/year" />/<xsl:value-of select="bdReleaseDate/month" />/<xsl:value-of select="bdReleaseDate/day" />
											</fo:block>
											<fo:block>
												Playtime:     <xsl:value-of select="runtime" /><xsl:value-of select="runtime/@unit" />
											</fo:block>
										</fo:block>
									</fo:block>
								</xsl:for-each>
							</fo:block>
                    	</fo:block>
                    </fo:block>
					
          			<xsl:for-each select="Movies/Available/Movie">
            			<fo:block margin-bottom="0.2in">
              				<fo:block font-size="30pt" text-align="center" break-before="page">
                				<xsl:value-of select="title" />
              				</fo:block>
							
							<fo:block font-size="12pt" text-align="center">
								<xsl:value-of select="rated" />	
							</fo:block>
							
              				<fo:block text-align="center" space-after="2pt">
								<xsl:for-each select="reception/stills/still">
									<fo:external-graphic border-style="ridge" border-width="thick" content-width="50%" scaling="non-uniform">
										<xsl:attribute name="src">
											url("<xsl:value-of select="@img" />")
										</xsl:attribute>
									</fo:external-graphic>
								</xsl:for-each>
              				</fo:block>
							
							<fo:block font-size="16pt" text-align="center" font-style="italic" space-after="3pt">
								<xsl:value-of select="studio" />
							</fo:block>
							
							<fo:block font-size="12pt" text-align="justify" color="green" space-after="5pt">
              					Release Date: <xsl:value-of select="bdReleaseDate/year" />/<xsl:value-of select="bdReleaseDate/month" />/<xsl:value-of select="bdReleaseDate/day" />
            				</fo:block>
							
							<fo:block font-size="12pt" text-align="right" space-after="3pt">
								<fo:block font-weight="bold">
								Directed by	
								</fo:block>
								<xsl:for-each select="directors/director">
									<fo:block>
										<xsl:value-of select="." />
									</fo:block>	
                                </xsl:for-each>
            				</fo:block>
							
							<fo:block font-size="12pt" text-align="justify" space-after="3pt">
              					Play time: <xsl:value-of select="runtime" /><xsl:value-of select="runtime/@unit" />
            				</fo:block>
							
							<fo:block background-color="gray" border-style="ridge" border-width="thin" >
								<fo:block font-size="12pt" text-align="center" space-after="3pt" font-weight="bold">
              						Reception
            					</fo:block>
								<xsl:for-each select="reception/content/paragraph">
									<fo:block font-size="10pt" text-align="justify" space-after="2pt">
              							<xsl:value-of select="." />
            						</fo:block>
                            	</xsl:for-each>
							</fo:block>
						</fo:block>
          			</xsl:for-each>
					<fo:block text-align="center" space-before="100pt">
						<fo:block>
							We hope to see online soon
						</fo:block>
						<fo:block>
							Who wants to <fo:inline color="green">download</fo:inline> if you can <fo:inline color="red">pay</fo:inline>. . .
						</fo:block>	
                    </fo:block>					
        		</fo:flow>				
      		</fo:page-sequence>
        </fo:root>
    </xsl:template>    
</xsl:stylesheet>
