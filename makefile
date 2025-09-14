.PHONY: start
start: ## starts the minecraft server
	@echo "Starting Minecraft Server..."; \
	docker pull marctv/minecraft-papermc-server:latest
	docker compose up -d --build;

.PHONY: stop
stop: ## stops and cleans up images (keeps data)
	@echo "Stopping Minecraft Server and cleaning up..."; \
	docker compose down --rmi all --remove-orphans;

.PHONY: attach
attach: ## attaches to the minecraft server
	@echo "Attaching to server"; \
	echo "Ctrl-C stops the server and exits"; \
	echo "Ctrl-d, Ctrl-p, Ctrl-q only exits"; \
	echo ""; \
	echo "Type "help" for help."; \
	docker attach LindaCraft-server --detach-keys=ctrl-d;

.PHONY: exec
exec: ## attaches to a bash session in the container
	@echo "Attaching with bash"; \
	docker exec -it LindaCraft-server /bin/bash;
