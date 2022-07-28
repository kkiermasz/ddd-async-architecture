# Modular Async Clean Architecture

Learning by reading? Learning by listening? Why not learning by understanding? In this repository you can find an example iOS application implementation in Swift.

## Motiviation

In mobile applications team at [SpotOn](https://pl.spoton.com/), I wanted to make an improvement to the architecture in which we work. 

To use the Clean Architecture approach correctly, together with the modular programming, we should listen for changes, no matter what the source of them, rather than treating the change as a trigger consequence.

The team asked me to provide an example of usage. Thus, I decided to create whole app to answer their needs.

## Goals

* [`async / await`]() together with [`AsyncStream`](https://developer.apple.com/documentation/swift/asyncstream)
* Communication beetwen presentation modules (interoperability)
* Events flow (Data -> Domain -> Presentation)
* Async tests

## Notable mentions

* [CombineCocoa](https://github.com/CombineCommunity/CombineCocoa)

## License

`Modular Clean Architecture` is shared under the MIT license. See the [LICENSE](./LICENSE) for more info.