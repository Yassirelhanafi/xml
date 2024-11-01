<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title>Cloud Hybride</title>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.min.js"></script>
                <style>
                    body {
                        font-family: Arial, sans-serif;
                        margin: 20px;
                        color: #333;
                    }
                    h1 {
                        text-align: center;
                        color: #0066cc;
                    }
                    h2 {
                        color: #00509e;
                        border-bottom: 2px solid #00509e;
                        padding-bottom: 5px;
                    }
                    h3 {
                        color: #333;
                        margin-top: 10px;
                    }
                    p {
                        margin: 10px 0;
                    }
                    ul {
                        padding-left: 20px;
                    }
                    li {
                        margin: 5px 0;
                    }
                    #content {
                        border: 1px solid #ddd;
                        padding: 20px;
                        background-color: #f9f9f9;
                        border-radius: 8px;
                        max-width: 800px;
                        margin: auto;
                    }
                    button {
                        display: block;
                        margin: 20px auto;
                        padding: 10px 20px;
                        font-size: 16px;
                        color: #fff;
                        background-color: #0066cc;
                        border: none;
                        border-radius: 5px;
                        cursor: pointer;
                    }
                    button:hover {
                        background-color: #00509e;
                    }
                    .image-container {
                        text-align: center;
                        margin: 10px 0;
                    }
                    .image-container img {
                        width: 400px;
                        height: 300px;
                        object-fit: cover;
                        border-radius: 8px;
                    }
                </style>
            </head>
            <body>
                <h1>Cloud Hybride</h1>
                <button onclick="generatePDF()">Générer PDF</button>
                <div id="content">
                    <h2>Introduction</h2>
                    <h3><xsl:value-of select="cloud_hybrid/overview/overview_question"/></h3>
                    <p><xsl:value-of select="cloud_hybrid/overview/overview_content"/></p>
                    <h3>Importance du cloud hybride</h3>
                    <p><xsl:value-of select="cloud_hybrid/overview/overiew_importance"/></p>
                    <ul>
                        <xsl:for-each select="cloud_hybrid/overview/benefits/benefit">
                            <li><xsl:value-of select="."/></li>
                        </xsl:for-each>
                    </ul>

                    <h2>Écosystèmes Cloud ouverts et extensibles</h2>
                    <div style="display: flex; justify-content: space-between;">
                        <div style="flex: 1; margin-right: 10px;">
                            <p><xsl:value-of select="cloud_hybrid/ecosysteme/content"/></p>
                            <ul>
                                <xsl:for-each select="cloud_hybrid/ecosysteme/content/list/item">
                                    <li><xsl:value-of select="."/></li>
                                </xsl:for-each>
                            </ul>
                        </div>
                        <div style="flex: 1; margin-left: 10px;">
                            <h3>Plates-formes de gestion de Cloud</h3>
                            <p><xsl:value-of select="cloud_hybrid/ecosysteme/plateforme"/></p>
                            <ul>
                                <xsl:for-each select="cloud_hybrid/ecosysteme/plateforme/list/item">
                                    <li><xsl:value-of select="."/></li>
                                </xsl:for-each>
                            </ul>
                        </div>
                    </div>

                    <h2>Technologies</h2>
                    <xsl:for-each select="cloud_hybrid/technologies/technology">
                        <h3><xsl:value-of select="tech_name"/></h3>
                        <p><xsl:value-of select="tech_description"/></p>
                        <ul>
                            <xsl:for-each select="cloud_hybrid/technologies/technology/tech_description/list/item">
                                <li><xsl:value-of select="."/></li>
                            </xsl:for-each>
                        </ul>
                        <div class="image-container">
                            <img src="{image}" alt="Image de la technologie"/>
                        </div>
                    </xsl:for-each>

                    <h2>Cas d'utilisation</h2>
                    <xsl:for-each select="cloud_hybrid/use_cases/use_case">
                        <h3><xsl:value-of select="usecase_title"/></h3>
                        <p><xsl:value-of select="usecase_description"/></p>
                    </xsl:for-each>

                    <h2>Sécurité</h2>
                    <xsl:for-each select="cloud_hybrid/security/strategy">
                        <h3><xsl:value-of select="security_title"/></h3>
                        <p><xsl:value-of select="security_details"/></p>
                    </xsl:for-each>

                    <h2>Futur</h2>
                    <xsl:for-each select="cloud_hybrid/future/trend">
                        <h3><xsl:value-of select="trend_title"/></h3>
                        <p><xsl:value-of select="trend_description"/></p>
                    </xsl:for-each>
                </div>
                <script>
                    function generatePDF() {
                        const element = document.getElementById('content');
                        html2pdf()
                            .from(element)
                            .save('cloud_hybrid.pdf');
                    }
                </script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
