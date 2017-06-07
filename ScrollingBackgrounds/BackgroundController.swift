import UIKit

public class BackgroundController: NSObject {

    public init(layout: BackgroundLayout, view: UIView, scrollView: UIScrollView) {
        self.layout = layout
        self.view = view
        self.scrollView = scrollView
        super.init()
        scrollView.insertSubview(view, at: 0)
        layout.setupLayout(for: view, in: scrollView)
        setupObservers()
    }

    deinit {
        removeObservers()
        view.removeFromSuperview()
    }

    private let layout: BackgroundLayout
    private let view: UIView
    private let scrollView: UIScrollView

    // MARK: KVO

    private func setupObservers() {
        scrollView.addObserver(self, forKeyPath: #keyPath(UIScrollView.contentOffset), options: [.new], context: nil)
        scrollView.addObserver(self, forKeyPath: #keyPath(UIScrollView.contentSize), options: [.new], context: nil)
        scrollView.addObserver(self, forKeyPath: #keyPath(UIScrollView.contentInset), options: [.new], context: nil)
    }

    private func removeObservers() {
        scrollView.removeObserver(self, forKeyPath: #keyPath(UIScrollView.contentOffset))
        scrollView.removeObserver(self, forKeyPath: #keyPath(UIScrollView.contentSize))
        scrollView.removeObserver(self, forKeyPath: #keyPath(UIScrollView.contentInset))
    }

    override public func observeValue(forKeyPath keyPath: String?,
                                      of object: Any?,
                                      change: [NSKeyValueChangeKey : Any]?,
                                      context: UnsafeMutableRawPointer?) {
        layout.updateLayout(for: view, in: scrollView)
    }

}
