CREATE TABLE Addresses (
  address_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  street_address VARCHAR(150),
  city VARCHAR(100),
  state_province VARCHAR(50),
  postal_code VARCHAR(20),
  country VARCHAR(100)
);

CREATE TABLE Roles (
  role_id INT PRIMARY KEY AUTO_INCREMENT,
  role_name VARCHAR(100)
);

CREATE TABLE ProductImages (
  image_id INT PRIMARY KEY AUTO_INCREMENT,
  product_id INT,
  image_url VARCHAR(255),
  alt_text VARCHAR(255)
);

CREATE TABLE WishlistItems (
  wishlist_item_id INT PRIMARY KEY AUTO_INCREMENT,
  wishlist_id INT,
  product_id INT
);

CREATE TABLE Feedback (
  feedback_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  feedback_text TEXT,
  feedback_date TIMESTAMP
);

CREATE TABLE Orders (
  order_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  order_date TIMESTAMP,
  total_amount DECIMAL(10, 2),
  status VARCHAR(50),
  shipping_address_id INT,
  billing_address_id INT
);

CREATE TABLE CartItems (
  cart_item_id INT PRIMARY KEY AUTO_INCREMENT,
  cart_id INT,
  product_id INT,
  quantity INT
);

CREATE TABLE UserRoles (
  user_id INT,
  role_id INT,
  status VARCHAR(50)
);

CREATE TABLE Users (
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(50),
  password_hash VARCHAR(255),
  email VARCHAR(100),
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  dob DATE,
  registration_date TIMESTAMP,
  last_login_date TIMESTAMP
);

CREATE TABLE Discounts (
  discount_id INT PRIMARY KEY AUTO_INCREMENT,
  product_id INT,
  discount_percentage DECIMAL(5, 2),
  start_date DATE,
  end_date DATE
);

CREATE TABLE PaymentMethods (
  payment_method_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  card_number VARCHAR(16),
  cardholder_name VARCHAR(100),
  expiration_date DATE,
  security_code VARCHAR(4)
);

CREATE TABLE ProductSuppliers (
  product_supplier_id INT PRIMARY KEY AUTO_INCREMENT,
  product_id INT,
  supplier_id INT,
  supply_price DECIMAL(10, 2)
);

CREATE TABLE Reviews (
  review_id INT PRIMARY KEY AUTO_INCREMENT,
  product_id INT,
  user_id INT,
  rating INT,
  review_text TEXT,
  review_date TIMESTAMP
);

CREATE TABLE Taxes (
  tax_id INT PRIMARY KEY AUTO_INCREMENT,
  tax_name VARCHAR(100),
  tax_percentage DECIMAL(5, 2),
  applicable_from DATE,
  applicable_until DATE
);

CREATE TABLE ShippingMethods (
  shipping_method_id INT PRIMARY KEY AUTO_INCREMENT,
  method_name VARCHAR(100),
  method_description TEXT,
  cost DECIMAL(10, 2)
);

CREATE TABLE Coupons (
  coupon_id INT PRIMARY KEY AUTO_INCREMENT,
  coupon_code VARCHAR(20),
  discount_percentage DECIMAL(5, 2),
  expiration_date DATE,
  min_purchase_amount DECIMAL(10, 2)
);

CREATE TABLE UserCoupons (
  user_coupon_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  coupon_id INT,
  applied_date TIMESTAMP
);

CREATE TABLE Returns (
  return_id INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT,
  product_id INT,
  return_reason TEXT,
  return_date TIMESTAMP,
  status VARCHAR(50)
);

CREATE TABLE Wishlist (
  wishlist_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  wishlist_date TIMESTAMP
);

CREATE TABLE Cart (
  cart_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  creation_date TIMESTAMP
);

CREATE TABLE ShippingDetails (
  shipping_id INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT,
  shipping_method_id INT,
  tracking_number VARCHAR(50),
  shipping_date TIMESTAMP,
  delivery_date TIMESTAMP
);

CREATE TABLE Notifications (
  notification_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  notification_text TEXT,
  notification_date TIMESTAMP,
  is_read BOOLEAN
);

CREATE TABLE OrderTaxes (
  order_tax_id INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT,
  tax_amount DECIMAL(10, 2),
  tax_id INT
);

CREATE TABLE Categories (
  category_id INT PRIMARY KEY AUTO_INCREMENT,
  category_name VARCHAR(100),
  category_description TEXT
);

CREATE TABLE Products (
  product_id INT PRIMARY KEY AUTO_INCREMENT,
  product_name VARCHAR(150),
  product_description TEXT,
  price DECIMAL(10, 2),
  stock_quantity INT,
  category_id INT
);

