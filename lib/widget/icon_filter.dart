import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../screens/home/widget/modal_bottom_order_widget.dart';

class IconFilterWidget extends StatelessWidget {
  const IconFilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Positioned(
      top: 70,
      right: 25,
      child: InkWell(
        // onTap: () {Provider.of<ModalProvider>(context, listen: false).onTappedBar();}
        child: Opacity(
          opacity: 1.0,
          child: Container(
            
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.shade300,
            ),
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Ordina", style: theme.textTheme.bodyLarge!.copyWith(color: Colors.grey.shade900, fontSize: 16)),
                  ),
                  Icon(Icons.swap_vert_outlined, color: Colors.black, size: 30,),
                ],
              ),
            ),
          ),
        ),
        onTap: () { 
          modalBottomOrder(context);
        } 
      ),
    );
  }

  Future<void> modalBottomOrder(context) {
    return showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      context: context,
      builder: (BuildContext context) {
        return ModalBottomOrderWidget();
      },
    );
  }
}