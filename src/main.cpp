#include "librdkafka/rdkafkacpp.h"
#include "../include/kafkaProtocolsControl.h"

int main(){
    
    KafkaFactory kafka{};
    kafka.UploadProducersConfig("../config/kafkaProducers.json");
    kafka.UploadTopicsConfig("../config/kafkaTopics.json");
    
    //ConnectKafka();
    //ConnectMosquitto();
    return 0;
}
