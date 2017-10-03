rfun := $(wildcard R/*.R)
rtes := $(wildcard tests/testthat/*.R)
rman := $(wildcard man/)
rdm = README.Rmd
md = README.md
rscr = ../pkg2date.R

all: $(rman)

$(rman): $(rfun) $(rtes) DESCRIPTION
	Rscript --no-init-file $(rscr) 1

readme:
	Rscript --no-init-file $(rscr) 0

check:
	Rscript --no-init-file -e "devtools::check('.')"

clean:
	rm -rf man/* NAMESPACE
