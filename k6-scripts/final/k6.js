import {group} from 'k6';
import http from 'k6/http';
import {suggests} from "./dataset/suggests/suggests.js";
import * as check from "./check.js";
import {listings} from "./dataset/listing/listings.js";
import {config} from "./config.js";

export function checkListing() {
    group('suggests', function () {
        const suggest = suggests[Math.floor(Math.random() * suggests.length)]
        const response = http.get(config.http.host+config.http.methods.suggest+'?sw='+suggest.request.search)

        check.statusCode(response)
    })

    group('listing', function () {
        const listing = listings[Math.floor(Math.random() * listings.length)]
        const response = http.get(config.http.host+config.http.methods.listing+'?sw='+listing.request.sw+'&property='+listing.request.property+'&value='+listing.request.value)

        check.statusCode(response)
        check.checkSWContains(listing, response)
    })
}
