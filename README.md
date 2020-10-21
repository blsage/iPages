# iPages

Quickly implement swipable page views in iOS. 📝

<img src="instructions/iPagesDemoPrimary.gif" alt="drawing" width="100"/>

1. [Install](https://github.com/benjaminsage/iPages/blob/main/INSTALL.md) `iPages`
2. Add `iPages` to your project
```swift
import SwiftUI
import iPages
import iGraphics

struct ContentView: View {
    @State var currentPage: Int = 0

    var body: some View {
        iPages(currentPage: $currentPage) {
            iGraphicsView(.first)
            iGraphicsView(.second)
        }
    }
}
```

3. Customize your `iPages`


## Examples
### Marketing Materials
Use `iGraphicsView` to demo marketing slides.
```swift
import SwiftUI
import iPages
import iGraphics

struct ContentView: View {
    @State var currentPage: Int = 0

    var body: some View {
        iPages(currentPage: $currentPage) {
            iGraphicsView(.first)
            iGraphicsView(.second)
            iGraphicsView(.third)
        }
    }
}
```


### Shopping App
Hide the bottom dots & add infinite scroll to remove context.
```swift
import SwiftUI
import iPages
import iGraphics

struct ContentView: View {
    @State var currentPage: Int = 0

    var body: some View {
        iPages(currentPage: $currentPage) {
            iGraphicsBox(.photo)
                .stack(3)
            iGraphicsBox(.card)
                .stack(2)
        }
        .hideDots(true)
        .wrapsInfinitely(true)
    }
}
```


## Customize
`iPages` has two required parameters: 1️⃣ a state variable to track the current page, and 2️⃣ a trailing view builder of ordered views. `iPages` supports a variety of custom modifiers. All customizations are built into our modifiers.

**Example**: Change the dot colors, enable infinite wrap & hide dots for single page views with the following code block:
```swift
iPages($currentPage) {
    EmptyView()
}
.dotsTintColors(currentPage: Color, otherPages: Color)
.wrapsInfinitely(true)
.dotsHideForSinglePage(true)

```

Use our exhaustive input list to customize your views.

Modifier | Description
--- | ---
`.hideDots(hideDots: Bool) -> iPages` | Modifies whether or not the page view should include the standard page control dots. (••••)
`.wrapsInfinitely(wraps: Bool) -> iPages` | Modifies whether or not the page view should restart at the beginning 🔁 when swiping past the end (and vise-versa)
`.dotsHideForSinglePage(hide: Bool) -> iPages` | Modifies whether the page dots are hidden when there is only one page. 1️⃣⤵️
`.dotsTintColors(currentPage: Color, otherPages: Color) -> iPages` | Modifies tint colors 🟡🟢🔴🟣 to be used for the page dots.
`.dotsBackgroundStyle(style: UIPageControl.BackgroundStyle) -> iPages` | Modifies the background style ⚪️🔘 of the page dots.
`.dotsAllowContinuousInteraction(allowContinuousInteraction: Bool) -> iPages` | Modifies the continuous interaction settings of the dots. 🔄