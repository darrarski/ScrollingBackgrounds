import UIKit
import SnapKit

public class TopBackgroundLayout: BackgroundLayout {

    public init(inset: UIEdgeInsets? = nil) {
        self.inset = inset
    }

    // MARK: BackgroundLayout

    public func setupLayout(for view: UIView, in scrollView: UIScrollView) {
        view.snp.makeConstraints(constraintMaker(forViewIn: scrollView))
    }

    public func updateLayout(for view: UIView, in scrollView: UIScrollView) {
        view.snp.updateConstraints(constraintMaker(forViewIn: scrollView))
    }

    // MARK: Private

    private let inset: UIEdgeInsets?

    private func inset(for scrollView: UIScrollView) -> UIEdgeInsets {
        if let inset = inset {
            return inset
        }
        return scrollView.contentInset
    }

    private func constraintMaker(forViewIn scrollView: UIScrollView) -> (ConstraintMaker) -> Void {
        return { [unowned self] in
            $0.top.equalTo(self.top(forViewIn: scrollView))
            $0.left.equalTo(self.left(forViewIn: scrollView))
            $0.width.equalTo(self.width(forViewIn: scrollView))
        }
    }

    private func top(forViewIn scrollView: UIScrollView) -> CGFloat {
        let inset = self.inset(for: scrollView)
        let offset = scrollView.contentOffset
        let minTop = -scrollView.contentInset.top + inset.top
        return min(minTop, offset.y + inset.top)
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
