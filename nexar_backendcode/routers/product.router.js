const express = require('express');
const multer = require('multer');
const productController = require('../controller/product.controller');

const router = express.Router();

// Configure Multer for file uploads
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, 'uploads/'); // Directory to save uploaded files
  },
  filename: (req, file, cb) => {
    cb(null, `${Date.now()}-${file.originalname}`); // Create a unique file name
  },
});

const upload = multer({ storage });

// Product Routes

// Create a new product
router.post('/create', upload.single('image'), productController.createProduct);

// Get all products
router.get('/get', productController.getAllProducts);

// Get a product by ID
router.get('/:id', productController.getProductById);

// Update a product by ID
router.put('/:id', upload.single('image'), productController.updateProduct);

// Delete a product by ID
router.delete('/:id', productController.deleteProduct);

module.exports = router;






