import Foundation

enum Platform {
    static var isAppleSilicon: Bool {
        var system = utsname()
        uname(&system)
        let machine = withUnsafePointer(to: &system.machine) {
            String(cString: UnsafeRawPointer($0).assumingMemoryBound(to: CChar.self))
        }
        return machine == "arm64"
    }

    static var swiftVersion: String {
        "6.3"
    }

    static var macOSVersion: OperatingSystemVersion {
        ProcessInfo.processInfo.operatingSystemVersion
    }

    static var supportsMLX: Bool {
        isAppleSilicon && macOSVersion.majorVersion >= 14
    }
}
