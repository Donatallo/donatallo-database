all: check

# kwalify doesn't correctly set exit code on errors, so we need
# the logfile hackery
check:
	@for f in *.yaml; do \
		if [ "$$f" = "meta.yaml" ]; then \
			kwalify -lf schemas/meta.yaml "$$f"; \
		elif [ "$$f" = "methods.yaml" ]; then \
			kwalify -lf schemas/methods.yaml "$$f"; \
		else \
			kwalify -lf schemas/projects.yaml "$$f"; \
		fi; \
	done | tee kwalify.log
	@if grep -q INVALID kwalify.log; then \
		echo "Validation failed"; \
		rm -f kwalify.log; \
		false; \
	else \
		rm -f kwalify.log; \
	fi
