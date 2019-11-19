#!/bin/bash

#############################
# YARN의 정보확인을 위한 rest api 사용 방법 
#############################

# YARN 정보 
curl -s http://$(hostname -f):8088/ws/v1/cluster/info | jq
curl -s http://$(hostname -f):8088/ws/v1/cluster/metrics | jq
curl -s http://$(hostname -f):8088/ws/v1/cluster/scheduler | jq
curl -s http://$(hostname -f):8088/ws/v1/cluster/apps | jq

# 애플리케이션 실행 정보 확인 
curl -s http://$(hostname -f):8088/ws/v1/cluster/appstatistics | jq
curl -s "http://$(hostname -f):8088/ws/v1/cluster/appstatistics?states=accepted,running,finished&applicationTypes=mapreduce" | jq

# 애플리케이션 정보 확인 
curl -s http://$(hostname -f):8088/ws/v1/cluster/apps/__application__id__ | jq
curl -s http://$(hostname -f):8088/ws/v1/cluster/apps/__application__id__/queue | jq
curl -s http://$(hostname -f):8088/ws/v1/cluster/apps/__application__id__/state | jq
curl -s http://$(hostname -f):8088/ws/v1/cluster/apps/__application__id__/appattempts | jq

# 노드 정보 확인 
curl -s http://$(hostname -f):8088/ws/v1/cluster/nodes | jq
curl -s http://$(hostname -f):8088/ws/v1/cluster/nodes/__node__id__ | jq
