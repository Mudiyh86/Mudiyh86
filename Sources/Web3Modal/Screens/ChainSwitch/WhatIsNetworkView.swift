import SwiftUI
import Web3ModalUI

struct WhatIsNetworkView: View {

    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    @EnvironmentObject var router: Router

    var body: some View {
        content()
            .onAppear {
                UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(Color.Foreground100)
                UIPageControl.appearance().pageIndicatorTintColor = UIColor(Color.Foreground100).withAlphaComponent(0.2)
            }
    }

    func content() -> some View {
        VStack(spacing: 0) {
            if verticalSizeClass == .compact {
                TabView {
                    ForEach(sections(), id: \.title) { section in
                        section
                            .padding(.bottom, 40)
                    }
                }
                .transform {
                    #if os(iOS)
                    $0.tabViewStyle(.page(indexDisplayMode: .always))
                    #endif
                }
                .scaledToFill()
                .layoutPriority(1)

            } else {
                ForEach(sections(), id: \.title) { section in
                    section
                        .padding(.bottom, Spacing.s)
                }
            }

            Button(action: {
                router.navigateToExternalLink(URL(string: "https://ethereum.org/en/developers/docs/networks/")!)
            }) {
                HStack {
                    Text("Learn More")
                    Image.ExternalLink
                }
            }
            .buttonStyle(W3MButtonStyle(size: .m))
        }
        .padding(.vertical, Spacing.xxl)
        .padding(.horizontal, Spacing.xl)
    }

    func sections() -> [HelpSection] {
        [
            HelpSection(
                title: "The system’s nuts and bolts",
                description: "A network is what brings the blockchain to life, as this technical infrastructure allows apps to access the ledger and smart contract services.",
                assets: [.imageNetwork, .imageLayers, .imageSystem]
            ),
            HelpSection(
                title: "Designed for different uses",
                description: "Each network is designed differently, and may therefore suit certain apps and experiences.",
                assets: [.imageNoun, .imageDefiAlt, .imageDao]
            ),
        ]
    }
}

#if DEBUG
struct WhatIsNetworkView_Previews: PreviewProvider {
    static var previews: some View {
        WhatIsNetworkView()
    }
}
#endif