docker stop bongo
docker build --rm -t bongo/image . 
docker run --rm -d --name bongo -ti -p 80:80 -p 443:443 bongo/image
echo ''
echo '================================================== CONTAINERS ==================================================';
docker ps -a
echo ''
echo '==================================================== IMAGES ====================================================';
docker images
echo ''
echo '=============================================== WELCOME TO DEBIAN ==============================================';
docker container exec -ti bongo zsh
