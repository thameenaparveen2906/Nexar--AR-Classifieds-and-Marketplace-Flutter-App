const app = require('./app'); // Import the main app configuration
const db = require('./config/db'); // Ensure this connects to your database
const UserModel = require('./model/user.model'); // Load User model
const port = 3000;

// Import additional routes
const productRouter = require('./routers/product.router');
const userRouter = require('./routers/user.router');
// Use the product routes in the app
app.use('/api/products', productRouter); 
app.use('/', userRouter );
// Prefix all product routes with /api/products

// Root route
app.get('/', (req, res) => {
  res.send('Hello! Welcome to the API.');
});

// Start the server
app.listen(port, () => {
  console.log(`Server Listening on Port http://localhost:${port}`);
});













