import { Kafka, Partitioners } from 'kafkajs';
import app from './app';
import {conf} from './configs/config';
import logger from './configs/logger';

const run = async () => {
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
    try {
        await producer.connect();
        logger.info("start app");
        await app(producer,conf.topic,conf.url_page);
    } catch (error) {
        await producer.disconnect();
        logger.error(error)
    }
}
run();