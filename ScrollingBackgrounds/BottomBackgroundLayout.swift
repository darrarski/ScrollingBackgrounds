import UIKit

/// Bottom/footer background layout
public class BottomBackgroundLayout: BackgroundLayout {

    /// Instantiate layout
    ///
    /// - Parameter inset: optional custom inset, when nil - value from scroll view will be used
    public init(inset: UIEdgeInsets? = nil) {
        self.inset = inset
    }

    // MARK: BackgroundLayout

    public func setupLayout(for view: UIView, in scrollView: UIScrollView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        let constraints = Constraints(view)

        let topConstraint = constraints.topToSuperview
        topConstraint.constant = top(for: view, in: scrollView)
        topConstraint.isActive = true

        let leftConstraint = constraints.leftToSuperview
        leftConstraint.constant = left(forViewIn: scrollView)
        leftConstraint.isActive = true

        let widthConstraint = constraints.width
        widthConstraint.constant = width(forViewIn: scrollView)
        widthConstraint.isActive = true
    }

    public func updateLayout(for view: UIView, in scrollView: UIScrollView) {
        let constraints = Constraints(view)
        constraints.topToSuperview.constant = top(for: view, in: scrollView)
        constraints.leftToSuperview.constant = left(forViewIn: scrollView)
        constraints.width.constant = width(forViewIn: scrollView)
    }

    // MARK: Private

    private let inset: UIEdgeInsets?

    private func inset(for scrollView: UIScrollView) -> UIEdgeInsets {
        if let inset = inset {
            return inset
        }
        return scrollView.contentInset
    }

    private func top(for view: UIView, in scrollView: UIScrollView) -> CGFloat {
        let inset = self.inset(for: scrollView)
        let offset = scrollView.contentOffset
        let scrollViewSize = scrollView.frame.size
        let scrollContentHeight = scrollView.contentSize.height
        let viewHeight = view.frame.size.height
        let minTop = scrollContentHeight - viewHeight
        let topOffset = offset.y + scrollViewSize.height - inset.bottom - scrollContentHeight
        let minTopOffset = scrollView.contentInset.bottom - inset.bottom
        return minTop + max(minTopOffset, topOffset)
    }

    private func left(forViewIn scrollView: UIScrollView) -> CGFloat {
        let inset = self.inset(for: scrollView)
        let offset = scrollView.contentOffset
        return offset.x + inset.left
    }

    private func width(forViewIn scrollView: UIScrollView) -> CGFloat {
        let inset = self.inset(for: scrollView)
        return scrollView.frame.width - inset.left - inset.right
    }

}
