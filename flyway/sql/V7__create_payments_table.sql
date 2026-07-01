CREATE TABLE payments (
    id SERIAL PRIMARY KEY,
    user_id INT,
    amount DECIMAL(10,2),
    status VARCHAR(20),
    created_at TIMESTAMP DEFAULT NOW()
);
