AUTH
e LoginScreen in your app (probably main.dart or router.dart):

You must now pass in AuthService() explicitly, like this:

return LoginScreen(authService: AuthService());
MAIN.DART
Wherever LoginScreen is used
Required because constructor changed
Must now pass AuthService() manually
WE ARE USING LOGIN.DART suggestion ->Set up Provider so you don't have to manually pass the service every time
**********************
FOR FCM (Push notifications)
⚠ If you're targeting iOS, remember to also set apns configs in Firebase Console + Info.plist.
*****************
✅create guest_visits collection
✅database creations
Log FCM notifications to Firestore for future reference (analytics or unread tracking)
use the timestamps and email in guest visits
use notification screen
using maxDaysLoggedIn as a kind of session expiry, make sure you enforce it server-side as well, not just in the UI — or users could bypass it.
use call deleteAccount() anywhere in UI (admin)
IN CHAT.DART
help you build emoji picker integration or attachments next! Also, I can help with group chat support
**
Ensure Firestore has:

users collection with documents {email, name, role}

chats/{chatId}/messages collection with message docs as shown.

Enable Firebase Auth for current user email.

Implement emoji picker and attachment upload if needed (placeholders provided).
*************
RUN TESTS
flutter test
Dependency injection with Provider instead of constructor????
No Firebase setup, no network, no Firestore — just fast local testing. 💥



ADVANCES -> OFFLINE SUPPORT
Local Storage Helper
Use something like shared_preferences or flutter_secure_storage to:
Cache role, status, name, etc.
Load them instantly on app launch, then sync with Firestore later
********
to add offline support (e.g. caching user data locally so the app can still show dashboards or keep the user signed in without constant Firestore reads), then introducing an AuthProvider is a solid move.

| File                              | Purpose                                                |
| --------------------------------- | ------------------------------------------------------ |
| ✅ `auth_provider.dart`            | Central auth + user data logic (online + offline)      |
| ✅ `main.dart`                     | Set up the provider                                    |
| ✅ `auth_gate.dart`                | Replace Firebase-only logic with provider-driven logic |
| ✅ `logout()`                      | Use provider to clean up local state                   |
| ⬆️ Optionally: `user_router.dart` | Could be merged into provider logic if tightly coupled |

DATABASE
match /notifications/{docId} {
  allow create: if request.auth != null;
}
make teachers have display names
If app grows and need more advanced routing (e.g. nested routes, dynamic guards), then you can migrate to GoRouter cleanly — but for now, AuthGate is perfect.
add Admin to tech talk hub
tour bottom sheets ->help in velara