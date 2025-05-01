const express = require('express');
const bodyParser = require('body-parser');
const userRouter = require('./routers/user.router');
const productRouter = require('./routers/product.router');
const cors = require('cors');


const app = express();
app.use(cors());
// Middleware
app.use(bodyParser.json()); // Parse JSON bodies
app.use(express.json());    // Parse JSON in requests

// Static file serving for uploads (if images are used)
app.use('/uploads', express.static('uploads'));

// Routes
app.use('/', userRouter);     // Routes for user actions
app.use('/api/products', productRouter); // Routes for product actions

// Default Route
app.get('/', (req, res) => {
  res.send('Welcome to the API!');
});

module.exports = app;
