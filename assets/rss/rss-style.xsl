<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:atom="http://www.w3.org/2005/Atom">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml" lang="en">
      <head>
        <title>
          Updates on Events (RSS Feed) |
          <xsl:value-of select="/atom:feed/atom:title"/>
        </title>
        <meta charset="utf-8"/>
        <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"/>
      </head>
      <body>
	      <main class="layout-content">
		      <div class="container">
          <div class="alert alert-info">
		  <strong>Updates from Department of CSE, IIT Palakkad</strong>. 
			  Subscribe by copying the URL from the address bar into your 
			  newsreader.           
	  </div>
          <div class="container md-4">
            <h1 class="flex items-start">
              <!-- https://commons.wikimedia.org/wiki/File:Feed-icon.svg -->
              <svg xmlns="http://www.w3.org/2000/svg" version="1.1"
                   class="mr-5"
                   style="flex-shrink: 0; width: 1em; height: 1em;"
                   viewBox="0 0 256 256">
                <defs>
                  <linearGradient x1="0.085" y1="0.085" x2="0.915" y2="0.915"
                                  id="RSSg">
                    <stop offset="0.0" stop-color="#E3702D"/>
                    <stop offset="0.1071" stop-color="#EA7D31"/>
                    <stop offset="0.3503" stop-color="#F69537"/>
                    <stop offset="0.5" stop-color="#FB9E3A"/>
                    <stop offset="0.7016" stop-color="#EA7C31"/>
                    <stop offset="0.8866" stop-color="#DE642B"/>
                    <stop offset="1.0" stop-color="#D95B29"/>
                  </linearGradient>
                </defs>
                <rect width="256" height="256" rx="55" ry="55" x="0" y="0"
                      fill="#CC5D15"/>
                <rect width="246" height="246" rx="50" ry="50" x="5" y="5"
                      fill="#F49C52"/>
                <rect width="236" height="236" rx="47" ry="47" x="10" y="10"
                      fill="url(#RSSg)"/>
                <circle cx="68" cy="189" r="24" fill="#FFF"/>
                <path
                  d="M160 213h-34a82 82 0 0 0 -82 -82v-34a116 116 0 0 1 116 116z"
                  fill="#FFF"/>
                <path
                  d="M184 213A140 140 0 0 0 44 73 V 38a175 175 0 0 1 175 175z"
                  fill="#FFF"/>
              </svg>
	      <a>
		      <xsl:attribute name="href">
		     <xsl:value-of select="atom:link"/>
		     </xsl:attribute>
            Latest Events, Talks and Lecture series 
	     </a>
     </h1>
              <div class="container md-4">
            <xsl:for-each select="/atom:feed/atom:entry">
                <div class="text-4 font-bold">
                  <h3>
                    <xsl:value-of select="atom:title"/>
                  </h3>
		  </div> 

                <div class="text-2 text-offset">
			<strong>Description: </strong> <xsl:value-of select="atom:description" />
		  </div> 

                <div class="text-2 text-offset">
			<strong>Date: </strong><xsl:value-of select="atom:published" />
		  </div> 

		  <div class="text-2 text-offset">
			  <a>
			  <xsl:attribute name="href">
				  <xsl:value-of select="atom:link"/>
			  </xsl:attribute>
			<strong>Link to event</strong>
			  </a>
		  </div>
	      </xsl:for-each>
	      </div>
      </div>
      </div>
        </main>
</body>
<footer>
	<div class="container text-center p-5">
		<div class="text-muted">
			Department of Computer Science and Engineering, IIT Palakkad
		</div>
	</div>
</footer>
    </html>
  </xsl:template>
</xsl:stylesheet>
