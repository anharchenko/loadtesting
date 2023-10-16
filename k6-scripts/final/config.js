export const k6options = {
    scenarios: {
        default: {
            executor: "per-vu-iterations",
            iterations: 1,
        },
    },
    thresholds: {
        http_req_duration: ['p(95)<200'],
    },
}

export const logLevel = {
    off: 0,
    info: 1,
    error: 2,
}

const dev = {
    http: {
        host: "http://web",
        methods: {
            suggest: "/suggest.php",
            listing: "/list.php"
        },
    },
    k6: {
        options: k6options
    },
    logger: {
        level: logLevel.error
    },
}

const prod = {
    grpc: {
        http: "production_host",
        methods: {
            suggest: "/suggest.php",
            listing: "/list.php"
        },
    },
    k6: {
        options: k6options
    },
    logger: {
        level: logLevel.error
    },
}

export const config = dev
