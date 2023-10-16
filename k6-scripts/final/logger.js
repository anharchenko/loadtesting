import {config, logLevel} from "./config.js";

export function info(message) {
  if (config.logger.level === logLevel.off || config.logger.level > logLevel.info) {
    return
  }

  console.log(message)
}

export function error(message) {
  if (config.logger.level === logLevel.off || config.logger.level > logLevel.error) {
    return
  }

  console.error(message)
}