CREATE TABLE InventoryManagement (
  inventory_id INT PRIMARY KEY AUTO_INCREMENT,
  product_id INT,
  stock_in INT,
  stock_out INT,
  last_update TIMESTAMP
);

CREATE TABLE Suppliers (
  supplier_id INT PRIMARY KEY AUTO_INCREMENT,
  supplier_name VARCHAR(100),
  contact_person VARCHAR(100),
  phone_number VARCHAR(20),
  email VARCHAR(100),
  address_id INT
);

CREATE TABLE PromoBanners (
  banner_id INT PRIMARY KEY AUTO_INCREMENT,
  banner_text VARCHAR(255),
  link VARCHAR(255),
  display_from DATE,
  display_until DATE
);

CREATE TABLE OrderItems (
  order_item_id INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT,
  product_id INT,
  quantity INT,
  unit_price DECIMAL(10, 2)
);

ALTER TABLE WishlistItems ADD FOREIGN KEY (wishlist_id) REFERENCES Wishlist (wishlist_id);

ALTER TABLE Suppliers ADD FOREIGN KEY (address_id) REFERENCES Addresses (address_id);

ALTER TABLE Orders ADD FOREIGN KEY (billing_address_id) REFERENCES Addresses (address_id);

ALTER TABLE ShippingDetails ADD FOREIGN KEY (order_id) REFERENCES Orders (order_id);

ALTER TABLE Orders ADD FOREIGN KEY (user_id) REFERENCES Users (user_id);

ALTER TABLE ProductSuppliers ADD FOREIGN KEY (product_id) REFERENCES Products (product_id);

ALTER TABLE Reviews ADD FOREIGN KEY (product_id) REFERENCES Products (product_id);

ALTER TABLE Wishlist ADD FOREIGN KEY (user_id) REFERENCES Users (user_id);

ALTER TABLE ShippingDetails ADD FOREIGN KEY (shipping_method_id) REFERENCES ShippingMethods (shipping_method_id);

ALTER TABLE Returns ADD FOREIGN KEY (order_id) REFERENCES Orders (order_id);

ALTER TABLE UserRoles ADD FOREIGN KEY (user_id) REFERENCES Users (user_id);

ALTER TABLE OrderItems ADD FOREIGN KEY (order_id) REFERENCES Orders (order_id);

ALTER TABLE Cart ADD FOREIGN KEY (user_id) REFERENCES Users (user_id);

ALTER TABLE ProductSuppliers ADD FOREIGN KEY (supplier_id) REFERENCES Suppliers (supplier_id);

ALTER TABLE WishlistItems ADD FOREIGN KEY (product_id) REFERENCES Products (product_id);

ALTER TABLE CartItems ADD FOREIGN KEY (cart_id) REFERENCES Cart (cart_id);

ALTER TABLE Products ADD FOREIGN KEY (category_id) REFERENCES Categories (category_id);

ALTER TABLE Discounts ADD FOREIGN KEY (product_id) REFERENCES Products (product_id);

ALTER TABLE Returns ADD FOREIGN KEY (product_id) REFERENCES Products (product_id);

ALTER TABLE CartItems ADD FOREIGN KEY (product_id) REFERENCES Products (product_id);

ALTER TABLE Reviews ADD FOREIGN KEY (user_id) REFERENCES Users (user_id);

ALTER TABLE OrderItems ADD FOREIGN KEY (product_id) REFERENCES Products (product_id);

ALTER TABLE Orders ADD FOREIGN KEY (shipping_address_id) REFERENCES Addresses (address_id);

ALTER TABLE UserRoles ADD FOREIGN KEY (role_id) REFERENCES Roles (role_id);

ALTER TABLE Notifications ADD FOREIGN KEY (user_id) REFERENCES Users (user_id);

ALTER TABLE InventoryManagement ADD FOREIGN KEY (product_id) REFERENCES Products (product_id);

ALTER TABLE ProductImages ADD FOREIGN KEY (product_id) REFERENCES Products (product_id);

ALTER TABLE Feedback ADD FOREIGN KEY (user_id) REFERENCES Users (user_id);

ALTER TABLE Addresses ADD FOREIGN KEY (user_id) REFERENCES Users (user_id);

ALTER TABLE PaymentMethods ADD FOREIGN KEY (user_id) REFERENCES Users (user_id);

ALTER TABLE OrderTaxes ADD FOREIGN KEY (tax_id) REFERENCES Taxes (tax_id);

ALTER TABLE UserCoupons ADD FOREIGN KEY (coupon_id) REFERENCES Coupons (coupon_id);

ALTER TABLE UserCoupons ADD FOREIGN KEY (user_id) REFERENCES Users (user_id);

ALTER TABLE OrderTaxes ADD FOREIGN KEY (order_id) REFERENCES Orders (order_id);