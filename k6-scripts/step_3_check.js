import { check } from 'k6';
import http from 'k6/http';

export default function () {
    const res = http.get('http://web');
    check(res, {
        'verify text': (r) =>
            r.body.includes('Agrrr, I\'m under loadtest'),
    });
}