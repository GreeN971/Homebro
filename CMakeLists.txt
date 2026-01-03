cmake_minimum_required(VERSION 3.20)
project(kafkaclient VERSION 0.1.0 LANGUAGES C CXX)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON CACHE INTERNAL "")

find_package(RdKafka REQUIRED)
find_package(nlohmann_json REQUIRED)
find_package(mosquitto)

# Main executable
add_executable(kafkaclient
    src/main.cpp
    src/kafkaConnection.cpp
)

target_include_directories(kafkaclient
    PRIVATE include
)

target_link_libraries(kafkaclient
    PRIVATE
        RdKafka::rdkafka++
        nlohmann_json::nlohmann_json
        mosquitto::mosquitto
)