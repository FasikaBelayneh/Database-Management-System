
# Library Management System Database


## 📖 Description
A complete relational database system for managing library operations, built with MySQL. This system tracks books, authors, publishers, physical copies, members, and borrowing records.

## 🚀 Features
- **3NF Normalized Structure**: Minimizes data redundancy
- **Relationships**: Handles 1:M and M:N relationships
- **Data Integrity**: Foreign keys, constraints, and cascading rules
- **Indexes**: Optimized search performance
- **Loan Management**: Track borrow/return dates with validation

## 🛠️ Tables Overview
| Table | Description |
|-------|-------------|
| `publishers` | Book publisher details |
| `books` | Core book information (ISBN, title, year) |
| `authors` | Author biographies |
| `book_author` | M:N relationship between books and authors |
| `book_copies` | Physical inventory management |
| `members` | Library patron records |
| `loans` | Borrowing transaction history |

## ⚙️ Setup Instructions

### Prerequisites
- MySQL Server (v8.0+)
- MySQL Workbench (recommended)

### Installation
1. **Clone the repository**:
   ```bash
   git clone https://github.com/FasikaBelayneh/Database-Management-System.git
   cd Database-Management-System