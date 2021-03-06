.PHONY: all cbc2013 cbc2014 cbc2015 cbc2016 root deploy-live deploy-dev-el dirs latest-dev-deploy

all: dirs cbc2013 cbc2014 cbc2015 cbc2016 root
	cp -rT out/root out/cbcdev
	cp -rT out/2016 out/cbcdev/2016
	cp -rT out/2015 out/cbcdev/2015
	cp -rT out/2014 out/cbcdev/2014
	cp -rT out/2013 out/cbcdev/2013
	cp root_static/* out/cbcdev/
	cp root_static/.htaccess out/cbcdev/

root:
	staticjinja build --srcpath=root/ --outpath=out/root/ --static=static

cbc2013:
	staticjinja build --srcpath=2013/ --outpath=out/2013/ --static=static

cbc2014:
	staticjinja build --srcpath=2014/ --outpath=out/2014/ --static=static

cbc2015:
	staticjinja build --srcpath=2015/ --outpath=out/2015/ --static=static

cbc2016:
	staticjinja build --srcpath=2016/ --outpath=out/2016/ --static=static

#deploy-dev-au: all
#	rsync -av out/cbcdev/ uranium@emerald.antanas.org:/home/uranium/cbcdev

deploy-live: all
	rsync -av out/cbcdev/ mr472@files.srcf.net:/societies/cbconf/public_html/

#deploy-dev-el: all
#	rsync -av out/cbcdev/ el398@files.srcf.net:~/public_html/dev

deploy-dev: all
	rsync -av out/cbcdev/ mr472@files.srcf.net:/societies/cbconf/public_html/dev/

dirs:
	mkdir -p out/root/
	mkdir -p out/2013/
	mkdir -p out/2014/
	mkdir -p out/2015/
	mkdir -p out/2016/

#latest-dev-deploy:
#	make cbc2015
#	cp -rT out/2015 out/cbcdev/2015
#	rsync -av out/cbcdev/ el398@files.srcf.net:~/public_html/dev
