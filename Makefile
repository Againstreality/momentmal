all: git ipfs

ipfs:
	jekyll b --config _configipfs.yml
	ipfs name publish `ipfs add -r -q _site/ | tail -n 1`

git:
	jekyll b --config _config.yml  -d ../cccwi_homepage_bin
	cd ../cccwi_homepage_bin && git add . && git commit -m "update from make" && git push

clean:
	rm -rf _site
