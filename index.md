---
title       : Um teste para verificar a significância de clusters
subtitle    : Projeto de Pesquisa - TCC I
author      : Allan Vieira
job         : Orientador - Prof. Dr. André Cançado
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [mathjax, quiz, bootstrap, interactive] # {mathjax, quiz, bootstrap}
ext_widgets : #{rCharts: [libraries/nvd3, libraries/leaflet, libraries/dygraphs]}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
logo        : est_logo.png
biglogo     : unb_big_logo.png
assets      : {assets: ../../assets}
--- .class #id

<style type="text/css">
body {background:grey transparent;
}
.quiz-option label{
  display: inline;
  font-size: 1em;
}
ul.nav li::before { content: ""; }  
ul.nav li{ font-size: 18px; line-height: 24px;}
</style>



## Sumário
<br>
<br>

1. Introdução

2. Objetivos

3. Metodologia

4. Resultados Preliminares

5. Cronograma

6. Referências

--- .segue bg:grey
# O problema de pesquisa ...

--- .class #id
## Introdução

> - .fragment Expressivo desenvolvimento das técnicas de clustering nas últimas décadas;
<br>
> - .fragment _"Hype"_ de _Machine Learning_;
<br>
<br>
> - .fragment `Mas...`
  - .fragment algoritmos $\rightarrow$ restrições:
  - .fragment "shape" dos dados `vs` algoritmo empregado
  - .fragment `definição a priori do número de clusters`
<br>
> - .fragment $\rightarrow$ `"Blinded by Science"!!`
<br>
<br>
> - .fragment Muitos algoritmos de clustering `vs` poucos métodos de verificação do `k`
<br>
> - .fragment `Como determinar o número ideal de clusters?`


--- .class #id
## Objetivos
<br>
<br>
> - Desenvolver um algoritmo para testar a significância de clusters;
<br>
<br>
> - Implementar o algoritmo em R e disponibilizá-lo através de um pacote;



<!-- --- &twocol  -->
<!-- ## Metodologia (1) -->

<!-- - inspiração: `Cubic Clustering Criterion (CCC)` -->

<!-- - Algoritmo: -->

<!-- *** =left -->

<!-- <p><center><img src="./assets/img/alg1.svg" align="middle"> -->
<!-- </center></p> -->

<!-- *** =right -->

<!-- <p><center><img src="./assets/img/alg2.svg" align="middle"> -->
<!-- </center></p> -->


--- {class: class, tpl: tabs}

## Metodologia (1)

*** {class: active, id: kmeans}
Algumas restrições:

<!-- - _shape_ dos clusters; -->
<!-- - tamanhos diferentes em cada cluster; -->

<p>
<img src="./assets/img/nflunch11.svg" style="float: left; width: 24%; margin-right: 1%; margin-bottom: 0.5em;">

<img src="./assets/img/nflunch12.svg" style="float: left; width: 24%; margin-right: 1%; margin-bottom: 0.5em;">

<img src="./assets/img/nflunch21.svg" style="float: left; width: 24%; margin-right: 1%; margin-bottom: 0.5em;">

<img src="./assets/img/nflunch22.svg" style="float: left; width: 24%; margin-right: 1%; margin-bottom: 0.5em;">

<!-- <p> -->
<!-- <span style="font-size:0.7em; float: left">Baseado no conteúdo de:  -->
<!-- <a href="http://varianceexplained.org/r/kmeans-free-lunch/">http://varianceexplained.org/r/kmeans-free-lunch/</a> -->
<!-- </span> -->
<!-- </p> -->
</p>
<br>
<span style="font-size:0.7em; float: left">
Baseado no conteúdo de http://varianceexplained.org/r/kmeans-free-lunch/
</span>

<br>
<br>

> - .fragment $\rightarrow$ `No free lunch!!`



