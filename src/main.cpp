#include "librdkafka/rdkafkacpp.h"
#include "../include/kafkaProtocolsControl.h"

int main(){
    
    KafkaFactory kafka;
    kafka.UploadConfig("../config/kafkaProducers.json");
    KafkaProducerPtr prod = kafka.CreateProd();
    kafka.CreateTopics(prod.get());

    std::string err;
    //KafkaProducerPtr prod = RdKafka::Producer::create(nullptr,err);
    /*
    RdKafka::ErrorCode errCode = producer->produce(
                kafka.GetValidTopicName("livingRoom"), 
                topic->PARTITION_UA, //automatic partitioning, but can be set to 1 as it is in the test enviroment
                RdKafka::Producer::MSG_COPY, 
                const_cast<void*>(static_cast<const void*>(bytes.begin())),
                bytes.size(),
                NULL,
                0,
                0,
                NULL, 
                NULL
            );
    */
    //ConnectKafka();
    //ConnectMosquitto();
    return 0;
}
