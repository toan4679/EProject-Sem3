# Database Design – Online Auction System (Based on Field Specification)

## ERD Overview

```
[Users] 1---* [Items] 1---* [Bids]
   |               |
   |               *---* [Documents]
   |
   *---* [Ratings]

[Users] 1---* [Bids]

[Items] *---1 [Categories]

[Items] 1---* [Notifications]
```

---

## Tables

### 1. Users

```sql
CREATE TABLE Users (
    UserId INT PRIMARY KEY IDENTITY(1,1),
    Username NVARCHAR(100) NOT NULL UNIQUE,
    Password NVARCHAR(255) NOT NULL,
    Email NVARCHAR(150),
    Role NVARCHAR(20) DEFAULT 'user',
    Status NVARCHAR(10) DEFAULT 'active',
    CreatedAt DATETIME DEFAULT GETDATE()
);
```
---

### 2. Categories

```sql
CREATE TABLE Categories (
    CategoryId INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(100) NOT NULL UNIQUE
);
```
---

### 3. Items

```sql
CREATE TABLE Items (
    ItemId INT PRIMARY KEY IDENTITY(1,1), -- 1 to 1000
    ItemTitle NVARCHAR(100) NOT NULL UNIQUE, -- 1 to 100 characters
    ItemDescription NVARCHAR(4000),
    BidStatus CHAR(1) CHECK (BidStatus IN ('A','I')), -- Active / Inactive
    BidStartDate DATE,
    BidEndDate DATE,
    BidIncrement DECIMAL(10,2),
    MinimumBid DECIMAL(10,2),
    CategoryId INT NOT NULL,
    SellerId INT NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (CategoryId) REFERENCES Categories(CategoryId),
    FOREIGN KEY (SellerId) REFERENCES Users(UserId)
);
```
---

### 4. Bids

```sql
CREATE TABLE Bids (
    BidId INT PRIMARY KEY IDENTITY(1,1),
    ItemId INT NOT NULL,
    BidderId INT NOT NULL,
    BidAmount DECIMAL(10,2) NOT NULL,
    BidTime DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (ItemId) REFERENCES Items(ItemId),
    FOREIGN KEY (BidderId) REFERENCES Users(UserId)
);
```
---

### 5. Documents

```sql
CREATE TABLE Documents (
    DocumentId INT PRIMARY KEY IDENTITY(1,1),
    ItemId INT NOT NULL,
    FilePath NVARCHAR(255),
    UploadedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (ItemId) REFERENCES Items(ItemId)
);
```
---

### 6. Notifications

```sql
CREATE TABLE Notifications (
    NotificationId INT PRIMARY KEY IDENTITY(1,1),
    UserId INT NOT NULL,
    Message NVARCHAR(MAX),
    Seen BIT DEFAULT 0,
    CreatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (UserId) REFERENCES Users(UserId)
);
```
---

### 7. Ratings

```sql
CREATE TABLE Ratings (
    RatingId INT PRIMARY KEY IDENTITY(1,1),
    ItemId INT,
    RatedBy INT,
    RatedTo INT,
    Score INT CHECK (Score BETWEEN -5 AND 5),
    Comment NVARCHAR(MAX),
    FOREIGN KEY (ItemId) REFERENCES Items(ItemId),
    FOREIGN KEY (RatedBy) REFERENCES Users(UserId),
    FOREIGN KEY (RatedTo) REFERENCES Users(UserId)
);
```

