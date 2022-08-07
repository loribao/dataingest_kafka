import { Producer } from 'kafkajs';
import { chromium } from 'playwright'
import logger from './configs/logger';

const app = async (producer: Producer, topic: string, url_page: string) => {
    const browser = await chromium.launch({ headless: true });
    let page = await browser.newPage();
    page.on('websocket', ws => {
        ws.on('framereceived', async event => {
            const payload = {
                key: (new URL(ws.url().toString())).hostname.toString(),
                headers: {
                    'url': ws.url()?.toString(),
                    'ts': Date.now().toString()
                },
                acks: 0,
                value: event.payload,
            };
            await producer.send({
                topic: topic,
                messages: [payload],
            });
            logger.info(JSON.stringify(payload))
        });
        ws.on('close', () => logger.info('WebSocket closed'));
    });
    await page.goto(url_page);
}
export default app;