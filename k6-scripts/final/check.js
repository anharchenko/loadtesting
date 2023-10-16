import {check} from "k6";
import {info} from "./logger.js";

export function statusCode(response) {
  check(response, {
    'check status code': function (r) {
      return r && r.status === 200
    },
  })
}

export function checkSWContains(listing, response) {
  info('checkSWContains: contains:' + listing.response.contains + " in response:" + response.html('body').text())
  check(response, {
    'verify text': (r) =>
        r.body.includes(listing.response.contains),
  });
}
