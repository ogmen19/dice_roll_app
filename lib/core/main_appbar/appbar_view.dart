import 'package:dice_roll/constants.dart';
import 'package:flutter/material.dart';


class MainAppBar extends AppBar{
   MainAppBar({Key? key}) : super(key: key,
      leading: IconButton(onPressed: (){}, icon: ThemeIcons.appBarLeadingIcon),
      actions: [
        IconButton(onPressed: (){}, icon: ThemeIcons.appBarSettingIcon)
      ]
   );

}