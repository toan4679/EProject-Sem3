# Project Plan – Online Auction System (3 Weeks)
*Start Date: 08/06/2025*

## Project Overview
- **Project Name:** Online Auction System
- **Technology Stack:** .NET Core MVC, C#, SQL Server
- **Duration:** 3 weeks (08/06 – 06/07/2025)

---

## Role Assignments

### Project Manager / Team Leader
- Manage project schedule and scope
- Coordinate meetings and communication
- Ensure quality of deliverables
- Track and report progress

### Backend Developer
- Design and implement database schema
- Build business logic and API endpoints
- Handle user authentication, bidding, and item management

### Frontend Developer
- Design user interface (UI/UX)
- Develop pages for user interaction
- Integrate with backend APIs

---

## 📆 Weekly Timeline

### Week 1: Requirement Analysis & System Design (08/06 – 14/06)

#### Day 1–2: Requirement Analysis
- [ ] Study project specification
- [ ] Define system scope and objectives
- [ ] Identify user roles and use cases
- [ ] Draft functional requirements

#### Day 3–4: Database & ERD Design
- [ ] Design ERD diagram
- [ ] Define tables and relationships
- [ ] Write SQL schema
- [ ] Prepare sample test data

#### Day 5–7: System Architecture & Prototyping
- [ ] Define system architecture layers
- [ ] Create wireframes and UI mockups
- [ ] Plan core modules and workflows
- [ ] Build clickable frontend prototype

**Week 1 Deliverables:**
- Requirements document
- ERD and DB schema (SQL)
- UI mockups (wireframe)
- Basic frontend prototype
- System architecture plan

---

### Week 2: Core Development (15/06 – 21/06)

#### Day 1–2: Project Setup & DB Initialization
- [ ] Create .NET Core MVC project
- [ ] Configure solution structure and dependencies
- [ ] Setup Entity Framework Core
- [ ] Run migrations and seed test data

#### Day 3–5: Feature Development – Phase 1
- [ ] User registration & login
- [ ] Create item listing module (for sellers)
- [ ] View items and details (for buyers)
- [ ] Add product categories (Admin)

#### Day 6–7: Feature Development – Phase 2
- [ ] Bidding module (place bid, view history)
- [ ] Notification system for auction end
- [ ] Edit/delete item listing (seller)
- [ ] Dashboard layout integration

**Week 2 Deliverables:**
- Working backend with core modules
- Functioning UI with demo data
- API routes and test cases
- Bid logic and notifications implemented

---

### Week 3: Finalization & Testing (22/06 – 06/07)

#### Day 1–3: UI Completion & Integration
- [ ] Polish UI and fix layout issues
- [ ] Integrate backend API with views
- [ ] Add validations and feedback messages
- [ ] Support image/file uploads

#### Day 4–5: Testing & Debugging
- [ ] Perform unit and integration testing
- [ ] Validate user roles & authorization
- [ ] Test edge cases and input errors
- [ ] Fix bugs and optimize code

#### Day 6–7: Documentation & Deployment
- [ ] Write user guide and developer manual
- [ ] Record demo video walkthrough
- [ ] Final codebase cleanup
- [ ] Deploy system to local/remote server

**Week 3 Deliverables:**
- Fully working application
- Test report and bug log
- User guide and dev documentation
- Final source code and demo video

---

## Key Features

1. **User Management**
   - User registration and login
   - Role-based access (admin, seller, buyer)
   - Profile management

2. **Item Management**
   - Create/edit/delete item listings
   - Upload images and documents
   - Set bidding rules (start/end date, min price)

3. **Auction & Bidding**
   - Place bid
   - View current and previous bids
   - Auto notification when auction ends

4. **Category Management**
   - Create/edit/delete categories (admin only)
   - View items by category

5. **Notification System**
   - Alerts for bid success, auction win/loss
   - System messages on dashboard

6. **Ratings and Reviews**
   - Rate buyer/seller after auction
   - Comment and feedback system

7. **Admin Dashboard**
   - User and item monitoring
   - Block/report suspicious accounts

---

## Project Folder Structure

```
OnlineAuctionSystem/
├── OnlineAuctionSystem.Web/           # ASP.NET MVC Frontend
├── OnlineAuctionSystem.Core/          # Domain logic & interfaces
├── OnlineAuctionSystem.Infrastructure/# EF Core & DB access
├── OnlineAuctionSystem.Tests/         # Unit tests
├── Database/Schema/                   # SQL & ERD
└── Docs/                              # Reports & documentation
```

---

## Technologies Used

- **Framework:** .NET Core MVC 6.0
- **Language:** C#
- **Database:** SQL Server + EF Core
- **Frontend:** Razor Views, Bootstrap, JavaScript
- **Authentication:** ASP.NET Core Identity
- **Testing:** xUnit, FluentAssertions
- **Version Control:** Git (GitHub)

---

## Workflow Guidelines

1. **Daily Sync:** 15-minute stand-up meeting
2. **Feature Branching:** One branch per feature
3. **Code Review:** All features must be peer-reviewed
4. **Testing Required:** Before merging into main branch
5. **Weekly Demos:** Show progress every Sunday


