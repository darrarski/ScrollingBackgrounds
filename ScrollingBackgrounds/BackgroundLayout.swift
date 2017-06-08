import UIKit

/// Background view layout protocol
public protocol BackgroundLayout {

    /// Setup layout for background view
    ///
    /// - Parameters:
    ///   - view: background view
    ///   - scrollView: scroll view to which background view is added
    func setupLayout(for view: UIView, in scrollView: UIScrollView)

    /// Update layout for background view
    ///
    /// - Parameters:
    ///   - view: background view
    ///   - scrollView: scroll view to which background view is added
    func updateLayout(for view: UIView, in scrollView: UIScrollView)

}
