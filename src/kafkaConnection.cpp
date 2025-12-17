#include <fstream>
#include <iterator>
#include <librdkafka/rdkafkacpp.h>
#include <nlohmann/json_fwd.hpp>
#include <regex>
#include <stdexcept>
#include <string_view>
#include "../include/kafkaProtocolsControl.h"

void KafkaFactory::UploadProducersConfig(std::string_view path)
{
    m_ProducersConfig = nlohmann::json::parse(std::ifstream(path.data()));
}

void KafkaFactory::UploadTopicsConfig(std::string_view path)
{
    m_TopicsConfig = nlohmann::json::parse(std::ifstream(path.data()));
}

KafkaProducerPtr KafkaFactory::CreateProd(int id)
{
    std::string err;
    //auto *raw = RdKafka::Producer::create(CreateProducerConfBasedOnId(id)->get(), err);
}

void KafkaFactory::GetNumberOfRooms()
{
    if(m_TopicsConfig.contains("topics") && m_TopicsConfig["topics"].is_object())
    {
        nlohmann::json topics = m_TopicsConfig["topics"];
        m_topicCount = topics.size();
    }
    else
        std::runtime_error("No topics inside a config file were found");
    
}

KafkaConfPtr KafkaFactory::CreateConf(RdKafka::Conf::ConfType type, std::string_view key)
{
    
    if(type == RdKafka::Conf::ConfType::CONF_TOPIC)
    {
        auto *raw = RdKafka::Conf::create(type);
        return Configure(raw, key);
    }
    else
    {
        auto *raw = RdKafka::Conf::create(type);
        return Configure(raw, key);
    }
}

std::string KafkaFactory::GetNameOfKey(int &index)
{
    auto iterator = m_TopicsConfig["topics"].begin();
    std::advance(iterator, index); //moves iterator to desired index without needing a loop
    std::string roomName = iterator.key();
    return roomName;
}

KafkaTopicPtr KafkaFactory::CreateTopics()
{
    GetNumberOfRooms();
    std::string err;
    for(int i = 0; i <= m_topicCount; i++)
    {
        std::string nameOfTopic = GetNameOfKey(i); //this is also my key
        //nullptr is a placeholder this is where producer will go
        auto *raw = RdKafka::Topic::create(nullptr, nameOfTopic, CreateConf(RdKafka::Conf::CONF_TOPIC, nameOfTopic).get(), err);
        m_topicsContainer->push_back(std::move(KafkaTopicPtr(raw)));
    }
    //auto *raw = RdKafka::Topic::create(Handle *base, const std::string &topic_str, const Conf *conf, std::string &errstr)
}

KafkaConfPtr KafkaFactory::CreateProducerConfBasedOnId(int id)
{
    std::string err;
    auto *raw = RdKafka::Conf::create(RdKafka::Conf::CONF_GLOBAL);
    if(!raw)
        throw std::runtime_error("Failed to create config");
    return KafkaConfPtr(raw);
}

KafkaConfPtr KafkaFactory::Configure(RdKafka::Conf *conf, std::string_view key)
{
    std::string globalErr; 
    auto set = [&](auto k, auto v){
        if(conf->set(k, v, globalErr) != RdKafka::Conf::CONF_OK)
            throw std::runtime_error(std::string("conf set '") + std::string(k) + "': " + globalErr);
    };

    for(const nlohmann::json &property : m_TopicsConfig[key])
    {
        set(property["propertyName"].get_ref<const std::string&>(), 
            property["value"].get_ref<const std::string&>());
    }

    return KafkaConfPtr(conf);
}