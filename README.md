# text_switch

A Flutter package for awesome text switch.

## 🚀 Features

1. Customize active and inactive color
2. Customize active and inactive text
3. Text color
4. gradient background
5. border color
6. Supports Null-safety

[![Say Thanks!](https://img.shields.io/badge/Say%20Thanks-!-1EAEDB.svg)](https://saythanks.io/to/sampathnarayanan72%40gmail.com)


## Show some :heart: and star the repo to support the project

 [![GitHub followers](https://img.shields.io/github/followers/narayanansampath?style=social&label=Follow)](https://github.com/narayanansampath)

[![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg?v=102)](https://github.com/narayanansampath/text_switch/blob/master/LICENSE)


## 💻 Installation

In the `dependencies:` section of your `pubspec.yaml`, add the following line:

```yaml
text_switch: <latest_version>
```

Import in your project:
```dart
import 'package:text_switch/text_switch.dart';
```

## ❔Basic Usage
```dart
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Switch Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextSwitch(
              activeText: 'ON',
              inactiveText: 'OFF',
              value: isActive,
              onChanged: (val) {
                print('Value: $val');
                setState(() => isActive = val);
              },
              activeColor: Colors.white,
              borderColor: Colors.black,
              // you can either pass inactiveColor or gradient for inactive text
              inactiveColor: Colors.green,
              // if both inactiveColor and gradient are passed then gradient will take precedence
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.lightBlueAccent],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
            SizedBox(height: 12.0),
            Text('Value : $isActive', style: TextStyle(fontSize: 24.0))
          ],
        ),
      ),
    );
  }
}
```
## Screenshots

 ![text_switch](https://media.giphy.com/media/yt9XJG7wrUNsU7bFcI/giphy.gif)


## 👨 Developed By

```
Sampath Narayanan
```

<a href="https://www.linkedin.com/in/narayanan-sampath/"><img src="https://img.shields.io/badge/linkedin-%230077B5.svg?&style=for-the-badge&logo=linkedin&logoColor=white"></a>
<a href="https://medium.com/@sampathnarayanan72"><img src="https://img.shields.io/badge/medium-%2312100E.svg?&style=for-the-badge&logo=medium&logoColor=white"></a>
<a href="https://dev.to/narayanansampath"><img src="https://img.shields.io/badge/DEV.TO-%230A0A0A.svg?&style=for-the-badge&logo=dev-dot-to&logoColor=white"></a>

# 👍 How to Contribute

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request

All contributions are highly appreciated!

# 📃 License

   MIT License

   Copyright (c) 2020 Sampath Narayanan

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


## Getting Started

For help getting started with Flutter, view our online [documentation](https://flutter.dev/).

For help on editing package code, view the [documentation](https://flutter.dev/developing-packages/).
