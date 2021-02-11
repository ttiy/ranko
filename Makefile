.DEFAULT_GOAL := usage

up.all:
	rm -f tmp/pids/server.pid
	docker-compose up -d
	docker-compose exec app bundle install
	docker-compose exec app bundle exec rails db:create db:migrate db:seed
	docker-compose exec app yarn install
	docker-compose exec app bundle exec rails s -b '0.0.0.0'