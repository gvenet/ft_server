docker stop bongo 
docker rmi -f bongo/image debian
echo''
echo '================================================== CONTAINERS ==================================================';
docker ps -a
echo ''
echo '==================================================== IMAGES ====================================================';
docker images
