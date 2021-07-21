HOME = ./
DATA = $(HOME).data/
WP = $(DATA)wordpress/
WPCONFIG = $(WP)wp-config.php

start: $(WP)
	docker-compose -f srcs/docker-compose.yml build
	docker-compose -f srcs/docker-compose.yml up

$(WP): $(DATA) $(WPCONFIG)
	mkdir -p $(WP)
	tar xf srcs/php/wordpress.tar.gz --strip-components 1 -C $(DATA)wordpress

$(DATA):
	mkdir -p $(DATA)

$(WPCONFIG): srcs/php/wp-config.php
	cp srcs/php/wp-config.php $(WP)

stop:
	docker-compose -f srcs/docker-compose.yml stop

clean:
	rm -rf $(DATA)
	docker-compose -f srcs/docker-compose.yml down
