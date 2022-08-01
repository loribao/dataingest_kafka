
import * as dotenv from 'dotenv';
dotenv.config({    
    path:'./.dev.env',
    debug: true,
    override:false
});
dotenv.config({    
    path:'./.secret.env',
    debug: true,
    override:false
});
export const conf = {
    clientid: process.env.clientid,
    broker: process.env.broker,
    broker_port: process.env.broker_port,
    topic: process.env.topic,
    url_page: process.env.url_page,
};