*** {id: left_right}
Funcionamento do kmeans:
<br>
<span style="font-size:0.7em; float: left">
(por Andrey A. Shabalin - http://shabal.in/)
</span>
<br>
<p>
<img src="./assets/img/left.gif" style="float: left; width: 48%; margin-right: 1%; margin-bottom: 0.5em;">
<img src="./assets/img/right.gif" style="float: right; width: 48%; margin-right: 1%; margin-bottom: 0.5em;">
</p>

*** {id: top_bottom}
<br>
<p>
<img src="./assets/img/top.gif" style="float: left; width: 48%; margin-right: 1%; margin-bottom: 0.5em;">
<img src="./assets/img/bottom.gif" style="float: right; width: 48%; margin-right: 1%; margin-bottom: 0.5em;">
</p>


--- .segue bg:grey
# O método proposto ...

--- .class #id
## Metodologia (2)

inspiração: `Cubic Clustering Criterion (CCC)`

<iframe src="./assets/widgets/hipercube_plotly.html" width=100% height=100% allowtransparency="true"> </iframe>



--- .class #id
## Metodologia (3)


<iframe src="./assets/widgets/withinss_cube_plotly.html" width=100% height=100% allowtransparency="true"> </iframe>


--- .segue bg:grey
# Alguns resultados ...

--- .class #id
<!-- --- .&twocol -->
## Resultados preliminares

<!-- *** =left -->



<!-- *** =right -->



<table id='onecol' style='width:100%'>  <tr><th>M</th> <th>n1</th> <th>n2</th> <th>mean1</th> <th>mean2</th> <th>sd1</th> <th>sd2</th> <th>acerto</th></tr> <tr><td data-th='M'>100</td> <td data-th='n1'> 32</td> <td data-th='n2'>29</td> <td data-th='mean1'>-3</td> <td data-th='mean2'>1</td> <td data-th='sd1'>0.4</td> <td data-th='sd2'>0.4</td> <td data-th='acerto'>TRUE</td></tr> <tr><td data-th='M'>100</td> <td data-th='n1'> 15</td> <td data-th='n2'>13</td> <td data-th='mean1'>-1</td> <td data-th='mean2'>1</td> <td data-th='sd1'>0.3</td> <td data-th='sd2'>0.3</td> <td data-th='acerto'>TRUE</td></tr> <tr><td data-th='M'>100</td> <td data-th='n1'> 50</td> <td data-th='n2'>65</td> <td data-th='mean1'>-1</td> <td data-th='mean2'>1</td> <td data-th='sd1'>1.0</td> <td data-th='sd2'>1.0</td> <td data-th='acerto'>FALSE</td></tr> <tr><td data-th='M'>100</td> <td data-th='n1'> 50</td> <td data-th='n2'>65</td> <td data-th='mean1'>-1</td> <td data-th='mean2'>1</td> <td data-th='sd1'>0.7</td> <td data-th='sd2'>0.7</td> <td data-th='acerto'>TRUE</td></tr> <tr><td data-th='M'>100</td> <td data-th='n1'>100</td> <td data-th='n2'>80</td> <td data-th='mean1'>-1</td> <td data-th='mean2'>1</td> <td data-th='sd1'>0.5</td> <td data-th='sd2'>0.7</td> <td data-th='acerto'>TRUE</td></tr> </table>
<br>
<p>
<img src="./assets/img/g1.svg" style="float: left; width: 19%; margin-right: 1%; margin-bottom: 0.5em;">

<img src="./assets/img/g2.svg" style="float: left; width: 19%; margin-right: 1%; margin-bottom: 0.5em;">

<img src="./assets/img/g3.svg" style="float: left; width: 19%; margin-right: 1%; margin-bottom: 0.5em;">

<img src="./assets/img/g4.svg" style="float: left; width: 19%; margin-right: 1%; margin-bottom: 0.5em;">

<img src="./assets/img/g5.svg" style="float: left; width: 19%; margin-right: 1%; margin-bottom: 0.5em;">
</p>

<!-- sol para imagens lado a lado: https://owlcation.com/stem/how-to-align-images-side-by-side -->


--- &twocol 
## Cronograma
<br>
<br>
*** =left
- 2S2017:
<p><center><img src="./assets/img/cron11.svg" align="middle">
</center></p>

*** =right
- 1S2018:
<p><center><img src="./assets/img/cron22.svg" align="middle">
</center></p>

--- .class #id
## Bibliografia

- [1] AUFFERMANN, W. F.; NGAN, S. C.; HU, X. `Cluster significance testing using the bootstrap.` NeuroImage, v. 17, p. 583–591, 2002.

- [2] BOTTOMLEY, P.; NAIRN, A. `Blinded by science: The managerial consequences of inadequately validated cluster analysis solutions.` International Journal of Market Research, v. 46, n. 2, 2004.

- [3] FUENTES, C.; CASELLA, G. `Testing for the existence of clusters.` p. 115–157, Jul 2009. Sort (Barc). 33(2).

- [4] HALKIDI Y. BATISTAKIS, M. V. M. `On clustering validation techniques. Journal of Intelligent Information Systems`, v. 17, n. 2/3, p. 107–145, 2001.

- [5] SAS Institute Inc., `Cubic Clustering Criterion.` 1983. SAS Technical Report A-108. Cary,
NC: SAS Institute Inc., 1983, 56 pp.

<!-- - [5] HANDL, J.; KNOWLES, J. `An evolutionary approach to objective clustering.` IEEE Transactions on Evolutionary Computation, v. 11, n. 1, Feb 2007. 2 -->

<!-- - [5] LIU, Y. et al. `Statistical significance of clustering for high-dimension, low-sample size data.` Journal of the American Statistical Association, v. 103, n. 483, p. 1281–1293, Sep 2008. 1 -->


--- .segue bg:grey

# Obrigado!!

<!-- como colocar figuras ao lado de palavras varias vezes em html -->
<div>
    <p>Feito no
    <img src="./assets/img/rball.png" style="float: center; width: 5%;"> com 
    <img src="./assets/img/slidifylogo2.png" style="float: center; width: 12%;">,
    <img src="./assets/img/plotlylogo.png" style="float: center; width: 7%;"> e
    <img src="./assets/img/ggplotlogo.png" style="float: center; width: 7%;"> !! </p>
</div>

Códigos e apresentação disponíveis no<img src="./assets/img/gitlogo5.png" style="float: center; width: 13%;">em:
<br>
<p>
<a href="http://github.com/allanvc/" style="color:black">http://github.com/allanvc/</a>
</p>

<p>
<a href="http://allanvc.github.io/apres_TCC1/" style="color:black">http://allanvc.github.io/apres_TCC1/</a>
</p>

