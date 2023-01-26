const WebSocket = require('ws');
const fs = require('fs');

fs.readFile("../../../config/ASK-MESSAGE", 'utf8', function(err, contents) {
const ws = new WebSocket('wss://relay.nostr.band');

ws.on('open', function open() {
    ws.send(JSON.stringify(["REQ","1",{"keywords":[contents], "kinds":[1], "limit": 1}]));
});

ws.on('message', function incoming(data) {
    const jsonData = JSON.parse(data);
    fs.writeFileSync('./id.txt', jsonData[2].id);
    fs.writeFileSync('./pubkey.txt', jsonData[2].pubkey);
});
});


