
import app from './app';
import { conf } from './configs/config';
import { producer } from './configs/kafka';
import logger from './configs/logger';

const run = async () => {

    try {
        await producer.connect();
        logger.info("start app");
        await app(producer, conf.topic, conf.url_page);
    } catch (error) {
        await producer.disconnect();
        logger.error(error)
    }
}
run();