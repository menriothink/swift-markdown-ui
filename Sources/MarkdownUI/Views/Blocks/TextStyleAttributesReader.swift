import SwiftUI

struct TextStyleAttributesReader<Content: View>: View {
  @Environment(\.textStyle) private var textStyle

  @State private var contentView: Content?

  private let content: (AttributeContainer) -> Content

  init(@ViewBuilder content: @escaping (_ attributes: AttributeContainer) -> Content) {
    self.content = content
  }

  var body: some View {
      //VStack {
      //    if let contentView {
      //        contentView
      //    }
      //}
      //.task(priority: .high) {
      //    contentView = self.content(self.attributes)
      //}
      //.animation(nil)
      //if #available(macOS 15.0, *) {
          self.content(self.attributes)
      //        .transition(.lineByLine(duration: 1))
      //} else {
      //    self.content(self.attributes)
      //}
  }

  private var attributes: AttributeContainer {
    var attributes = AttributeContainer()
    self.textStyle._collectAttributes(in: &attributes)
    return attributes
  }
}
