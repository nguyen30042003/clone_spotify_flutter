import 'package:flutter/material.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';

class AppBarBasic extends StatelessWidget  implements PreferredSizeWidget{
  const AppBarBasic({super.key, this.title, this.hidden = false, this.action, this.backgroundColor});
  final Widget ? title;
  final Widget ? action;
  final Color ? backgroundColor;
  final bool hidden;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.transparent,
      title: Center(
          child: title ?? const Text('')
      ),
      actions: [
        action ?? Container()
      ],
      elevation: 0,
      leading: hidden ? null : IconButton(
        onPressed: (){Navigator.pop(context);},
        icon: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: context.checkDarkMode ? Colors.white.withOpacity(0.03) : Colors.black.withOpacity(0.05),
            shape: BoxShape.circle
          ),
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 15,
            color: context.checkDarkMode ? Colors.white : Colors.black,
          ),
        ),
      ),

    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
