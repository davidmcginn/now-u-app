import 'package:flutter/material.dart';

final double borderRadius = 8.0;
final double padding = 14.0;

class DarkButton extends StatelessWidget {

  VoidCallback onPressed;
  String text;
  bool inverted;

  DarkButton( 
    String text, 
   {
    @required VoidCallback onPressed,
    bool inverted,
   } ) {
    this.onPressed = onPressed;
    this.text = text;
    this.inverted = inverted ?? false;
  }

  @override
  @override
  Widget build(BuildContext context) {
    return 
        !inverted ? 
          PrimaryButton(text, onPressed: onPressed) 
        : SecondaryButton(text, onPressed: onPressed);
  }
}

class SecondaryButton extends StatelessWidget {

  VoidCallback onPressed;
  String text;

  SecondaryButton( 
   String text, 
   {
   @required VoidCallback onPressed,
   bool inverted,
   } 
  ) 
  {
    this.onPressed = onPressed;
    this.text = text;
  }
  
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 0,
      color: Colors.white,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: BorderSide(
          color: Theme.of(context).buttonColor,
          width: 3.0
        ),
      ),
      child: Padding(
            padding: EdgeInsets.all(padding),
            child: Text(
              text,
              style: TextStyle(
                fontWeight: Theme.of(context).primaryTextTheme.button.fontWeight,
                fontSize: Theme.of(context).primaryTextTheme.button.fontSize,
                fontFamily: Theme.of(context).primaryTextTheme.button.fontFamily,
                color: Theme.of(context).buttonColor,
              ),
            ),
          ),

    );
  }
}

class PrimaryButton extends StatelessWidget {

  VoidCallback onPressed;
  String text;

  PrimaryButton( 
   String text, 
   {
   @required VoidCallback onPressed,
   bool inverted,
   } 
  ) 
  {
    this.onPressed = onPressed;
    this.text = text;
  }
  
  @override
  Widget build(BuildContext context) {
    return RaisedButton(

      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Padding(
            padding: EdgeInsets.all(padding),
            child: Text(
              text,
              style: Theme.of(context).primaryTextTheme.button,
            ),
          ),

    );
  }
}

