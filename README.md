textBits: Bits and Pieces of Code for Acquiring, Cleaning, and Working
with Text
================

This is a clearinghouse for bits and pieces of code pertaining to
gathering, cleaning, and working with text. In many cases, the code here
will have been put together to help a researcher with a specific
problem; if I think it might be more broadly useful, I’ll share it here.
And some of these items are just bits that I think are kind of cool.

-   [Prepping Data from Specific
    Sources](#prepping-data-from-specific-sources)
    -   [Prepping News Articles from Nexis Uni (Folder:
        `nexisUniNews`)](#prepping-news-articles-from-nexis-uni-(folder:-%60nexisuninews%60))

## Prepping Data from Specific Sources

### Prepping News Articles from Nexis Uni (Folder: `nexisUniNews`)

The `processNexisNews` function reads PDFs of news articles downloaded
from Nexis Uni into R, domes some parsing and cleaning, and stores as a
dataframe. Source the
[`nexisFunctions.R`](https://github.com/burrowsdt/textBits/blob/main/nexisUniNews/nexisFunctions.R)
file and then run the function with the filepath to the folder with all
of your articles as an argument (see below). See the
[vignette](https://github.com/burrowsdt/textBits/blob/main/nexisUniNews/NexisUniNewsArticles.pdf)
for a quick overview.

``` r
source("nexisUniNews/nexisFunctions.R")
processNexisNews("nexisUniNews/data/")
```

    ## # A tibble: 4 x 4
    ##   doc_id                date       publication              text                
    ##   <chr>                 <date>     <chr>                    <chr>               
    ## 1 Azerbaijan Opera and~ 2021-03-09 MENAFN - Business & Fin~ "Link to Image\nLin~
    ## 2 From rock to opera, ~ 2021-03-11 The Christian Science M~ "As a dirty, dishev~
    ## 3 Palm Beach Opera Pre~ 2021-03-05 Palm Beach Opera Presen~ "PR Newswire\nWEST ~
    ## 4 WIU OPERA WORKSHOP H~ 2021-03-08 US Fed News              "MACOMB, Ill., Marc~
