prep-deps:
	cd dev && vendir sync
	cd dev/vendor \
		&& source envs/.envrc \
		&& envsubst < envs/.env.ci > ../.env.galoy \
		&& rm -rf envs
