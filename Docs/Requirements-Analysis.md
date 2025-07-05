# 📋 System Requirements Analysis – Online Auction System

## 1. Overview

### System Objectives
- Build a comprehensive platform for users to list, browse, and bid on auction items.
- Streamline the buying and selling process through real-time auctions.
- Enable secure transactions and user feedback.
- Support administrative controls over listings, users, and system data.

### Target Users
1. **Administrator:** Manages platform configuration, user roles, product categories, and fraud control.
2. **Seller:** Lists items for auction, manages bids, updates listings, and views buyer activity.
3. **Buyer:** Registers, browses items, places bids, views history, and provides feedback.

---

## 2. Functional Requirements

### User Management
- User registration, login, logout
- Role-based access control (admin, seller, buyer)
- Profile editing and password reset
- User blocking/unblocking by admin

### Item Management
- Create/edit/delete item listings (title, description, images, documents, etc.)
- Set auction parameters (start/end time, minimum bid, bid increment)
- Categorize items (admin can manage categories)
- Upload product images and files

### Bidding System
- Display active auctions and real-time bids
- Allow buyers to place new bids
- Automatically track current highest bid
- Restrict sellers from bidding on their own items
- View bid history of each item

### Category Management
- Admin can create, update, or merge product categories
- Users can filter/browse items by category

### Notification System
- Notify buyers and sellers when auction ends
- Real-time feedback messages for bids placed or errors
- System alerts for user actions

### Rating and Feedback
- Buyer and seller can rate each other post-auction (-5 to +5)
- Display average rating in profiles
- Allow optional textual feedback

### Admin Controls
- Monitor and manage all users and listings
- Block suspicious or fraudulent users
- Generate activity reports

---

## 3. Non-Functional Requirements

### Performance
- System should handle concurrent access for multiple users
- Response time < 2 seconds for standard user operations

### Security
- Use HTTPS and secure authentication
- Encrypt sensitive data like passwords
- Prevent unauthorized access and injection attacks

### Availability
- The platform should operate 24/7 with minimal downtime
- Include backup and recovery strategies

### Scalability
- Support growth in number of users and items listed
- Modular design to support new features in the future

### User Interface
- Responsive design (mobile/tablet compatible)
- Clean, intuitive, and accessible layout

---

## 4. Business Workflows

### User Registration Process
1. User accesses registration form
2. Inputs username, email, password, and contact details
3. System validates and creates a user profile
4. Confirmation email is sent

### Item Listing Process
1. Seller accesses item creation page
2. Enters details: title, description, images, bid rules
3. Assigns item to category
4. System validates and stores item in DB
5. Listing appears in marketplace

### Bidding Process
1. Buyer views an item page
2. Places a bid greater than current highest
3. System checks validity and records the bid
4. Current price updates and bid is shown in history

### Auction End Process
1. System checks end time of each item
2. Automatically notifies the highest bidder and seller
3. Updates item status to closed
4. Stores winning bid and transaction info

### Rating Process
1. After auction ends, buyer and seller can rate each other
2. Optional comment can be added
3. Ratings are saved and updated in user profile

---

## 5. Data Requirements

### User Data
- UserId, Username, Email, Password (encrypted)
- Role (admin/seller/buyer), Status
- Timestamps (created, last login, etc.)

### Item Data
- ItemId, Title, Description, Start/End Date
- Minimum Bid, Bid Increment
- Images, Documents, Category
- SellerId (foreign key to User)

### Bid Data
- BidId, ItemId, BidderId
- BidAmount, BidTimestamp

### Category Data
- CategoryId, CategoryName

### Rating Data
- RatingId, ItemId, RatedBy, RatedTo
- Score (-5 to +5), Comment

### Notification Data
- NotificationId, UserId, Message, Seen, CreatedAt

---

## 6. UI Screens

### General Screens
- Login / Registration Page
- Dashboard (role-based)
- User Profile & Settings
- Notifications panel

### Seller Screens
- Item listing and edit page
- View bids on own items
- Manage product categories
- Auction history

### Buyer Screens
- Browse/search item listings
- Item detail with bid form
- View bid history and status
- Rating and feedback forms

### Admin Screens
- User management panel
- Category management
- Auction monitoring tools
- Reports & analytics dashboard


