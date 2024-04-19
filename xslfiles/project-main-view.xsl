<?xml version="1.0"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<xsl:apply-templates select="outer"/>
</xsl:template>

<xsl:template match="outer">
<HTML>
<HEAD>
  <TITLE>
  The <xsl:value-of select="project/name"/> Project at ISI
  </TITLE>
  <link rel="stylesheet" href="../ikcap-basic.css"></link>
<STYLE TYPE="text/css">
  BODY { background-color: white; font-size:12px}
  TD { background-color: #CCCCCC; font-size: 14px}
  TD.b { background-color: white ;font-size: 12px;}

</STYLE>
</HEAD>
<BODY>
<TABLE border='0' cellspacing='1' cellpadding='5' bgcolor='black'>
<TR>
  <TD class='top' align='center'><A href='http://www.isi.edu/'>
   <IMG border='0' SRC='../images/isi.jpg' /></A></TD>
  <TD class='top' width='100%' align='center'>
  <table cellspacing='0' cellpadding='0'>
  <tr><td valign='center'>
   <A href='./' style="border:0"><IMG border='0' SRC='logo.jpg' /></A>
	</td><td valign='center'>
   <A HREF="../" style="border:0"><IMG border='0' SRC="../images/kcap-small.jpg"/></A>
	</td>
  </tr>
  <tr><td colspan='2'>
<B><xsl:value-of select="project/title"/></B>
  </td>
  </tr>
  </table>
 </TD>
</TR>
<TR>
  <TD align='right'>
  <P /><A HREF='project-description-view.xml'><B>Description</B></A>
  </TD>
  <TD class='b' valign='top'>
<xsl:apply-templates select="project/description/short"/>
<P />
<A href='project-description-view.xml'><B>More</B>--&gt;</A>
  </TD>
</TR>

<TR>
  <TD align='right'>
  <P /><A HREF='project-status-view.xml'><B>Status</B></A>
  </TD>
  <TD class='b' valign='top'>
  <xsl:apply-templates select="project/status/short"/>
<P />
<A href='project-status-view.xml'>
<b>More</b>--&gt;</A>
  </TD>
</TR>

<TR>
  <TD align='right'>
  <P /><A HREF='project-research-view.xml'><B>Research</B></A>
  </TD>
  <TD class='b' valign='top'>
<xsl:value-of select="project/research/short"/>
<A href='project-research-view.xml'>
<P />
<b>More</b>--&gt;</A>
  </TD>
</TR>

<TR>
  <TD align='right'>
  <P/><A HREF='project-publications-view.xml'><B>Publications</B></A>
  </TD>
  <TD class='b' valign='top'>
  <ul>
  <xsl:for-each select="publications/publication[project=/outer/project/name]">
    <xsl:call-template name="showpublication"/>
  </xsl:for-each>
  </ul>
<P /><A href='project-publications-view.xml'>
More <b>publications</b> --&gt;</A>
  </TD>
</TR>

<TR>
  <TD align='right'>
  <p/><a href='project-demo-view.xml'><b>Demo</b></a>
  </TD>
  <TD class='b' valign='top'>
<A href='project-demo-view.xml'><IMG SRC='tn_screenshot.jpg' /></A>
<P />
<A href='project-demo-view.xml'>
See a <B>demo</B> --&gt;</A>
  </TD>
</TR>

<TR>
  <TD align='right'>
  <P/><A HREF='project-people-view.xml'><B>People</B></A>
  </TD>
  <TD class='b' valign='top'>
  <ul>
  <xsl:for-each select="personnel/person/project[.=/outer/project/name]">
    <li><a><xsl:attribute name="href">/~<xsl:value-of select="../userid"/></xsl:attribute><xsl:value-of select="../name"/></a></li>
  </xsl:for-each>
  </ul>
<P /> <A href='project-people-view.xml'>
<b>More</b> --&gt;</A>
  </TD>
</TR>

<TR>
  <TD align='right'>
  <P/><A HREF='project-funding-view.xml'><B>Funding</B></A>
  </TD>
  <TD class='b' valign='top'>
  <ul>
  <xsl:for-each select="isdfunds/funding[project=/outer/project/name]">
      <xsl:if test="position() &lt; 4">
      <li><xsl:value-of select="program"/></li>
      </xsl:if>
  </xsl:for-each>
  </ul>
<A href='project-funding-view.xml'>
<P />
<b>More</b> --&gt;</A>
  </TD>
</TR>

<TR>
  <TD align='right'>
  <P /><A HREF='project-links-view.xml'><B>Links</B></A>
  </TD>
  <TD class='b' valign='top'>
  <ul>
  <xsl:for-each select="project/mainlink">
	 <li><xsl:apply-templates select="." /></li>
  </xsl:for-each>
  </ul>
<A href='project-links-view.xml'>
<P />
More <b>links</b>
--&gt;</A>
  </TD>
</TR>

</TABLE>
<A HREF='http://www.isi.edu/ikcap/'>&lt;&lt; Back to IKCAP</A>
</BODY>
</HTML>
</xsl:template>

<xsl:template name="showpublication">
  <xsl:variable name="tt" select="position()"/>
  <xsl:if test="$tt &lt; 4">
  <li>
  <xsl:choose>
    <xsl:when test="url"> <!-- this is not true when there ISN'T a url node, for some reason. -->
      <a>
      <xsl:attribute name="href">
        <xsl:value-of select="url"/>
      </xsl:attribute>
      <xsl:value-of select="title"/>
      </a>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="title"/>
    </xsl:otherwise>
  </xsl:choose>
  <xsl:for-each select="person">, <xsl:value-of select="."/>.
  </xsl:for-each>
  <font size="-1"><i>In <xsl:value-of select="where"/></i></font>
  <br/>
  </li>
  <br/>
  </xsl:if>
</xsl:template>

<xsl:template match="mainlink">
<xsl:copy><xsl:apply-templates/></xsl:copy>
</xsl:template>

<xsl:template match="short">
<xsl:copy><xsl:apply-templates/></xsl:copy>
</xsl:template>

<xsl:template match="long">
<xsl:copy><xsl:apply-templates/></xsl:copy>
</xsl:template>
  
<xsl:template match="n">
<b><xsl:value-of select="/outer/project/name"/></b>
</xsl:template>

<xsl:template match="p">
<xsl:copy><xsl:apply-templates/></xsl:copy>
</xsl:template>

<xsl:template match="b">
<xsl:copy><xsl:apply-templates/></xsl:copy>
</xsl:template>

<xsl:template match="i">
<xsl:copy><xsl:apply-templates/></xsl:copy>
</xsl:template>

<xsl:template match="ul">
<xsl:copy><xsl:apply-templates/></xsl:copy>
</xsl:template>

<xsl:template match="ol">
<xsl:copy><xsl:apply-templates/></xsl:copy>
</xsl:template>

<xsl:template match="li">
<xsl:copy><xsl:apply-templates/></xsl:copy>
</xsl:template>

<xsl:template match="hr">
<xsl:copy><xsl:apply-templates/></xsl:copy>
</xsl:template>

<xsl:template match="br">
<xsl:copy><xsl:apply-templates/></xsl:copy>
</xsl:template>

<xsl:template match="a">
<xsl:copy>
  <xsl:attribute name="href"><xsl:value-of select="@href"/></xsl:attribute>
  <xsl:apply-templates/>
</xsl:copy>
</xsl:template>


<xsl:template match="text()">
<xsl:value-of select="."/>
</xsl:template>

</xsl:stylesheet>
