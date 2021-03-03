# Remove all containers
for id in $(docker ps -a|tail -n +2|awk '{ print $1 }')
do sudo docker rm $id; done

# Remove all images
for id in $(docker images|tail -n +2|awk '{ print $3 }')
do sudo docker rmi $id; done
