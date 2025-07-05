
# Data Flow Diagram (DFD)

## Context Diagram (DFD Level 0)

```mermaid
graph TD
    User["User (Buyer/Seller)"] <--> System["Online Auction System"]
    Admin["Administrator"] <--> System
```

## Level 1 DFD

Each item below represents a main process in DFD Level 1. More detailed sub-processes and their specific interactions with Data Stores will be described in DFD Level 2.

### 1. User Management (Process 1.0)

This process handles all user-related actions including registration, login, authentication, and profile updates. It interacts with the user data store to manage account information.

```mermaid
graph TD
    A[User] -->|Register/Login| P1["1.0 User Management"]
    P1 -->|Login Confirmation| A
    P1 <--> DS1["User Data Store"]
```

### 2. Item Management (Process 2.0)

This process allows sellers to add, edit, or delete products for auction. It also enables users to browse and view detailed product information. It interacts with the item data store and file data store to handle product data and media uploads.

```mermaid
graph TD
    B[Seller] -->|Create/Edit Item| P2["2.0 Item Management"]
    C[User] -->|Browse/View Items| P2
    P2 -->|Item List| C
    P2 -->|Confirmation| B
    P2 <--> DS2["Item Data Store"]
    P2 <--> DS3["File Data Store (Images/Docs)"]
```

### 3. Bidding Process (Process 3.0)

This process manages all bidding operations. Users can place bids, and the system checks the validity, updates the current bid status, and stores data in the bidding store.

```mermaid
graph TD
    D[Buyer] -->|Place Bid| P3["3.0 Bidding Process"]
    P3 -->|Bid Confirmation/Error| D
    P3 <--> DS4["Bidding Data Store"]
```

### 4. Category Management (Process 4.0)

This process is used by the administrator to manage product categories. Users can browse products through categories. The category data store maintains all category information.

```mermaid
graph TD
    Admin -->|Create/Merge Categories| P4["4.0 Category Management"]
    P4 -->|Confirmation| Admin
    P4 <--> DS5["Category Data Store"]
    User -->|View by Category| P4
    P4 -->|Filtered Item List| User
```

### 5. Notification Management (Process 5.0)
This process automatically sends notifications to users (buyer and seller) when an auction ends. It interacts with the notification data store to read and write messages.

```mermaid
graph TD
    P6["5.0 Notification Management"] <--> DS6["Notification Data Store"]
    P3 -->|Auction Ended| P6
    P6 -->|Send Notification| Buyer
    P6 -->|Send Notification| Seller
```

### 6. Rating System (Process 6.0)
This optional process allows buyers and sellers to rate each other after a transaction. The rating is recorded in the rating data store and can be used to evaluate trustworthiness.

```mermaid
graph TD
    Seller -->|Rate Buyer| P7["6.0 Rating System"]
    Buyer -->|Rate Seller| P7
    P7 -->|Confirm Rating| Seller
    P7 -->|Confirm Rating| Buyer
    P7 <--> DS7["Rating Data Store"]
```

### 7. Admin User Control (Process 7.0)

This process allows the admin to manage user accounts, including blocking or unblocking fraudulent users. It uses the user data store for reading and updating account statuses.

```mermaid
graph TD
    Admin -->|Block/Unblock Users| P8["7.0 Admin User Management"]
    P8 -->|Confirmation| Admin
    P8 <--> DS1["User Data Store"]
```
