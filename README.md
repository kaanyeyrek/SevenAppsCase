# SevenAppsCase

This project is an iOS application developed using **UIKit** and follows the **MVVM architecture**. It demonstrates dynamic UI updates, modular and reusable components, and robust testing for reliability.

---

## 🚀 Features

1. **Navigation**: 
   - A custom `StoryboardNavigableManager` handles navigation between screens seamlessly.

2. **Dynamic Table View**:
   - Displays a list of users dynamically, with cells that adjust their height automatically.

3. **Networking**:
   - Implements `CoreNetworkService` for asynchronous API requests using `URLSession`.
   - Error handling and JSON decoding are built-in for reliable data fetching.

4. **Detail View**:
   - Shows detailed user information upon selection from the list.

5. **Reusable Components**:
   - Protocols like `RegistrableTableCell` and `SpinnerDisplayable` simplify UI updates and enhance code reusability.

6. **Unit Testing**:
   - Comprehensive tests for core functionalities like view models and network requests using mock services.

---

## 🛠 Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/kaanyeyrek/SevenAppsCase.git

🧑‍💻 Project Summary
Scene Management: Sets up the root view controller programmatically with navigation support.
Home Screen:
Displays a list of users fetched from a mock API.
Uses UITableView with reusable custom cells.
Detail Screen:
Shows user details such as name, email, phone, and website.
UI is dynamically updated with the selected user's information.
Networking:
A centralized service (CoreNetworkService) manages API requests and handles responses.
Endpoints are defined in APIRouter for scalability.
Testing:
Mock services simulate API responses.
Tests verify functionalities like data fetching, UI updates, and error handling.
Reusable UI Features:
A spinner displays loading states (SpinnerDisplayable protocol).
Alerts are shown for errors with user-friendly messages.

🧪 Testing
Unit tests cover:
View Models: Ensuring logic for UI updates works correctly.
Networking: Verifying API calls and error handling with mock services.
User Flows: Testing interactions with the app (e.g., data fetching and navigation).


🛠 Built With
Language: Swift
Framework: UIKit
Architecture: MVVM
Tools: Xcode, XCTest
