setup:
	@make build
	@make up 
	@make composer-update
build:
	docker-compose build --no-cache --force-rm
stop:
	docker-compose stop
up:
	docker-compose up -d
composer-update:
	docker exec laravel-docker-database bash -c "composer update"
key-generate:
	docker exec laravel-docker-database bash -c "php artisan key:generate"
data:
	docker exec laravel-docker-database bash -c "php artisan migrate"
	docker exec laravel-docker-database bash -c "php artisan db:seed"
optimize:
	docker exec laravel-docker-database bash -c "php artisan optimize"
config-cache-clear:
	docker exec laravel-docker-database bash -c "php artisan config:cache"
	docker exec laravel-docker-database bash -c "php artisan cache:clear"
route-clear:
    docker exec laravel-docker-database bash -c "php artisan route:clear"
