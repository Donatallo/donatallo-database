all: check

# kwalify doesn't correctly set exit code on errors, so we need
# the logfile hackery
check:
	@for f in *.yml; do \
		if [ "$$f" = "meta.yml" ]; then \
			kwalify -lf schemas/meta.yml "$$f"; \
		else \
			kwalify -lf schemas/data.yml "$$f"; \
		fi; \
	done | tee kwalify.log
	@if grep -q INVALID kwalify.log; then \
		echo "Validation failed"; \
		rm -f kwalify.log; \
		false; \
	else \
		rm -f kwalify.log; \
	fi
