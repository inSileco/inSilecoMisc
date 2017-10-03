rfun := $(wildcard R/*.R)
rman := $(wildcard man/)
rtes := $(wildcard tests/testthat/*.R)
rdm = README.Rmd
md = README.md
chk = record_updates.txt
rscr = ../pkg2date.R

all: $(md)

$(chk): $(rfun) $(rtes) $(rtes) DESCRIPTION
	Rscript --no-init-file $(rscr) 1

readme:
	Rscript --no-init-file $(rscr) 0

check:
	Rscript --no-init-file -e "devtools::check('.')"

clean:
	rm -rf man/* NAMESPACE
