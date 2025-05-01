const ProductModel = require('../model/product.model'); // Adjust the path as needed

// Create a new product
exports.createProduct = async (req, res) => {
  try {
    const { name, description, price, category } = req.body;

    // Check if an image is uploaded
    if (!req.file) {
      return res.status(400).json({ message: 'Image is required.' });
    }

    // Create a new product
    const newProduct = new ProductModel({
      name,
      description,
      price,
      category,
      image: req.file.path, // Assuming the image path is saved by a middleware (e.g., Multer)
    });

    const savedProduct = await newProduct.save();
    res.status(201).json({ message: 'Product created successfully', product: savedProduct });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Error creating product', error });
  }
};

// Get all products
exports.getAllProducts = async (req, res) => {
  try {
    const products = await ProductModel.find();
    res.status(200).json(products);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Error fetching products', error });
  }
};

// Get a single product by ID
exports.getProductById = async (req, res) => {
  try {
    const product = await ProductModel.findById(req.params.id);
    if (!product) {
      return res.status(404).json({ message: 'Product not found' });
    }
    res.status(200).json(product);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Error fetching product', error });
  }
};

// Update a product by ID
exports.updateProduct = async (req, res) => {
  try {
    const { name, description, price, category } = req.body;
    const updates = { name, description, price, category };

    // Update the image if a new one is uploaded
    if (req.file) {
      updates.image = req.file.path;
    }

    const updatedProduct = await ProductModel.findByIdAndUpdate(
      req.params.id,
      updates,
      { new: true } // Returns the updated document
    );

    if (!updatedProduct) {
      return res.status(404).json({ message: 'Product not found' });
    }

    res.status(200).json({ message: 'Product updated successfully', product: updatedProduct });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Error updating product', error });
  }
};

// Delete a product by ID
exports.deleteProduct = async (req, res) => {
  try {
    const deletedProduct = await ProductModel.findByIdAndDelete(req.params.id);

    if (!deletedProduct) {
      return res.status(404).json({ message: 'Product not found' });
    }

    res.status(200).json({ message: 'Product deleted successfully' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Error deleting product', error });
  }
};

  