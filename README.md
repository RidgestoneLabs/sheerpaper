# Sheerpaper

Sheerpaper is an open-source Markdown editor for macOS with a live preview. It's built for Apple Silicon and Intel Macs running macOS 12 or later.

Sheerpaper is based on [MacDown](https://github.com/MacDownApp/macdown) by [Tzu-ping Chung](https://github.com/uranusjr) and contributors. MacDown hasn't had a commit since April 2021, so Sheerpaper carries it forward under a new name.

## Install

There's no release yet. Until the first one lands on the [Releases page](https://github.com/RidgestoneLabs/sheerpaper/releases), build it from source.

## Building

You need:

* Xcode 27
* CocoaPods 1.17 or later (`brew install cocoapods`)
* Node.js and npm, for the GitHub preview style

Clone the repository with its submodule and install the dependencies:

    git clone --recursive https://github.com/RidgestoneLabs/sheerpaper.git
    cd sheerpaper
    make -C Dependency/peg-markdown-highlight
    pod install
    (cd Tools/GitHub-style-generator && npm install)

Then open `Sheerpaper.xcworkspace` in Xcode and run the `Sheerpaper` scheme. To test and build from the command line instead:

    xcodebuild -workspace Sheerpaper.xcworkspace -scheme Sheerpaper -configuration Debug -derivedDataPath build/DD CODE_SIGNING_ALLOWED=NO test
    xcodebuild -workspace Sheerpaper.xcworkspace -scheme Sheerpaper -configuration Release -derivedDataPath build/DD CODE_SIGNING_ALLOWED=NO build

The app ends up at `build/DD/Build/Products/Release/Sheerpaper.app`.

## Issues and contributing

Report bugs and ideas on the [issue tracker](https://github.com/RidgestoneLabs/sheerpaper/issues). Please search first, since it may already be reported or fixed on `main`.

Sheerpaper renders Markdown with [Hoedown](https://github.com/hoedown/hoedown), highlights code blocks with [Prism](https://prismjs.com) and highlights the editor with [PEG Markdown Highlight](https://github.com/ali-rantakari/peg-markdown-highlight). A problem in one of those features may belong with that project too.

See [CONTRIBUTING.md](CONTRIBUTING.md) for the coding style and pull request guidelines.

## License

Sheerpaper is released under the MIT License, as MacDown was. The license and the notices for every third-party component are in the [`LICENSE`](LICENSE) directory.

The following editor themes and preview styles come from Mou, courtesy of Chen Luo:

* Mou Fresh Air
* Mou Fresh Air+
* Mou Night
* Mou Night+
* Mou Paper
* Mou Paper+
* Tomorrow
* Tomorrow Blue
* Tomorrow+
* Writer
* Writer+
* Clearness
* Clearness Dark
* GitHub
* GitHub2
