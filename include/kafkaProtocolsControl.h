#include <librdkafka/rdkafkacpp.h>
#include <memory>
#include <nlohmann/json_fwd.hpp>
#include <string>
#include <nlohmann/json.hpp>
#include <stdexcept>
#include <sys/types.h>
#include <utility>
#include <vector>
#include <iterator>
#include <map>

using KafkaConfPtr = std::unique_ptr<RdKafka::Conf>;
using KafkaProducerPtr = std::unique_ptr<RdKafka::Producer>;
using KafkaMessagePtr = std::unique_ptr<RdKafka::Message>;
using KafkaTopicPtr = std::unique_ptr<RdKafka::Topic>;

class KafkaFactory {
public:
    KafkaFactory() = default;
    void UploadConfig(std::string_view path); //maybe let there be a config path so when path changes no need to recompile

    KafkaProducerPtr CreateProd();
    void CreateTopics(RdKafka::Producer *prod); //difference here being that this creates all topics within the config file at once
    KafkaTopicPtr CreateTopic(std::string nameOfTopic);  //this one creates just one topic that is requested 
    KafkaConfPtr CreateConf(RdKafka::Conf::ConfType type, std::string_view key);

    KafkaConfPtr Configure(RdKafka::Conf *conf, std::string_view key);

    int GetTopicCount() {return m_topicCount;}
    const std::vector<KafkaTopicPtr> &GetTopicsContainer() const noexcept { return m_topicsContainer;}
    std::string GetNameOfKey(int &i);
    void GetNumberOfRooms();
    

private:
    u_int8_t m_topicCount;
    nlohmann::json m_config;
    std::vector<KafkaTopicPtr> m_topicsContainer;
};