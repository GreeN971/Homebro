#include <librdkafka/rdkafkacpp.h>
#include <stdexcept>
#include "../include/kafkaProtocolsControl.h"

KafkaProducerPtr KafkaFactory::CreateProd(int id){
    std::string err;
    auto *raw = RdKafka::Producer::create(CreateProducerConfBasedOnId(id), err);
}

KafkaTopicPtr KafkaFactory::CreateTop(){
    std::string err;
    auto *raw = RdKafka::Topic::create(Handle *base, const std::string &topic_str, const Conf *conf, std::string &errstr)
}

KafkaConfPtr KafkaFactory::CreateProducerConfBasedOnId(int id){
    std::string err;
    auto *raw = RdKafka::Conf::create(RdKafka::Conf::CONF_GLOBAL);
    if(!raw)
        throw std::runtime_error("Failed to create config");
    return KafkaConfPtr(raw);
}

