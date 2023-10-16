CREATE
DATABASE products_db;

USE
products_db;

CREATE TABLE products
(
    id          INT PRIMARY KEY AUTO_INCREMENT,
    name        VARCHAR(255) NOT NULL,
    description TEXT
);

CREATE TABLE properties
(
    id             INT PRIMARY KEY AUTO_INCREMENT,
    product_id     INT          NOT NULL,
    property_name  VARCHAR(255) NOT NULL,
    property_value VARCHAR(255) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products (id)
);

-- Inserting example products
INSERT INTO products (name, description)
VALUES ('Laptop A', 'Entry-level laptop'),
       ('Laptop B', 'Gaming laptop'),
       ('Laptop C', 'Business laptop'),
       ('Laptop D', 'Ultrabook laptop'),
       ('Laptop E', '2-in-1 laptop'),
       ('Smartphone A', 'Budget smartphone'),
       ('Smartphone B', 'Flagship smartphone'),
       ('Smartphone C', 'Mid-range smartphone'),
       ('Smartphone D', 'Business smartphone'),
       ('Smartphone E', 'Gaming smartphone'),
       ('Laptop F', 'Graphic design laptop'),
       ('Laptop G', 'Developer laptop'),
       ('Laptop H', 'Student laptop'),
       ('Laptop I', 'Touchscreen laptop'),
       ('Laptop J', 'Lightweight laptop'),
       ('Smartphone F', 'Compact smartphone'),
       ('Smartphone G', 'Large screen smartphone'),
       ('Smartphone H', 'Photography smartphone'),
       ('Smartphone I', 'Waterproof smartphone'),
       ('Smartphone J', 'Rugged smartphone');


-- Properties for Laptops
INSERT INTO properties (product_id, property_name, property_value)
VALUES (1, 'RAM', '8GB'),
       (1, 'Storage', '256GB SSD'),
       (1, 'Color', 'Silver'),
       (1, 'Weight', '1.5kg'),

       (2, 'RAM', '16GB'),
       (2, 'Storage', '512GB SSD'),
       (2, 'Color', 'Black'),
       (2, 'Weight', '2.2kg'),

       (3, 'RAM', '16GB'),
       (3, 'Storage', '512GB SSD'),
       (3, 'Color', 'Gray'),
       (3, 'Weight', '1.8kg'),

       (4, 'RAM', '8GB'),
       (4, 'Storage', '256GB SSD'),
       (4, 'Color', 'Gold'),
       (4, 'Weight', '1.3kg'),

       (5, 'RAM', '12GB'),
       (5, 'Storage', '1TB SSD'),
       (5, 'Color', 'Blue'),
       (5, 'Weight', '1.7kg'),

       (11, 'RAM', '32GB'),
       (11, 'Storage', '1TB SSD'),
       (11, 'Color', 'Silver'),
       (11, 'Weight', '2kg'),

       (12, 'RAM', '16GB'),
       (12, 'Storage', '512GB SSD'),
       (12, 'Color', 'Black'),
       (12, 'Weight', '2.3kg'),

       (13, 'RAM', '8GB'),
       (13, 'Storage', '256GB HDD'),
       (13, 'Color', 'Green'),
       (13, 'Weight', '1.6kg'),

       (14, 'RAM', '8GB'),
       (14, 'Storage', '512GB SSD'),
       (14, 'Color', 'Red'),
       (14, 'Weight', '1.4kg'),

       (15, 'RAM', '16GB'),
       (15, 'Storage', '256GB SSD'),
       (15, 'Color', 'White'),
       (15, 'Weight', '1.2kg'),

-- Properties for Smartphones
       (6, 'RAM', '4GB'),
       (6, 'Storage', '64GB'),
       (6, 'Color', 'Black'),
       (6, 'Weight', '150g'),

       (7, 'RAM', '12GB'),
       (7, 'Storage', '256GB'),
       (7, 'Color', 'Blue'),
       (7, 'Weight', '180g'),

       (8, 'RAM', '6GB'),
       (8, 'Storage', '128GB'),
       (8, 'Color', 'Gray'),
       (8, 'Weight', '170g'),

       (9, 'RAM', '6GB'),
       (9, 'Storage', '64GB'),
       (9, 'Color', 'Silver'),
       (9, 'Weight', '160g'),

       (10, 'RAM', '8GB'),
       (10, 'Storage', '128GB'),
       (10, 'Color', 'Red'),
       (10, 'Weight', '165g'),

       (16, 'RAM', '3GB'),
       (16, 'Storage', '32GB'),
       (16, 'Color', 'Green'),
       (16, 'Weight', '140g'),

       (17, 'RAM', '8GB'),
       (17, 'Storage', '128GB'),
       (17, 'Color', 'Gold'),
       (17, 'Weight', '190g'),

       (18, 'RAM', '8GB'),
       (18, 'Storage', '256GB'),
       (18, 'Color', 'Black'),
       (18, 'Weight', '175g'),

       (19, 'RAM', '6GB'),
       (19, 'Storage', '64GB'),
       (19, 'Color', 'Blue'),
       (19, 'Weight', '165g'),

       (20, 'RAM', '4GB'),
       (20, 'Storage', '32GB'),
       (20, 'Color', 'Gray'),
       (20, 'Weight', '200g');

