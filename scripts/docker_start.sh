export MY_CONTAINER="pytorch_19_132_ubuntu1804"
num=`docker ps -a|grep "$MY_CONTAINER"|wc -l`
echo $num
echo $MY_CONTAINER
if [ 0 -eq $num ]
then
  echo "create"
  docker run \
  --shm-size '64gb' \
  --device /dev/cambricon_dev4 \
  --device /dev/cambricon_dev5 \
  --device /dev/cambricon_ctl \
  -it --name $MY_CONTAINER \
  --privileged \
  --net=host \
  -v /usr/bin/cnmon:/usr/bin/cnmon \
  -v `pwd`:/mnt \
  -v /algo/pytorch_datasets/:/algo/pytorch_datasets/ \
  yellow.hub.cambricon.com/pytorch/pytorch:v1.3.2-torch1.9-ubuntu18.04 \
  /bin/bash
else 
  echo "run"
  docker start $MY_CONTAINER
  docker exec -ti $MY_CONTAINER /bin/bash
fi
date


#  -v /workspace/datasets/:/data \
