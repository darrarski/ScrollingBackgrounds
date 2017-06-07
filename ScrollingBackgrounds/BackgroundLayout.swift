import UIKit

public protocol BackgroundLayout {
    func setupLayout(for view: UIView, in scrollView: UIScrollView)
    func updateLayout(for view: UIView, in scrollView: UIScrollView)
}
