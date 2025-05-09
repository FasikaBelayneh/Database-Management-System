-- library_management.sql
-- Created by: [Your Name]
-- Date: [Current Date]
-- Description: Complete library management system database schema

-- Create database
DROP DATABASE IF EXISTS library_db;
CREATE DATABASE library_db;
USE library_db;

-- Table 1: Publishers
CREATE TABLE publishers (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(200),
    phone VARCHAR(20) UNIQUE NOT NULL
) ENGINE=InnoDB;

-- Table 2: Books
CREATE TABLE books (
    isbn CHAR(13) PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    publication_year YEAR NOT NULL,
    publisher_id INT NOT NULL,
    FOREIGN KEY (publisher_id) 
        REFERENCES publishers(publisher_id)
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- Table 3: Authors
CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birth_date DATE
) ENGINE=InnoDB;

-- Junction Table: Book Authors (M:N Relationship)
CREATE TABLE book_author (
    isbn CHAR(13),
    author_id INT,
    PRIMARY KEY (isbn, author_id),
    FOREIGN KEY (isbn) 
        REFERENCES books(isbn)
        ON DELETE CASCADE,
    FOREIGN KEY (author_id) 
        REFERENCES authors(author_id)
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- Table 4: Book Copies
CREATE TABLE book_copies (
    copy_id INT AUTO_INCREMENT PRIMARY KEY,
    isbn CHAR(13) NOT NULL,
    condition ENUM('New', 'Good', 'Worn', 'Damaged') 
        DEFAULT 'Good',
    FOREIGN KEY (isbn) 
        REFERENCES books(isbn)
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- Table 5: Members
CREATE TABLE members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address VARCHAR(200),
    join_date DATE NOT NULL,
    status ENUM('Active', 'Inactive') 
        DEFAULT 'Active'
) ENGINE=InnoDB;

-- Table 6: Loans
CREATE TABLE loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    copy_id INT NOT NULL,
    member_id INT NOT NULL,
    loan_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (copy_id) 
        REFERENCES book_copies(copy_id)
        ON DELETE CASCADE,
    FOREIGN KEY (member_id) 
        REFERENCES members(member_id)
        ON DELETE CASCADE,
    CHECK (due_date > loan_date),
    CHECK (return_date IS NULL OR return_date >= loan_date)
) ENGINE=InnoDB;

-- Indexes for faster querying
CREATE INDEX idx_books_title ON books(title);
CREATE INDEX idx_members_name ON members(last_name, first_name);
CREATE INDEX idx_loans_dates ON loans(due_date, return_date);