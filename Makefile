test:
	@echo Run a few basic tests
	bash -n local-deploy
	bash -n remote-deploy
	test -f /bin/bash

install: test
	@echo Install shdeploy to /usr/local/bin/
	cp local-deploy /usr/local/bin/shdeploy
	@echo Install shremote to /var/lib/shdeploy/
	mkdir -p /var/lib/shdeploy/
	cp remote-deploy /var/lib/shdeploy/shremote
	sed -i 's/^REMOTE_DEPLOY_COMMAND=.*/REMOTE_DEPLOY_COMMAND=\/var\/lib\/shdeploy\/shremote/' \
		/usr/local/bin/shdeploy
