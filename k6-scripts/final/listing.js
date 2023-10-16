import * as k6 from "./k6.js"
import {config} from "./config.js";

export const options = config.k6.options
export default () => k6.checkListing()
