cache-images:
	mkdir -p images
	scripts/cache-images.sh

run:
	cd example \
	  && docker compose up -d \
		&& docker compose logs -f

fresh:
	cd example \
		&& docker compose stop \
		&& docker compose kill \
		&& docker compose rm -fv

build:
	docker build -t sandipndevgaloy/galoy-regtest-box:latest .

push:
	docker push sandipndevgaloy/galoy-regtest-box:latest
