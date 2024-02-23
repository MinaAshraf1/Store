import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class CustomCardCart extends StatefulWidget {
  final category;

  const CustomCardCart({super.key, required this.category});

  @override
  State<CustomCardCart> createState() => _CustomCard();
}

class _CustomCard extends State<CustomCardCart> {
  bool cart = true;
  
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).canvasColor,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: ListTile(
        title: Text('${widget.category['name']}'),
        titleTextStyle: Theme.of(context).textTheme.headlineSmall,
        subtitle: Text('${widget.category['price']}\$',),
        subtitleTextStyle: Theme.of(context).textTheme.bodySmall,
        leading: SizedBox(
          child: SizedBox(
            width: 50,
            child: Image.asset(widget.category['img'],
              fit: BoxFit.fill,
            ),
          ),
        ),
        trailing: IconButton(
          onPressed: (){
            setState(() {
              cart?
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.warning,
                  animType: AnimType.rightSlide,
                  title: 'Are You Sure to Cansel?',
                  desc: 'If you cansel you should pay 0.1\$',
                  titleTextStyle: Theme.of(context).textTheme.headlineSmall,
                  dismissOnTouchOutside: false,
                  dialogBackgroundColor: Theme.of(context).canvasColor,
                  btnCancelOnPress: (){},
                  btnOkOnPress: () {
                    setState(() {
                      cart = false;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Removed done",
                            style: TextStyle(color: Theme.of(context).primaryColor
                            ),
                          ),
                          backgroundColor: Theme.of(context).canvasColor,
                          duration: const Duration(seconds: 1),
                          action: SnackBarAction(
                            label: "undo",
                            textColor: Theme.of(context).primaryColor,
                            onPressed: (){
                              setState(() {
                                cart = true;
                              });
                            },
                          ),
                        )
                    );
                  },
                ).show() :
              AwesomeDialog(
                context: context,
                dialogType: DialogType.warning,
                animType: AnimType.rightSlide,
                title: 'Are You Sure to Add?',
                desc: 'If you Add you should pay 0.1\$',
                titleTextStyle: Theme.of(context).textTheme.headlineSmall,
                dismissOnTouchOutside: false,
                dialogBackgroundColor: Theme.of(context).canvasColor,
                btnCancelOnPress: (){},
                btnOkOnPress: () {
                  setState(() {
                    cart = true;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Add done",
                          style: TextStyle(color: Theme.of(context).primaryColor
                          ),
                        ),
                        backgroundColor: Theme.of(context).canvasColor,
                        duration: const Duration(seconds: 2),
                        action: SnackBarAction(
                          label: "undo",
                          textColor: Theme.of(context).primaryColor,
                          onPressed: (){
                            setState(() {
                              cart = false;
                            });
                          },
                        ),
                      )
                  );
                },
              ).show();
            });
          },
          icon: cart? const Icon(Icons.cancel) : const Icon(Icons.add_box),
          color: cart? Colors.red : Colors.green,
        ),
      ),
    );
  }

}