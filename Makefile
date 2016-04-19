all: check

check:
	@for f in *.yml; do \
		if [ "$$f" = "meta.yml" ]; then \
			kwalify -lf schemas/meta.yml "$$f"; \
		else \
			kwalify -lf schemas/data.yml "$$f"; \
		fi; \
	done
