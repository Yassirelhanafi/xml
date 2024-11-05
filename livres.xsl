<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title>Cloud Hybride</title>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.min.js"></script>
                <style>
                    /* Global Styles */
                    body {
                        font-family: 'Roboto', sans-serif;
                        color: #3a3a3a;
                        background-color: #f0f2f5;
                        line-height: 1.6;
                        margin: 0;
                        padding: 20px;
                    }

                    h1, h2, h3 {
                        color: #004d99;
                        margin-bottom: 15px;
                    }

                    h1 {
                        font-size: 2.5em;
                        text-align: center;
                        margin-top: 0;
                    }

                    h2 {
                        font-size: 1.8em;
                        border-bottom: 3px solid #004d99;
                        padding-bottom: 5px;
                        margin-top: 30px;
                    }

                    h3 {
                        font-size: 1.4em;
                        color: #333;
                        margin-top: 20px;
                        font-weight: 600;
                    }

                    p, li {
                        font-size: 1.1em;
                        margin: 8px 0;
                    }

                    ul {
                        list-style-type: square;
                        padding-left: 20px;
                    }

                    a {
                        color: #0066cc;
                        text-decoration: none;
                    }

                    /* Container */
                    #content {
                        background: #ffffff;
                        border: 1px solid #e0e0e0;
                        padding: 25px;
                        border-radius: 8px;
                        max-width: 800px;
                        margin: auto;
                        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                    }

                    /* Button */
                    button {
                        background-color: #004d99;
                        color: #fff;
                        border: none;
                        padding: 12px 25px;
                        border-radius: 5px;
                        font-size: 1.1em;
                        cursor: pointer;
                        transition: background-color 0.3s;
                    }

                    button:hover {
                        background-color: #003366;
                    }

                    /* Image Styling */
                    .image-container {
                        text-align: center;
                        margin: 15px 0;
                    }

                    .image-container img {
                        width: 100%;
                        max-width: 400px;
                        height: auto;
                        object-fit: cover;
                        border-radius: 8px;
                        border: 1px solid #ddd;
                    }

                    /* Section Layout */
                    .flex-container {
                        display: flex;
                        flex-wrap: wrap;
                        gap: 15px;
                        justify-content: space-between;
                    }

                    .flex-item {
                        flex: 1 1 45%;
                        padding: 10px;
                        border: 1px solid #e0e0e0;
                        border-radius: 8px;
                        background-color: #f9f9f9;
                    }
                </style>
            </head>
            <body>
                <h1>Cloud Hybride</h1>
                <button onclick="generatePDF()">Générer PDF</button>
                <div id="content">
                    <h2>Sommaire</h2>
                    <ul>
                        <li><a href="#introduction">Introduction</a></li>
                        <li><a href="#ecosystem">Écosystèmes Cloud ouverts et extensibles</a></li>
                        <li><a href="#technologies">Technologies</a></li>
                        <li><a href="#use_cases">Cas d'utilisation</a></li>
                        <li><a href="#security">Sécurité</a></li>
                        <li><a href="#future">Futur</a></li>
                    </ul>
                    <h2 id="introduction">Introduction</h2>
                    <h3><xsl:value-of select="cloud_hybrid/overview/overview_question"/></h3>
                    <p><xsl:value-of select="cloud_hybrid/overview/overview_content"/></p>
                    <h3>Importance du cloud hybride</h3>
                    <p><xsl:value-of select="cloud_hybrid/overview/overview_importance"/></p>
                    <ul>
                        <xsl:for-each select="cloud_hybrid/overview/benefits/benefit">
                            <li><xsl:value-of select="."/></li>
                        </xsl:for-each>
                    </ul>

                    <h2 id="ecosystem">Écosystèmes Cloud ouverts et extensibles</h2>
                    <div class="flex-container">
                        <div class="flex-item">
                            <p><xsl:value-of select="cloud_hybrid/ecosysteme/content_container/content"/></p>
                            <ul>
                                <xsl:for-each select="cloud_hybrid/ecosysteme/content_container/list/item">
                                    <li><xsl:value-of select="."/></li>
                                </xsl:for-each>
                            </ul>
                        </div>
                        <div class="flex-item">
                            <h3>Plates-formes de gestion de Cloud</h3>
                            <p><xsl:value-of select="cloud_hybrid/ecosysteme/plateforme_container/plateforme"/></p>
                            <ul>
                                <xsl:for-each select="cloud_hybrid/ecosysteme/plateforme_container/list/item">
                                    <li><xsl:value-of select="."/></li>
                                </xsl:for-each>
                            </ul>
                        </div>
                    </div>

                    <h2 id="technologies">Technologies</h2>
                    <xsl:for-each select="cloud_hybrid/technologies/technology">
                        <h3><xsl:value-of select="tech_name"/></h3>
                        <p><xsl:value-of select="tech_description"/></p>
                        <ul>
                            <xsl:for-each select="tech_description/list/item">
                                <li><xsl:value-of select="."/></li>
                            </xsl:for-each>
                        </ul>
                        <div class="image-container">
                            <img src="{image}" alt="Image de la technologie"/>
                        </div>
                    </xsl:for-each>

                    <h2 id="use_cases">Cas d'utilisation</h2>
                    <xsl:for-each select="cloud_hybrid/use_cases/use_case">
                        <h3><xsl:value-of select="usecase_title"/></h3>
                        <p><xsl:value-of select="user_container/usecase_description"/></p>
                    
                        <xsl:if test="user_container/list">
                            <ul>
                                <xsl:for-each select="user_container/list/item">
                                    <li><xsl:value-of select="."/></li>
                                </xsl:for-each>
                            </ul>
                        </xsl:if>
                    </xsl:for-each>

                    <h2 id="security">Sécurité</h2>
                    <xsl:for-each select="cloud_hybrid/security/strategy">
                        <h3><xsl:value-of select="security_title"/></h3>
                        <p><xsl:value-of select="security_container/security_details"/></p>
                        
                        <xsl:if test="security_container/list">
                            <ul>
                                <xsl:for-each select="security_container/list/item">
                                    <li><xsl:value-of select="."/></li>
                                </xsl:for-each>
                            </ul>
                        </xsl:if>
                    </xsl:for-each>

                    <h2 id="future">Futur</h2>
                    <xsl:for-each select="cloud_hybrid/future/trend">
                        <h3><xsl:value-of select="trend_title"/></h3>
                        <p><xsl:value-of select="trend_description"/></p>
                    </xsl:for-each>
                </div>
                <script>
                    function generatePDF() {
                        const element = document.getElementById('content');
                        html2pdf().from(element).save('cloud_hybrid.pdf');
                    }
                </script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
