<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html"
                doctype-system="about:legacy-compat"
                encoding="UTF-8"
                indent="yes" />

    <xsl:template match="/">
        <html>
            <head>
                <title> FAQs.</title>
                <link rel="stylesheet" href="CSS/FAQs.css" />
            </head>
            <body>
                <table class="FAQs">
                    <thead>
                        <tr>
                            <th>FAQs</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="FAQs/FAQ">
                            <tr>
                                <td><xsl:value-of select="title"/></td>
                            </tr>

                            <tr>
                                <td><xsl:value-of select="description"/></td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>