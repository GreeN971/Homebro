#include <fstream>
#include <iterator>
#include <librdkafka/rdkafkacpp.h>
#include <memory>
#include <nlohmann/json_fwd.hpp>
#include <regex>
#include <stdexcept>
#include <string_view>
#include <type_traits>
#include <utility>
#include "../include/kafkaProtocolsControl.h"

void KafkaFactory::UploadConfig(std::string_view path)
{
    m_config = nlohmann::json::parse(std::ifstream(path.data()));
}

KafkaProducerPtr KafkaFactory::CreateProd()
{
    std::string err;
    if(!m_config.contains("producers"))
        throw std::runtime_error("Not producer inside config file");

    auto* raw = RdKafka::Producer::create(CreateConf(RdKafka::Conf::CONF_GLOBAL, "producers").get(), err);
    if(!raw)
        throw std::runtime_error("Can not create producer" + err);
    
    return KafkaProducerPtr(raw);
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

void KafkaFactory::GetNumberOfRooms()
{
    if(m_config.contains("topics") && m_config["topics"].is_object())
    {
        nlohmann::json topics = m_config["topics"];
        m_topicCount = topics.size();
    }
    else
        std::runtime_error("No topics inside a config file were found");
}

std::string KafkaFactory::GetNameOfKey(int &index)
{
    auto iterator = m_config["topics"].begin();
    std::advance(iterator, index); //moves iterator to desired index without needing a loop
    std::string roomName = iterator.key();
    return roomName;
}

void KafkaFactory::CreateTopics(RdKafka::Producer *prod)
{
    GetNumberOfRooms();
    std::string err;
    for(int i = 0; i <= m_topicCount; i++)
    {
        std::string nameOfTopic = GetNameOfKey(i); //this is also my key
        auto *raw = RdKafka::Topic::create(prod, nameOfTopic, CreateConf(RdKafka::Conf::CONF_TOPIC, nameOfTopic).get(), err);
        if(!raw)
            throw std::runtime_error("Can not create topic " + err);
        m_topicsContainer.push_back(std::move(KafkaTopicPtr(raw)));
    }
}

KafkaConfPtr KafkaFactory::Configure(RdKafka::Conf *conf, std::string_view key)
{
    std::string globalErr; 
    auto set = [&](auto k, auto v){
        if(conf->set(k, v, globalErr) != RdKafka::Conf::CONF_OK)
            throw std::runtime_error(std::string("conf set '") + std::string(k) + "': " + globalErr);
    };

    for(const nlohmann::json &property : m_config[key])
    {
        set(property["propertyName"].get_ref<const std::string&>(), 
            property["value"].get_ref<const std::string&>());
    }

    return KafkaConfPtr(conf);
}