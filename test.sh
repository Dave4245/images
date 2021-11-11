echo "Creating server named $1."

if [ "$2" ]; then
  printf "Usage: \nArg1 = Name of docker container\nArg2 = Port" && exit 1
fi

RESPONSE=$(docker container create --name "$1" ghcr.io/dave4245/images:manhunt)

if [[ $RESPONSE == Error* ]] ; then
    echo "Error whilst create docker container: $RESPONSE" && exit 1
fi

SOURCE="/var/lib/docker/volumes/$RESPONSE/"
TARGET="/home/container/"

cp -r /root/templates/manhunt/ "$SOURCE"

RUN_RESPONSE=$(docker run -p "$2":25565 -v "$S0RUCE":$TARGET)

echo "$RUN_RESPONSE"
exit 0