HOME = ./
DATA = $(HOME).data/
WP = $(DATA)wordpress/
WPCONFIG = srcs/wordpress/wp-config.php

REDIS = $(WP)wp-content/plugins/redis-cache/

ADM = $(DATA)adminer/
ADMFILE = srcs/adminer/adminer.php

start: $(WP) $(WP)wp-config.php $(REDIS) $(ADM)
	docker-compose -f srcs/docker-compose.yml build
	docker-compose -f srcs/docker-compose.yml up

$(DATA):
	mkdir -p $(DATA)
	mkdir -p $(DATA)mysql

$(WP): $(DATA)
	mkdir -p $(WP)
	tar xf srcs/wordpress/wordpress.tar.gz --strip-components 1 -C $(WP)

$(WP)wp-config.php: $(WPCONFIG)
	cp $(WPCONFIG) $(WP)

$(REDIS): $(WP)
	mkdir -p $(REDIS)
	tar xf srcs/redis/redis-cache.tar.gz --strip-components 1 -C $(REDIS)
	cp $(REDIS)includes/object-cache.php $(WP)wp-content

$(ADM): $(DATA) $(ADMFILE)
	mkdir -p $(ADM)
	cp $(ADMFILE) $(ADM)

stop:
	docker-compose -f srcs/docker-compose.yml stop

clean:
	rm -rf $(DATA)
	docker-compose -f srcs/docker-compose.yml down
	docker volume rm inc_wp
	docker volume rm inc_mysql
	docker volume rm inc_adm
