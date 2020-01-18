import 'package:flutter/material.dart';
import 'user.dart';

class StateContainer extends StatefulWidget {
  final Widget child;
  final User user;

  StateContainer({@required this.child, this.user});

  static StateContainerState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(InheritedStateContainer)
            as InheritedStateContainer)
        .data;
  }

  @override
  StateContainerState createState() => new StateContainerState();
}

class StateContainerState extends State<StateContainer> {
  User user;

  void updateUser({name}) {
    if (user == null) {
      user = new User(name: name);
      setState(() {
        user = user;
      });
    } else {
      setState(() {
        user.name = name ?? user.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InheritedStateContainer(
      data: this,
      child: widget.child,
    );
  }
}

class InheritedStateContainer extends InheritedWidget {
  final StateContainerState data;
  InheritedStateContainer({
    Key key,
    @required this.data,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
