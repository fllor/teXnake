LATEX=pdflatex
FLAGS=-output-directory=build -halt-on-error

.PHONY: all
all: Snake.pdf teXnake.pdf

teXnake.pdf: Main.tex draw_snake.tex
	mkdir -p build
	$(LATEX) $(FLAGS) $<
	$(LATEX) $(FLAGS) $<
	mv build/Main.pdf $@

Snake.pdf: Snake.tex draw_snake.tex
	mkdir -p build
	$(LATEX) $(FLAGS) $<
	mv build/$@ .

.PHONY: clean
clean:
	rm -rf build teXnake.pdf Snake.pdf
