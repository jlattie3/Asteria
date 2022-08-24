# Asteria

Asteria is a Swift wrapper around various [NASA](https://api.nasa.gov) and Space related APIs.

## API Services

Currently, Asteria supports the [APOD](https://github.com/nasa/apod-api) API using `async/await`.

## Example Usage


```swift
import Asteria

do {
    let apod = try await Asteria().apodService.getAPOD()
    label.text = "\(apod)"
    print(apod)
} catch {
    print(String(describing: error))
}
```


### License

<details>
<summary>MIT License</summary>
<br>

```
Copyright (c) 2022 Jacob Lattie

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
