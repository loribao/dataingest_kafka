import { Kafka, Partitioners } from 'kafkajs';
import { conf } from './config'
const kafka = new Kafka({
    
    retry: {
        factor: 100,
        initialRetryTime: 300,
        retries: 20
    },
    enforceRequestTimeout: false,
    clientId: conf.clientid,
    brokers: [`${conf.broker}:${conf.broker_port}`],
});
const producer = kafka.producer({
    allowAutoTopicCreation: true,
    transactionTimeout: 30000,
    createPartitioner: Partitioners.LegacyPartitioner
});

export {
    kafka,
    producer
}