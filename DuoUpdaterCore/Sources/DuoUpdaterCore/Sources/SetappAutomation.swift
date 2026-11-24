import Foundation

/// Locates the Setapp desktop client so `setapp://` deep links (subscription
/// renewal, detection-only fallbacks) are only offered when Setapp is installed.
public enum SetappAutomation {

    /// Setapp's client, from the two documented install roots.
    public static func clientURL(home: URL = FileManager.default.homeDirectoryForCurrentUser) -> URL? {
        let candidates = [
            URL(fileURLWithPath: "/Applications/Setapp.app"),
            home.appendingPathComponent("Applications/Setapp.app"),
        ]
        return candidates.first { FileManager.default.fileExists(atPath: $0.path) }
    }
}
