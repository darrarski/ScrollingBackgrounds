import UIKit
import SnapKit

public class BottomBackgroundLayout: BackgroundLayout {

    public init(inset: UIEdgeInsets? = nil) {
        self.inset = inset
    }

    // MARK: BackgroundLayout

    public func setupLayout(for view: UIView, in scrollView: UIScrollView) {
        view.snp.makeConstraints(constraintMaker(for: view, in: scrollView))
    }

    public func updateLayout(for view: UIView, in scrollView: UIScrollView) {
        view.snp.updateConstraints(constraintMaker(for: view, in: scrollView))
    }

    // MARK: Private

    private let inset: UIEdgeInsets?

    private func inset(for scrollView: UIScrollView) -> UIEdgeInsets {
        if let inset = inset {
            return inset
        }
        return scrollView.contentInset
    }

    private func constraintMaker(for view: UIView, in scrollView: UIScrollView) -> (ConstraintMaker) -> Void {
        return { [unowned self] in
            $0.top.equalTo(self.top(for: view, in: scrollView))
            $0.left.equalTo(self.left(forViewIn: scrollView))
            $0.width.equalTo(self.width(forViewIn: scrollView))
        }
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
