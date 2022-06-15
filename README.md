
# useR!2022 - Talk - A tour of **knitr** engines

<!-- badges: start -->
<!-- badges: end -->

This is the repository with the resources for the talk at useR!2022 about **knitr** engines

* Presentation: https://user2022-knitr-engines.netlify.app/

## What is available in this repo ?

### Important files!

* `slides/` is the folder containing the **xaringan** presentation source and related resources. Looking at the Rmd source can be interesting to see advanced usage of R Markdown.

### Other files.

* `renv/`: infrastructure for **renv** package managament
* `.Rprofile`: used for activating **renv** when entering the project
* `Makefile`: used as workflow tool to render the different contents. (if you don't know makefile, just use R code directly)


## Getting started...

To run this project locally here are the steps

* Clone or fork this repository

* This project uses **renv** - this means that when you open the RStudio project it should install **renv** and ask you to restore all the environment
  ```r
  renv::restore()
  ```
* If you want to run the slides, don't forget to download remark
  ```r
  xfun::in_dir("slides/", xaringan::summon_remark())
  ```
* Everything should now be setup and you can render the different documents.

One can also run `make init` to do both steps in one call in terminal.

## Rendering the different documents

This project uses a _Makefile_ to render the document.

* Render the presentation
  ```sh
  make render-slides
  ```
  Once built, `servr::httd("slides")` can be used to serve the presentation locally

> I don't know about Makefile - Can I just use R and RStudio ?

Yes you can ! Just use the knit button in RStudio. The output filename could be different, but this repo is just about demo and toying with examples, so it does not matter much.

Otherwise, you can just use the `rmarkdown::render()`.
