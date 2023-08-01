prep-deps:
	cd dev && vendir sync
	cd dev/vendor \
		&& source envs/.envrc \
		&& envsubst < envs/.env.ci > ../.env.galoy \
		&& rm -rf envs
	cd dev/vendor \
		&& find . -type f -exec sed -i 's/bats-tests/e2e/g' {} +
