#!/usr/bin/env bash
set -euo pipefail

BS="kafka1:9092"
TOPIC="${KAFKA_BOOTSTRAP_TOPIC:-test-topic}"
PARTS="${KAFKA_BOOTSTRAP_PARTS:-3}"
RF="${KAFKA_BOOTSTRAP_RF:-3}"

echo "[init] creating topic: $TOPIC (partitions=$PARTS, rf=$RF)"
/opt/bitnami/kafka/bin/kafka-topics.sh \
  --bootstrap-server "$BS" \
  --create --if-not-exists \
  --topic "$TOPIC" \
  --partitions "$PARTS" \
  --replication-factor "$RF"

echo "[init] listing topics"
/opt/bitnami/kafka/bin/kafka-topics.sh --bootstrap-server "$BS" --list

echo "[init] done."

