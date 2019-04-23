CURRENT=`pwd`
cd $CURRENT/dockerfiles
docker-compose pull
docker-compose build
docker-compose stop
docker-compose up -d
# cleanup
docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
