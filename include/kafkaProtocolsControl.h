#include <librdkafka/rdkafkacpp.h>
#include <memory>
#include <nlohmann/json_fwd.hpp>
#include <string>
#include <nlohmann/json.hpp>
#include <stdexcept>

using KafkaConfPtr = std::unique_ptr<RdKafka::Conf>;
using KafkaProducerPtr = std::unique_ptr<RdKafka::Producer>;
using KafkaMessagePtr = std::unique_ptr<RdKafka::Message>;
using KafkaTopicPtr = std::unique_ptr<RdKafka::Topic>;

class KafkaFactory {
public:
    KafkaProducerPtr CreateProd(const int id);
    KafkaTopicPtr CreateTop();

    
    KafkaConfPtr CreateProducerConfBasedOnId(const int id);


private:
    nlohmann::json config;
};