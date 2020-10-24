<h1 align="center"> iPages📖</p>
<h3 align="center"> Quickly implement swipable page views in iOS. 📝 </h3>
<p align="center">
    <strong><a href="#get-started">Get Started</a></strong> |
    <strong><a href="#examples">Examples</a></strong> |
    <strong><a href="#customize">Customize</a></strong> |
    <strong><a href="#install">Install</a></strong> | 
    <strong><a href="#usage">Usage</a></strong>
</p>
<p align="center">
    <img src="https://github.com/AlexFine/SwiftUICode/blob/master/public/assets/img/gifcity.gif" alt="CI" />
</p>

<br/>

## Get Started

1. [Install](https://github.com/benjaminsage/iPages/blob/main/INSTALL.md) `iPages`

2. Add `iPages` to your project
```swift
import SwiftUI
import iPages

struct ContentView: View {
    var body: some View {
        iPages {
            Text("iPages")
            Color.pink
        }
    }
}
```

3. Customize your `iPages`


## Examples
### Marketing Materials
<img src="https://iswiftui.com/assets/img/iPagesDemo2Light.gif" width="200">

Use `iGraphicsView` to demo marketing slides.

```swift
import SwiftUI
import iPages
import iGraphics

struct ContentView: View {
    var body: some View {
        iPages {
            iGraphicsView(.first)
            iGraphicsView(.second)
            iGraphicsView(.third)
        }
    }
}
```


### Shopping App
<img src="https://iswiftui.com/assets/img/iPagesDemo1Dark.gif" width="200">
Hide the bottom dots & add infinite scroll to remove context.

If you want, you can pass in your own optional selection binding to `iPages`.

```swift
import SwiftUI
import iPages
import iGraphics

struct ContentView: View {
    @State var currentPage: Int = 0

    var body: some View {
        iPages(selection: $currentPage) {
            iGraphicsBox(.photo)
                .stack(3)
            iGraphicsBox(.card)
                .stack(2)
        }
        .hideDots(true)
        .wraps(true)
    }
}
```


## Customize
`iPages` takes a trailing view builder of ordered views. You can also optionally pass in your own page index binding called `selection:`, to let you build your own page control, or however you want to use it. `iPages` supports a variety of custom modifiers. All customizations are built into our modifiers.

**Example**: Change the dot colors, enable infinite wrap & hide dots for single page views with the following code block:
```swift
iPages(selection: $currentPage) {
    Text("👏")
}
.dotsTintColors(currentPage: Color, otherPages: Color)
.wraps(true)
.dotsHideForSinglePage(true)
.navigationOrientation(.vertical)

```

Use our exhaustive input list to customize your views.

Modifier or Initializer | Description
--- | ---
`.init(content: () -> Content) -> iPages` | Initializes the page 📃📖 view. 👷‍♀️
`.init(selection: Binding<Int>?, content: () -> Content) -> iPages` | Initializes the page 📃📖 view with a selection binding. 👷‍♀️
`.hideDots(hideDots: Bool) -> iPages` | Modifies whether or not the page view should include the standard page control dots. (••••)
`.wraps(wraps: Bool) -> iPages` | Modifies whether or not the page view should restart at the beginning 🔁 when swiping past the end (and vise-versa)
`.dotsHideForSinglePage(hide: Bool) -> iPages` | Modifies whether the page dots are hidden when there is only one page. 1️⃣⤵️
`.dotsTintColors(currentPage: Color, otherPages: Color) -> iPages` | Modifies tint colors 🟡🟢🔴🟣 to be used for the page dots.
`.dotsBackgroundStyle(style: UIPageControl.BackgroundStyle) -> iPages` | Modifies the background style ⚪️🔘 of the page dots.
`.dotsAllowContinuousInteraction(allowContinuousInteraction: Bool) -> iPages` | Modifies the continuous interaction settings of the dots. 🔄
`.dotsAlignment(_ alignment: Alignment) -> iPages` | Modifies the **alignment of the page dots**. 👆 👇
`.navigationOrientation(_ orientation: UIPageViewController.NavigationOrientation) -> iPages` | Modifies the navigation **orientation** of the page view. ↔️ ↕️
`.disableBounce(_ disable: Bool) -> iPages` | Disables the **bounce** settings of the page view. This is especially useful for scroll views.
`.interPageSpacing(_ spacing: CGFloat) -> iPages` | Modifies the spacing between the pages. ↔️


## Install 
Use the Swift package manager to install. Find instructions [here](https://github.com/benjaminsage/iPages/blob/main/INSTALL.md)😀


## Usage
<b>iPages is FREE and open-source for individuals, and will remain that way forever. </b>

iPages is distributed under a GNU GPL open-source license. 

Commercial users, please note, this license is often <b><a href="https://en.wikipedia.org/wiki/GNU_General_Public_License#Legal_barrier_to_app_stores">incompatible for many commercial applications</a></b>. If your app is distributed for commercial use, it could violate this open-source license even "if the application is free in the App Store". 

In order to offer iPages safely to our commercial friends we made it easy to purchase a lifetime, full-use license for $4.99. Code on worry free 😁 

<a href="https://general099748.typeform.com/to/p5FtTKBj"> <img align="center" src="https://github.com/AlexFine/SwiftUICode/blob/master/public/assets/img/Purchase%20License.png" width="300"> </a>

