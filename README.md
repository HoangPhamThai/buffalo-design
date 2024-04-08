# buffalo_design

A Flutter library providing various widgets and responsive layouts for fast UI development.

## Responsive UI:

This library offers `BaseScreen` widget that can be extended for responsive UI. It provides 3 built-in methods for 3 sizes of screen: `buildFullScreen()`, `buildSmallScreen()` and `buildMobile()`:

```
class PageScreen extends BaseScreen {
  const PageScreen({super.key});

  @override
  _PageScreenState createState() => _PageScreenState();
}

class _PageScreenState extends BaseScreenState<PageScreen> {
  late List<Widget> listWidget;
  @override
  void initState() {
    super.initState();
    listWidget = [
      Container(
        padding: const EdgeInsets.all(8),
        color: Colors.teal[100],
        child: const Text("He'd have you all unravel at the"),
      ),
      Container(
        padding: const EdgeInsets.all(8),
        color: Colors.teal[200],
        child: const Text('Heed not the rabble'),
      ),
      Container(
        padding: const EdgeInsets.all(8),
        color: Colors.teal[300],
        child: const Text('Sound of screams but the'),
      ),
      Container(
        padding: const EdgeInsets.all(8),
        color: Colors.teal[400],
        child: const Text('Who scream'),
      ),
    ];
  }

  @override
  Widget buildFullScreen() {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.red,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 4,
        children: listWidget,
      ),
    );
  }

  @override
  Widget buildSmallScreen() {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.green),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 30,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        children: listWidget,
      ),
    );
  }

  @override
  Widget buildMobile() {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 60,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: listWidget,
      ),
    );
  }
}
```

# UI Components

## Avatar: 

<img width="331" alt="Screenshot 2024-04-08 at 09 57 37" src="https://github.com/HoangPhamThai/buffalo-design/assets/48664161/b332c260-aca0-4677-b49a-601d501613e4">

Basic usage:

```
BFAvatar(
  imageUrl: 'https://i.pravatar.cc/150?img=5',
),
```

Custom radius:

```
BFAvatar(
  imageUrl: 'https://i.pravatar.cc/150?img=5',
  radius: 24,
),
```

If `imageUrl` is empty, it will show the person icon by default, or you can customize it by adding your own widget to `defaultAvatar`. If you want to show a short name, you can pass it to `alternativeName`, e.g. 'John Doe' will become 'JD'.

You can show a badge by setting `showBadge` to true, the badge's color and the badge itself can be customized in fields `badgeColor` and `badge` respectively.

```
BFAvatar(
  imageUrl: '',
  alternativeName: "John Doe",
  showBadge: true,
  badgeColor: Colors.orange,
  radius: 24,
),
```

## Button
## Chip
## Column/Row
<img width="476" alt="image" src="https://github.com/HoangPhamThai/buffalo-design/assets/48664161/c40379b4-c198-475b-93ab-a2ab40748dca">

Being tired of adding spacing to your components in a Row/Column? Have to write more code to add divider between two successive items? `BFColumn` and `BFRow` are here to help.

```
BFColumn(
  withDefaultDivider: true,
  spacing: 20,
  children: [
    Text('abc'),
    Text('abc'),
    Text('abc'),
    Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.add),
        Text('abc'),
      ],
    )
  ],
),
```

```
BFRow(
  withDefaultDivider: true,
  children: [
    Container(
      height: 30,
      child: Text('abc'),
    ),
    Text('abc'),
    Text('abc'),
    Text('abc'),
    Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.add),
        Text('abc'),
      ],
    )
  ],
),
```

You can customize the separator by passing your own widget to `customSeparator`.

## Divider



## See more/less text
