const express = require('express');
const app = express();

app.get('/health-check', (req, res) => {
    console.log("API CALLED")
    res.send('100% Health!!!')
})

// Start the server
const PORT = 3000;
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
