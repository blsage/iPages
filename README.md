# iPages

### Quickly implement swipable page views in iOS. 📝

<form action="https://www.paypal.com/donate" method="post" target="_top">
<input type="hidden" name="hosted_button_id" value="6D46F7EC7M8RS" />
<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif" border="0" name="submit" title="PayPal - The safer, easier way to pay online!" alt="Donate with PayPal button" />
<img alt="" border="0" src="https://www.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1" />
</form>

<img src="instructions/iPagesDemoPrimary.gif" alt="drawing" width="250"/>

1. [Install](https://github.com/benjaminsage/iPages/blob/main/INSTALL.md) `iPages`

2. Add `iPages` to your project
```swift
import SwiftUI
import iPages

struct ContentView: View {
    @State var currentPage: Int = 0

    var body: some View {
        iPages(currentPage: $currentPage) {
            Text("iPages")
            Color.pink
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