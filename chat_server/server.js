const WebSocket = require('ws');

const wss = new WebSocket.Server({ port: 60331 });

wss.on('connection', (ws) => {
    ws.on('message', (message) => {
        // Broadcast the received message to all connected clients
        wss.clients.forEach((client) => {
            if (client.readyState === WebSocket.OPEN) {
                client.send(message);
            }
        });
    });

    ws.on('close', () => {
        console.log('Client disconnected');
    });
});

console.log('WebSocket server started on port 60331');
