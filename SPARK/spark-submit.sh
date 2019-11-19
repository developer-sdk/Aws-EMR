#/bin/bash

# spark-submit을 이용한 JDBC 잡연결 예제 
spark-submit --master yarn \
             --deploy-mode client \
             --driver-class-path mysql-connector-java-5.1.41.jar,/usr/lib/hadoop-lzo/lib/*,/usr/share/aws/emr/emrfs/conf,/usr/share/aws/emr/emrfs/lib/*,/usr/share/aws/emr/emrfs/auxlib/*,/usr/share/aws/emr/lib/*,/usr/share/aws/emr/ddb/lib/emr-ddb-hadoop.jar,/usr/share/aws/emr/goodies/lib/emr-hadoop-goodies.jar,/usr/share/aws/emr/kinesis/lib/emr-kinesis-hadoop.jar,/usr/share/aws/emr/cloudwatch-sink/lib/*,/usr/share/aws/aws-java-sdk/* \
             --jars mysql-connector-java-5.1.41.jar,/usr/lib/hadoop-lzo/lib/*,/usr/share/aws/emr/emrfs/conf,/usr/share/aws/emr/emrfs/lib/*,/usr/share/aws/emr/emrfs/auxlib/*,/usr/share/aws/emr/lib/*,/usr/share/aws/emr/ddb/lib/emr-ddb-hadoop.jar,/usr/share/aws/emr/goodies/lib/emr-hadoop-goodies.jar,/usr/share/aws/emr/kinesis/lib/emr-kinesis-hadoop.jar,/usr/share/aws/emr/cloudwatch-sink/lib/*,/usr/share/aws/aws-java-sdk/* \
             --conf spark.driver.extraClassPath=mysql-connector-java-5.1.41.jar \
             --queue default \
             --driver-memory 1g \
             --name SampleJobTest \
             --class com.sample.spark.SampleJob \
             --verbose \
             sampel-job.jar \
             param1 \
             parma2 \
             param3
