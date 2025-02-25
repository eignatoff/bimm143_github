---
author:
- Emily Ignatoff (A16732102)
authors:
- Emily Ignatoff (A16732102)
title: Homework Class 6
toc-title: Table of contents
---

Original provided code:

:::::::::: cell
``` {.r .cell-code}
library(bio3d)
```

::: {.cell-output .cell-output-stderr}
    Warning: package 'bio3d' was built under R version 4.3.3
:::

``` {.r .cell-code}
s1 <- read.pdb("4AKE") # kinase with drug
```

::: {.cell-output .cell-output-stdout}
      Note: Accessing on-line PDB file
:::

``` {.r .cell-code}
s2 <- read.pdb("1AKE") # kinase no drug
```

::: {.cell-output .cell-output-stdout}
      Note: Accessing on-line PDB file
       PDB has ALT records, taking A only, rm.alt=TRUE
:::

``` {.r .cell-code}
s3 <- read.pdb("1E4Y") # kinase with drug
```

::: {.cell-output .cell-output-stdout}
      Note: Accessing on-line PDB file
:::

``` {.r .cell-code}
s1.chainA <- trim.pdb(s1, chain="A", elety="CA")
s2.chainA <- trim.pdb(s2, chain="A", elety="CA")
s3.chainA <- trim.pdb(s1, chain="A", elety="CA")
s1.b <- s1.chainA$atom$b
s2.b <- s2.chainA$atom$b
s3.b <- s3.chainA$atom$b
plotb3(s1.b, sse=s1.chainA, typ="l", ylab="Bfactor")
```

::: cell-output-display
![](class06hw_files/figure-markdown/unnamed-chunk-1-1.png)
:::

``` {.r .cell-code}
plotb3(s2.b, sse=s2.chainA, typ="l", ylab="Bfactor")
```

::: cell-output-display
![](class06hw_files/figure-markdown/unnamed-chunk-1-2.png)
:::

``` {.r .cell-code}
plotb3(s3.b, sse=s3.chainA, typ="l", ylab="Bfactor")
```

::: cell-output-display
![](class06hw_files/figure-markdown/unnamed-chunk-1-3.png)
:::
::::::::::

Goal and Documentation

> I want to make a function that will condense this process. I assume
> that each step which is completed 3 times (downloading sequences,
> trimming, identifiying the b values of data, and plotting) are the
> targets to condense in a function

> Q: What are the inputs for the function? A PDB associated with a 4
> letter/number code

> Q: What does the function do? The PDB will be trimmed, item b of the
> atom dataframe will be isolated, then made into a line plot of residue
> vs bfactor with secondary structure annotated in the margins.

> Q: What are the outputs for the function? A line plot of residue
> versus bfactor with secondary structures in the margin.

Function:

::: cell
``` {.r .cell-code}
protein_drug <- function(input = read.pdb()) {
  s1 <- input
  s1.chainA <- trim.pdb(s1, chain= "A", elety= "CA") 
  s1.b <- s1.chainA$atom$b 
  plotb3(s1.b, sse=s1.chainA, typ="l", ylab="Bfactor")  
}
```
:::

Testing Function:

::::::: cell
``` {.r .cell-code}
protein_drug(read.pdb("1AKE"))
```

::: {.cell-output .cell-output-stdout}
      Note: Accessing on-line PDB file
:::

::: {.cell-output .cell-output-stderr}
    Warning in get.pdb(file, path = tempdir(), verbose = FALSE):
    C:\Users\goose\AppData\Local\Temp\RtmpKGjTia/1AKE.pdb exists. Skipping download
:::

::: {.cell-output .cell-output-stdout}
       PDB has ALT records, taking A only, rm.alt=TRUE
:::

::: cell-output-display
![](class06hw_files/figure-markdown/unnamed-chunk-3-1.png)
:::
:::::::
