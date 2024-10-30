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
                        width: 400px; /* Set a fixed width */
                        height: 300px; /* Set a fixed height */
                        object-fit: cover; /* Ensure images maintain aspect ratio */
                        border-radius: 8px;
                    }
                </style>
            </head>
            <body>
                <h1>Cloud Hybride</h1>
                <button onclick="generatePDF()">Générer PDF</button>
                <div id="content">
                    <h2>Aperçu</h2>
                    <p><xsl:value-of select="cloud_hybrid/overview/overview_description"/></p>
                    <h3>Avantages</h3>
                    <ul>
                        <xsl:for-each select="cloud_hybrid/overview/benefits/benefit">
                            <li><xsl:value-of select="."/></li>
                        </xsl:for-each>
                    </ul>

                    <h2>Technologies</h2>
                    <xsl:for-each select="cloud_hybrid/technologies/technology">
                        <h3><xsl:value-of select="tech_name"/></h3>
                        <p><xsl:value-of select="tech_description"/></p>
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

                    <h2>Futur du Cloud Hybride</h2>
                    <xsl:for-each select="cloud_hybrid/future/trend">
                        <h3><xsl:value-of select="trend_title"/></h3>
                        <p><xsl:value-of select="trend_description"/></p>
                    </xsl:for-each>
                </div>

                <script>
                    function generatePDF() {
                        const element = document.getElementById('content');
                        const options = {
                            margin: 1,
                            filename: 'cloud_hybrid.pdf',
                            image: { type: 'jpeg', quality: 0.98 },
                            html2canvas: { scale: 2 },
                            jsPDF: { unit: 'in', format: 'letter', orientation: 'portrait' }
                        };
                        html2pdf().set(options).from(element).save();
                    }
                </script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
