import UIKit

public extension UIView {

    /// class name of the object instance
    class var className: String {
        let className: String = NSStringFromClass(self).components(separatedBy: ".").last!
        return className
    }

    /// Load nib using class name from bundle in the same location as the class
    class func nib(bundle: Bundle = .main) -> UINib? {
        return UINib(nibName: className, bundle: .init(Bundle(for: self)))
    }

    /// Instantiate a nib with an owner
    /// - Parameters:
    ///   - owner: Owner of the object
    ///   - bundle: bundle where the nib is located
    class func instantiate(owner: NSObject, bundle: Bundle = .main) {
        guard let nib = self.nib() else {
            return
        }
        nib.instantiate(withOwner: owner, options: nil)
    }

    /// Method that is used to run specific logic for unit tests in any UIView
    func isRunningUnitTest() -> Bool {
        return ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil
    }
}
