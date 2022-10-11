import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app/layout/News_Layout/Cubit/cubit.dart';

// Button On Login Screen (Login and Register)
  Widget defaultButton({required double width, required double height, required Color background, required VoidCallback function, required String text}) =>
    SizedBox(
      height: height,
      width: width,
      child: MaterialButton(
        onPressed: function,
        color: background,
        elevation: 10,
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );

// Reusable Text Field On Login Screen (Email And Password)
  class ReusableTextField extends StatelessWidget {
  final String labelText;
  final bool isPassword;
  final bool? isEnabled;
  final void Function()? onTab;
  final void Function(String)? onChange;
  final IconData prefixIcon;
  final Color borderColor;
  final IconData? suffixIcon;
  final Function()? suffixFunc;
  final TextInputType keyboardInputType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const ReusableTextField({
    Key? key,
    required this.labelText,
    required this.prefixIcon,
    required this.keyboardInputType,
    this.suffixIcon,
    required this.isPassword,
    this.suffixFunc,
    this.controller,
    this.validator,
    this.onTab,
    this.isEnabled,
    this.onChange, required this.borderColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isEnabled,
      onTap: onTab,
      onChanged: onChange,
      obscureText: isPassword,
      validator: validator,
      controller: controller,
      keyboardType: keyboardInputType,
      decoration: InputDecoration(
        fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: borderColor)),
          enabledBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: borderColor)),
          suffixIcon: suffixIcon != null
              ? IconButton(onPressed: suffixFunc, icon: Icon(suffixIcon))
              : null,
          prefixIcon: Icon(prefixIcon),
          labelText: labelText),
    );
  }
}

  Widget buildArticleItem(article,context) => Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      Container(
        width: 120.0,
        height: 120.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
                image: (article['urlToImage'] == null ) ? const NetworkImage('https://st.depositphotos.com/2934765/54735/v/450/depositphotos_547359972-stock-illustration-photo-available-vector-icon-default.jpg'):NetworkImage('${article['urlToImage']}'),
                fit: BoxFit.cover)),
      ),
      const SizedBox(width: 20.0),
      Expanded(
        child: SizedBox(
          height: 120.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  '${article['title']}',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(color:NewsCubit.get(context).isDark == true ? Colors.deepOrange : Colors.black),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '${article['publishedAt']}',
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      )
    ],
  ),
);

  Widget divider({required Color colorOfDivider}) => Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: colorOfDivider,
      ),
    );

  Widget articleConditionalBuilder (list) => ConditionalBuilder(
    condition: list.isNotEmpty,
    builder: (BuildContext context)
    {
        return RefreshIndicator(
          onRefresh: ()
          async{
             if(NewsCubit.get(context).currantIndex == 0)
             {
               NewsCubit.get(context).getBusiness();
             }
             else if (NewsCubit.get(context).currantIndex == 1)
               {
                 NewsCubit.get(context).getSports();
               }
             else if (NewsCubit.get(context).currantIndex == 2)
             {
               NewsCubit.get(context).getHealth();
             }
          },
          child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, index) => buildArticleItem(list[index],context),
          separatorBuilder: (BuildContext context, index) => divider(colorOfDivider: Colors.grey),
          itemCount: list.length),
        );
   },
     fallback: (BuildContext context) =>
      const Center(child: CircularProgressIndicator()),

);

  void navigateTo (context,dynamic widget) =>  Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => widget),
);

