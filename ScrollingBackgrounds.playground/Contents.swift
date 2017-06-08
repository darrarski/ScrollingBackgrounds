import UIKit
import PlaygroundSupport
import ScrollingBackgrounds

public class ScrollView: UIScrollView {

    public init(size: CGSize) {
        super.init(frame: CGRect(origin: .zero, size: size))
        backgroundColor = .white
        addSubview(label)
        setupLayout()
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let label: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        let sentences = [
            "Lorem ipsum dolor sit amet enim.",
            "Etiam ullamcorper.",
            "Suspendisse a pellentesque dui, non felis.",
            "Maecenas malesuada elit lectus felis, malesuada ultricies.",
            "Curabitur et ligula.",
            "Ut molestie a, ultricies porta urna.",
            "Vestibulum commodo volutpat a, convallis ac, laoreet enim.",
            "Phasellus fermentum in, dolor.",
            "Pellentesque facilisis.",
            "Nulla imperdiet sit amet magna.",
            "Vestibulum dapibus, mauris nec malesuada fames ac turpis velit, rhoncus eu, luctus et interdum adipiscing wisi.",
            "Aliquam erat ac ipsum.",
            "Integer aliquam purus.",
            "Integer ultrices posuere cubilia Curae, Nulla ipsum dolor lacus, suscipit adipiscing.",
            "Cum sociis natoque penatibus et ultrices volutpat."
        ]
        label.text = (0...50).map { _ in sentences[Int(arc4random_uniform(UInt32(sentences.count)))] }.joined(separator: " ")
        return label
    }()

    private func setupLayout() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: topAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        label.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
    }
    
}

let scrollView = ScrollView(size: CGSize(width: 400, height: 400))
PlaygroundPage.current.liveView = scrollView

let topBackgroundView = UIView()
topBackgroundView.backgroundColor = UIColor.blue.withAlphaComponent(0.2)
topBackgroundView.translatesAutoresizingMaskIntoConstraints = false
topBackgroundView.heightAnchor.constraint(equalToConstant: 100).isActive = true

let centerBackgroundView = UIView()
centerBackgroundView.backgroundColor = UIColor.green.withAlphaComponent(0.2)
centerBackgroundView.translatesAutoresizingMaskIntoConstraints = false
centerBackgroundView.widthAnchor.constraint(equalToConstant: 100).isActive = true
centerBackgroundView.heightAnchor.constraint(equalToConstant: 100).isActive = true

let bottomBackgroundView = UIView()
bottomBackgroundView.backgroundColor = UIColor.red.withAlphaComponent(0.2)
bottomBackgroundView.translatesAutoresizingMaskIntoConstraints = false
bottomBackgroundView.heightAnchor.constraint(equalToConstant: 100).isActive = true

let topBackgroundController = BackgroundController(
    layout: TopBackgroundLayout(),
    view: topBackgroundView,
    scrollView: scrollView
)

let centerBackgroundController = BackgroundController(
    layout: CenterBackgroundLayout(),
    view: centerBackgroundView,
    scrollView: scrollView
)

let bottomBackgroundController = BackgroundController(
    layout: BottomBackgroundLayout(),
    view: bottomBackgroundView,
    scrollView: scrollView
)
