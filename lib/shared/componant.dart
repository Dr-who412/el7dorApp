import 'package:flutter/material.dart';

void navigatfinished(context, Widget widget) {
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
          (route) => false);
}


NavigatPushTo({
  required BuildContext context,
  required Widget widget,
}) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
Widget TextFaildCustom({
  required TextEditingController controller,
  required TextInputType type,
  required bool isPassword,
  onsubmit,
  onChange,
  onTap,
  required validate,
  required String hint,
  IconData? prefix,
  IconData? suffix,
  suffixfun,
})=> TextFormField(
  controller: controller,
  keyboardType: type,
  obscureText: isPassword,
  onFieldSubmitted: onsubmit,
  onChanged: onChange,
  onTap: onTap,
  validator: validate,
  maxLines: 1,
  textAlignVertical: TextAlignVertical.bottom,
  textDirection: TextDirection.rtl,
  style: TextStyle(
    fontWeight: FontWeight.bold,
  ),
  decoration: InputDecoration(
    focusedBorder: InputBorder.none,
    enabledBorder: InputBorder.none,
    border: InputBorder.none,
    // label: Text(label),
    hintTextDirection: TextDirection.rtl,

    labelText:hint,
    hintText: hint,
    prefixIcon: Icon(prefix,color: Colors.white24,),
    suffixIcon: IconButton(onPressed: suffixfun, icon: Icon(suffix)),
  ),
);
Widget CastumCard({
  required Widget child,
  required Color color,
})=> Card(
  color: color,
  elevation: 16,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
  ),
  child:   Container(
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
    ),
    child:child,
  ),
);

void ShowAlrt({required BuildContext context, required Widget title,required Widget body}){
  showDialog(context: context,builder:(context){
    return AlertDialog(
      title: Center(child: title),
      content: body,
      titlePadding: EdgeInsets.symmetric(horizontal: 18,vertical: 4),

      contentPadding: EdgeInsets.all(18),
      elevation: 0,
       backgroundColor: Colors.transparent,
    );
  } );
}

enum toastStates { ERROR, WARRING, SUCESS }

Color? toastColor({toastStates? state}) {
  Color? color;
  switch (state) {
    case toastStates.ERROR:
      color = Color.fromRGBO(245, 3, 3, 0.6470588235294118).withOpacity(.4);
      break;
    case toastStates.SUCESS:
      color = Colors.green.withOpacity(.4);
      break;
    case toastStates.WARRING:
      color = Color.fromRGBO(245, 196, 1, 0.6980392156862745).withOpacity(.4);
      break;
  }
  return color;
}
Widget SectionCard({required String title,required String count })=>CastumCard(
    color: Colors.white,
    child: Container(
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: Text("${title}",
              style: TextStyle(color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),),
          ),
          Icon(Icons.group,color: Colors.deepOrange,size: 64,),
          Expanded(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color:Colors.deepOrange.withOpacity(.4) ,
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Text("${count}",
                style: TextStyle(color: Colors.white54,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),),
            ),
          ),
        ],
      ),
    )
);