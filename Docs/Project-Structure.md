# Project Structure – Online Auction System (.NET Version)

This document describes the folder and file organization for the Online Auction System project developed using .NET.

---

## Root Directory

```
OnlineAuctionSystem/
│
├── OnlineAuctionSystem.sln                # Visual Studio solution file
├── README.md
├── .gitignore
├── .gitattributes
│
├── OnlineAuctionSystem.Web/               # ASP.NET MVC or Razor Pages Frontend
│   ├── wwwroot/                           # Static files (CSS, JS, images)
│   ├── Views/                             # Razor Views (.cshtml)
│   ├── Controllers/
│   └── Pages/                             # Razor Pages (if using)
│
├── OnlineAuctionSystem.API/               # (Optional) Web API project
│   ├── Controllers/
│   ├── DTOs/
│   ├── Routes/
│   └── Middleware/
│
├── OnlineAuctionSystem.Core/              # Domain layer – entities, interfaces
│   ├── Entities/
│   ├── Interfaces/
│   └── Services/
│
├── OnlineAuctionSystem.Infrastructure/    # Data access layer – EF Core context, repositories
│   ├── Data/
│   ├── Migrations/
│   └── Repositories/
│
├── OnlineAuctionSystem.Tests/             # Unit and integration tests
│   ├── CoreTests/
│   └── APITests/
│
├── Database/
│   └── Schema/
│       ├── ERD-Design.md
│       ├── DFD-Design.md
│       └── Database-Structure.md
│
├── Docs/
│   ├── Requirements-Analysis.md
│   ├── ProjectPlan.md
│   ├── ProjectStructure.md
│   ├── Flowcharts.md
│   └── StatusReports/
│       ├── Status-Report-1.md
│       └── Status-Report-2.md
│
└── Assets/
    ├── erd.png
    ├── dfd.png
    └── ui-screenshots/
```

---

## Folder Descriptions

### `OnlineAuctionSystem.Web/`
The frontend project using ASP.NET MVC or Razor Pages. Includes controllers, views, and static files.

### `OnlineAuctionSystem.API/`
Optional project for RESTful APIs, used if separating frontend/backend logic. Contains controllers, routes, and DTOs.

### `OnlineAuctionSystem.Core/`
Contains the core domain models (entities), business logic interfaces, and service definitions.

### `OnlineAuctionSystem.Infrastructure/`
Contains the implementation of data access using Entity Framework Core. Includes DbContext, migrations, and repository pattern.

### `OnlineAuctionSystem.Tests/`
Unit tests and integration tests for different modules of the system.

### `Database/Schema/`
ERD, DFD, and table design documentation.

### `Docs/`
Functional and non-functional project documents.

### `Assets/`
Design diagrams, images, and screenshots used in documentation.

---

## Naming Conventions

- Projects: `PascalCase` (e.g., `OnlineAuctionSystem.Web`)
- Classes/Interfaces: `PascalCase` (e.g., `ItemService.cs`, `IItemRepository.cs`)
- Variables/Methods: `camelCase`
- Folders: `PascalCase` or `kebab-case` (e.g., `Migrations`, `DataAccess`)

---

## Notes for .NET Deployment

- Ensure `appsettings.json` is configured properly
- Use `dotnet ef migrations add` and `dotnet ef database update` for database schema
- Can deploy on IIS, Azure App Service, or Docker depending on the hosting strategy

