env:
	@if [ ! -f .env ]; then cp .env.example .env; else echo ".env already exists. Skipping."; fi

compose: env
	cd docker && docker-compose down -v
	docker volume prune -f
	cd docker && docker-compose up --build -d
	docker logs website -f
