const ProductModel = require('../model/product.model');

// Create a new product
exports.createProduct = async (productData) => {
  try {
    const newProduct = new ProductModel(productData);
    return await newProduct.save();
  } catch (error) {
    throw error;
  }
};

// Get all products
exports.getAllProducts = async () => {
  try {
    return await ProductModel.find();
  } catch (error) {
    throw error;
  }
};

// Get a product by ID
exports.getProductById = async (productId) => {
  try {
    return await ProductModel.findById(productId);
  } catch (error) {
    throw error;
  }
};

// Update a product by ID
exports.updateProduct = async (productId, updates) => {
  try {
    return await ProductModel.findByIdAndUpdate(productId, updates, { new: true });
  } catch (error) {
    throw error;
  }
};

// Delete a product by ID
exports.deleteProduct = async (productId) => {
  try {
    return await ProductModel.findByIdAndDelete(productId);
  } catch (error) {
    throw error;
  }
};

