HOME = ./
DATA = $(HOME).data/
WP = $(DATA)wordpress/
WPCONFIG = srcs/wordpress/wp-config.php

PMA = $(DATA)phpmyadmin/
PMACONFIG = srcs/phpmyadmin/config.inc.php

start: $(WP)
	docker-compose -f srcs/docker-compose.yml build
	docker-compose -f srcs/docker-compose.yml up

$(DATA):
	mkdir -p $(DATA)

$(WP): $(DATA) $(WPCONFIG)
	mkdir -p $(WP)
	cp $(WPCONFIG) $(WP)
	tar xf srcs/wordpress/wordpress.tar.gz --strip-components 1 -C $(WP)

$(PMA): $(DATA) $(PMACONFIG)
	mkdir -p $(PMA)
	cp $(PMACONFIG) $(PMA)
	tar xf srcs/phpmyadmin/pma.tar.gz --strip-components 1 -C $(PMA)

stop:
	docker-compose -f srcs/docker-compose.yml stop

clean:
	rm -rf $(DATA)
	docker-compose -f srcs/docker-compose.yml down
