# 리소스 매니저 REST API
YARN 리소스매니저는 REST API를 이용하여 정보를 확인할 수 있습니다. EMR에서도 마스터노드에서 해당 정보를 확인할 수 있습니다. 

기본설정으로 HTTP로 요청하면 json 형태로 값을 반환하기 때문에 `curl`, `jq` 명령을 이용하여 효율적으로 값을 확인할 수 있습니다. 

# 리소스 매니저 설정 
리소스 매니저의 정보, 설정 상태, 운영상황을 확인하기 위한 정보는 다음과 같습니다. 

```bash
# 클러스터 정보
curl -s http://$(hostname -f):8088/ws/v1/cluster/info | jq

# 크러스터의 운영 지표 정보 
# 앱의 상태 개수, 메모리 코어 할당 개수 등 
curl -s http://$(hostname -f):8088/ws/v1/cluster/metrics | jq

# 스케줄러 정보
# 큐별 운영 상태, 메모리 코어 할당 개수 등 
curl -s http://$(hostname -f):8088/ws/v1/cluster/scheduler | jq

```

# 애플리케이션 정보 
애플리케이션의 운영정보를 확인하기 위한 명령은 다음과 같습니다. 

```bash
# 제출된 애플리케이션의 정보 
curl -s http://$(hostname -f):8088/ws/v1/cluster/apps | jq
curl -s http://$(hostname -f):8088/ws/v1/cluster/apps?state=RUNNING | jq

# 애플리케이션의 정보를 확인
curl -s http://$(hostname -f):8088/ws/v1/cluster/[application_id] | jq
curl -s http://$(hostname -f):8088/ws/v1/cluster/[application_id]/appattempts | jq

# 애플리케이션의 실행 정보
# SUBMITTED, RUNNING, ACCEPTED 상태등의 건수 
curl -s http://$(hostname -f):8088/ws/v1/cluster/appstatistics | jq


```


# 노드 정보 
클러스터를 구성하는 노드의 정보를 확인합니다. 

```bash
# 노드의 정보 
curl -s http://$(hostname -f):8088/ws/v1/cluster/nodes | jq
curl -s http://$(hostname -f):8088/ws/v1/cluster/nodes/[node_id] | jq
```
