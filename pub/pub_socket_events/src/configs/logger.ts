import { createLogger, format, transports } from 'winston';
const { combine, timestamp, label, prettyPrint, printf, colorize, splat } = format;
const myFormat = printf(info => {   
return(
`_______________________________________________________________\n
${info.timestamp} ${info.label} ${info.level}: ${info.message}\n
________________________________________________________________`);
});

export default createLogger({
    format: combine(
        colorize(),
        label({ label: '[server]' }),
        timestamp(),
        splat(),
        myFormat
    ),
    transports: [new transports.Console()]
});
