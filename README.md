# RoomFit — iOS AR Furniture Shopping App UI

A SwiftUI recreation of the RoomFit Home Screen designed for iOS 17+.

## 🛠 Features & Design System
- **Pure SwiftUI (iOS 17+)** with zero external dependencies.
- **Componentized Architecture**: Split into `HeaderView`, `SearchBar`, `CategoryChips`, `HeroCard`, `ARButton`, `ProductCard`, and `CustomTabBar`.
- **Earthy Scandinavian Palette**: Cream (`#F7F0E8`), Cards (`#FCF9F5`), Sage Green (`#9CAF94`), Terracotta Orange (`#E8894F`), Dark Green Typography (`#2F3E34`), and Gray (`#8A857D`).
- **Interactive SwiftUI `#Preview`** on every single component and model.
- **XcodeGen Ready**: Generates a `.xcodeproj` instantly on macOS or in GitHub Actions CI using `xcodegen generate`.

## 🚀 Building with XcodeGen (macOS or GitHub Actions)

### On a Mac:
```bash
# 1. Install XcodeGen if you haven't already
brew install xcodegen

# 2. Generate the Xcode project
xcodegen generate

# 3. Open in Xcode
open RoomFit.xcodeproj
```

### In GitHub Actions:
A preconfigured workflow is included at `.github/workflows/build.yml`. Simply push this repository to GitHub and the workflow will build the project using Xcode 15+ on `macos-14`.

## 🖼 Asset Catalog Images
Replace the placeholder images in `RoomFit/Resources/Assets.xcassets/`:
1. `hero_chair.imageset` -> Sage armchair hero shot (~800x600 or 1200x900)
2. `product_alba.imageset` -> Alba chair product shot (~400x350)
3. `product_forma.imageset` -> Forma table product shot (~400x350)
4. `product_arc.imageset` -> Arc lamp product shot (~400x350)
