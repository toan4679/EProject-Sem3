# Entity Relationship Diagram (ERD)

```mermaid
erDiagram

    USER ||--o{ ITEM : owns
    USER ||--o{ BID : places
    USER ||--o{ NOTIFICATION : receives
    USER ||--o{ RATING : gives

    CATEGORY ||--o{ ITEM : contains

    ITEM ||--o{ BID : has
    ITEM ||--o{ DOCUMENT : has
    ITEM ||--o{ RATING : receives

    USER {
        int user_id PK
        string username
        string password
        string email
        enum role
    }

    ITEM {
        int item_id PK
        string title
        string description
        decimal min_bid
        decimal bid_increment
        date start_date
        date end_date
        enum status
        int category_id FK
        int seller_id FK
    }

    BID {
        int bid_id PK
        decimal bid_amount
        datetime bid_time
        int item_id FK
        int bidder_id FK
    }

    CATEGORY {
        int category_id PK
        string category_name
    }

    NOTIFICATION {
        int notification_id PK
        int user_id FK
        string message
        boolean seen
        datetime created_at
    }

    RATING {
        int rating_id PK
        int item_id FK
        int rated_by FK
        int rated_to FK
        int score
        string comment
    }

    DOCUMENT {
        int doc_id PK
        string file_path
        int item_id FK
        datetime uploaded_at
    }
```

---

## Explain the relationship

| Relationship                        | Description                                                         |
|-------------------------------------|---------------------------------------------------------------------|
| `USER` – `ITEM` (1:N)               | Each user can list multiple items for sale                          |
| `USER` – `BID` (1:N)                | A user can place multiple bids                                      |
| `USER` – `RATING` (1:N)             | A user can give and receive multiple ratings                        |
| `ITEM` – `BID` (1:N)                | Each item can have multiple bids                                    |   
| `ITEM` – `DOCUMENT` (1:N)           | Each item can have multiple associated documents                    |
| `CATEGORY` – `ITEM` (1:N)           | Each category contains multiple items                               |
| `ITEM` – `RATING` (1:N)             | Each item can receive multiple ratings from buyers                  |

---
