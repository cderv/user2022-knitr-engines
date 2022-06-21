.PHONY: render-slides deploy init

all: render-slides

# render presentation
render-slides: slides/index.html slides/useR2022-knitr-engines.html

slides/index.html: slides/slides.Rmd
		Rscript -e 'xfun::in_dir("slides", rmarkdown::render("$(<F)", output_file = "$(@F)", quiet = TRUE))'

# self contained version
slides/useR2022-knitr-engines.html: slides/slides.Rmd
		Rscript -e 'xfun::in_dir("slides", rmarkdown::render("$(<F)", output_file = "$(@F)", quiet = TRUE))'

# deployement
## this require the netlify cli to be setup
deploy:
		cd slides && \
		netlify deploy --dir=. --prod || echo '## >> netlify not configured - deployement skipped'

init:
		RScript -e 'renv::restore()'
		cd slides && RScript -e 'xaringan::summon_remark()'
