<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:template match="skyrim">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="lilysd_xsltex3.css"/> 
            </head>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="faction[@ref='blades']">
        <span class="blades">
            <xsl:apply-templates></xsl:apply-templates>
        </span>
    </xsl:template>
    
    <xsl:key name="cast-char" match="cast/character" use="@id"/>
    
    <xsl:template match="character[@ref]">
        <xsl:choose>
            <xsl:when test="key('cast-char', @ref)/@alignment = 'good'">
                <span class="good">
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:when test="key('cast-char', @ref)/@alignment = 'neutral'">
                <span class="neutral">
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:when test="key('cast-char', @ref)/@alignment = 'evil'">
                <span class="evil">
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>