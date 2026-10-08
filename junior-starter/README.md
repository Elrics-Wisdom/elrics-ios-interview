# Junior / Intern - User List App (60 min Live)

**Setup (interviewer does before):** Xcode 15+ > New Project > iOS App > SwiftUI > Name: UserListStarter. Drag these 3 Swift files in. Internet ON.

## Candidate Brief (read this to them)

> Build a User List app using https://jsonplaceholder.typicode.com/users
> Show name, email, city in a List. Tap for detail. Add search by name.
> You can use Google/Apple docs. No AI/chat.

API sample:
```json
[{ "id": 1, "name": "Leanne Graham", "email": "Sincere@april.biz",
"address": { "city": "Gwenborough" } }]
```

## Tasks in order
1. Fix `Models.swift` - make `User` Codable (15 min)
2. Fix `UserService.swift` - implement `fetchUsers()` with URLSession + async/await (15 min)
3. Fix `ContentView.swift` - show List + loading + search + navigation to detail (20 min)
4. Bonus: error view + pull-to-refresh (10 min)

UIKit allowed: use UITableView + UISearchBar instead if candidate prefers.
