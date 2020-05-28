import Foundation

// swiftlint:disable all
func NotTestableCode(_ function: () -> ()) {
  if ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] == nil {
    function()
  }
}
