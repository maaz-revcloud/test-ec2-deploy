const express = require('express');
const app = express();

// Simulated asynchronous function representing the complex execution
function performComplexExecution() {
    return new Promise((resolve, reject) => {
        // Simulating complex execution with a timeout
        setTimeout(() => {
            resolve('Complex execution completed.');
        }, 5000); // Simulating 5 seconds of execution time
    });
}

// Route handling the API endpoint
app.get('/start-complex-process', (req, res) => {
    // Send immediate response to the client
    res.send('Complex process started. You will be notified upon completion.');

    // Perform the complex execution asynchronously
    performComplexExecution()
        .then(result => {
            // Send completion notification to the client
            console.log('Complex execution result:', result);
            // Depending on your API design, you can send a response or perhaps emit a WebSocket event
        })
        .catch(error => {
            console.error('Error during complex execution:', error);
            // Handle error appropriately (e.g., send error response)
        });
});

app.get('/health-check', (req, res) => {
    res.send('100% Health')
})

// Start the server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
