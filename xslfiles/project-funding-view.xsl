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
  <TD valign='top' align='right'>
  <P/><A HREF='project-main-view.xml'><B>Main</B></A>
  <P/><A HREF='project-description-view.xml'><B>Description</B></A>
  <P/><A HREF='project-status-view.xml'><B>Status</B></A>
  <P/><A HREF='project-research-view.xml'><B>Research</B></A>
  <P/><A HREF='project-publications-view.xml'><B>Publications</B></A>
  <p/><a href='project-demo-view.xml'><b>Demo</b></a>
  <P/><A HREF='project-people-view.xml'><B>People</B></A>
  <P/><A HREF='project-funding-view.xml'><B>Funding</B></A>
  <P/><A HREF='project-links-view.xml'><B>Links</B></A>
  </TD>
  <TD class='b' valign='top'>
    <H2>Funding</H2>
    We would like to acknowledge the following sources for funding the <b><xsl:value-of select="project/name"/></b> project:
	 <ul>
    <xsl:for-each select="isdfunds/funding/project[.=/outer/project/name]">
	 <li><a><xsl:attribute name="href"><xsl:value-of select="../url"/></xsl:attribute>
    <xsl:value-of select="../program"/></a>, award number <font color="red">
    <xsl:value-of select="../awardnumber"/></font>, from 
    <xsl:value-of select="../startdate"/> through <xsl:value-of select="../enddate"/>.<br />
	 </li><br />
	 </xsl:for-each>
	 </ul>
  </TD>
</TR>
</TABLE>
</BODY>
</HTML>
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
