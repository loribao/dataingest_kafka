FROM mcr.microsoft.com/playwright:v1.23.1-focal

WORKDIR /app
ENV clientid='pub_socket_prd'
ENV broker='kafka'
ENV broker_port='9092'
ENV topic='framereceived'
ENV url_page='https://../cras#'
COPY package.json .
#RUN npx playwright install
RUN yarn
COPY . .
RUN yarn build
CMD yarn start:prd