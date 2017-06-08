import UIKit

public class CenterBackgroundLayout: BackgroundLayout {

    public init(inset: UIEdgeInsets? = nil) {
        self.inset = inset
    }

    // MARK: BackgroundLayout

    public func setupLayout(for view: UIView, in scrollView: UIScrollView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        let constraints = Constraints(view)

        let centerXconstraint = constraints.centerX
        centerXconstraint.constant = centerX(forViewIn: scrollView)
        centerXconstraint.isActive = true

        let centerYconstraint = constraints.centerY
        centerYconstraint.constant = centerY(forViewIn: scrollView)
        centerYconstraint.isActive = true
    }

    public func updateLayout(for view: UIView, in scrollView: UIScrollView) {
        let constraints = Constraints(view)
        constraints.centerX.constant = centerX(forViewIn: scrollView)
        constraints.centerY.constant = centerY(forViewIn: scrollView)
    }

    // MARK: Private

    private let inset: UIEdgeInsets?

    private func inset(for scrollView: UIScrollView) -> UIEdgeInsets {
        if let inset = inset {
            return inset
        }
        return scrollView.contentInset
    }

    private func centerX(forViewIn scrollView: UIScrollView) -> CGFloat {
        let inset = self.inset(for: scrollView)
        return scrollView.contentOffset.x + (inset.left - inset.right) / 2
    }

    private func centerY(forViewIn scrollView: UIScrollView) -> CGFloat {
        let inset = self.inset(for: scrollView)
        return scrollView.contentOffset.y + (inset.top - inset.bottom) / 2
    }

}
