<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:dyn="http://exslt.org/dynamic"
    xmlns:exsl="http://exslt.org/common"
    extension-element-prefixes="exsl dyn"
	version="1.0"
	exclude-result-prefixes="dyn h"
	xmlns:h="http://www.w3.org/1999/xhtml">
	<xsl:output encoding="UTF-8" indent="yes" method="html" />
<xsl:template match="/">
	<xsl:apply-templates />
</xsl:template>


<xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
</xsl:template>

<xsl:template match="h:a">
 <xsl:element name="a">
  <xsl:apply-templates select="@*"/>
  <xsl:attribute name="target" >_new</xsl:attribute>
  <xsl:apply-templates/>
 </xsl:element>
 </xsl:template>

<xsl:template match="*[contains(@class,'citation')]" mode="enhancer">
 <li>
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
    <xsl:if test="@href"><span style="color:gray"> as defined or described at <a><xsl:attribute name="href"><xsl:value-of select="@href"/></xsl:attribute><xsl:attribute name="target">_new</xsl:attribute><xsl:value-of select="@href"/></a>.</span></xsl:if>
 </li>
</xsl:template>

 <xsl:template match="/h:html/h:body">
  <body style="margin:50px 0px; padding:0px; text-align:center;">
   <div style="width:40em;margin:0px auto;text-align:justify;padding:15px;">
   <xsl:apply-templates select="@*|node()" />
 <div class="section" style="text-align:left">
  <h1>Links to Definitions of Cited Entities</h1>
  <h2>Geographic Entities</h2>
  <ol>
   <xsl:apply-templates select="//*[@typeof='dcterms:Location']" mode="enhancer"><xsl:sort select="."/></xsl:apply-templates>
  </ol>
  <h2>People</h2>
  <ol>
   <xsl:apply-templates select="//*[@typeof='foaf:Person']" mode="enhancer"><xsl:sort select="."/></xsl:apply-templates>
  </ol>
  <h2>Texts</h2>
  <ol>
   <xsl:apply-templates select="/h:html/h:body//*[@typeof='dcterms:Text']" mode="enhancer" ><xsl:sort select="."/></xsl:apply-templates>
  </ol>
  <h2>Coin Hoards</h2>
  <ol>
   <xsl:apply-templates select="//*[@typeof='nm:hoard']" mode="enhancer" ><xsl:sort select="."/></xsl:apply-templates>
  </ol>
 </div>
   </div>
   </body>
</xsl:template>


</xsl:stylesheet>
 
