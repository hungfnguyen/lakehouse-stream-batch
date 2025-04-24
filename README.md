# 🌀 API Data Ingestion with Kafka & Spark Streaming

This project demonstrates a real-time data ingestion pipeline using **Apache Kafka**, **Apache Spark Streaming**, and **Apache Airflow**. The data is extracted from a public **API**, sent to Kafka, then processed by Spark Streaming, and finally stored in **Hadoop HDFS**.

## 🧱 Architecture

![Architecture](https://github.com/hungfnguyen/lakehouse-stream-batch/issues/1#issue-3017540825)

### 🔁 Flow Description:

1. **API → Airflow**
   - Apache Airflow schedules and triggers the task to extract data from an external API.

2. **Airflow → Kafka (Producer)**
   - Data is published to a Kafka topic using a Python Kafka producer script.

3. **Kafka Broker + Zookeeper**
   - Kafka acts as a message broker. Zookeeper manages Kafka metadata and broker coordination.

4. **Kafka → Spark (Streaming Consumer)**
   - Apache Spark reads the data stream in real time from Kafka topics using Spark Structured Streaming.

5. **Spark → HDFS**
   - Spark processes and writes the ingested data into HDFS for further processing or analysis.

## 🛠 Tech Stack

| Component | Technology |
|----------|-------------|
| Workflow Orchestration | Apache Airflow |
| Messaging | Apache Kafka |
| Streaming Consumer | Apache Spark |
| Coordination | Apache Zookeeper |
| Storage | Hadoop HDFS |
| Language | Python (Producer) |

---

## 📁 Directory Structure

```bash
api-ingestion/
├── airflow_dags/
│   └── api_to_kafka_dag.py
├── kafka_producer/
│   └── producer.py
├── spark_streaming/
│   └── spark_kafka_consumer.py
├── docker/
│   ├── docker-compose.yml
│   └── kafka, zookeeper, spark, airflow services
├── data/
│   └── output/ (saved HDFS results)
└── README.md
```

## 📌 Authors

- **Hung Nguyen** – [@hungfnguyen](https://github.com/hungfnguyen)
