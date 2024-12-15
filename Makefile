all: results/figure/isles.png results/figure/abyss.png results/figure/last.png results/figure/sierra.png report/count_report.html

report/count_report.html: report/count_report.qmd
	quarto render $<

results/figure/%.png: results/%.dat scripts/plotcount.py
	python scripts/plotcount.py --input_file=$< --output_file=$@

results/%.dat: data/%.txt scripts/wordcount.py
	python scripts/wordcount.py --input_file=$< --output_file=$@

clean:
	rm -f results/*.dat results/figure/*.png report/*.html