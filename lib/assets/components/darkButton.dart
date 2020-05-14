import 'package:app/assets/StyleFrom.dart';
import 'package:flutter/material.dart';

final double defaultBorderRadius = 8.0;
final double defaultPadding = 14.0;

enum DarkButtonStyles {
  Small,
  Medium,
  Large
}

Map darkButtonStyleStyles = {
  DarkButtonStyles.Small : {
           'style': DarkButtonStyles.Small,
          'height': 32.0,
    'borderRadius': 8.0,
        'fontSize': 14.0,
        'hPadding': 16.0,
        'vPadding': 8.0,
  },
  DarkButtonStyles.Medium: {
           'style': DarkButtonStyles.Medium,
          'height': 40.0,
    'borderRadius': 8.0,
        'fontSize': 17.0,
        'hPadding': 16.0,
        'vPadding': 8.0,
  },
  DarkButtonStyles.Large: {
           'style': DarkButtonStyles.Large,
          'height': 48.0,
    'borderRadius': 8.0,
        'fontSize': 17.0,
        'hPadding': 16.0,
        'vPadding': 8.0,
  },
};

class DarkButton extends StatelessWidget {

  VoidCallback onPressed;
  String text;
  bool inverted;
  bool rightArrow;
  DarkButtonStyles style;

  DarkButton( 
    String text, 
   {
    DarkButtonStyles style,
    @required VoidCallback onPressed,
    bool inverted,
    bool rightArrow,
   } ) {
    this.onPressed = onPressed;
    this.text = text;
    this.inverted = inverted ?? false;
    this.rightArrow = rightArrow ?? false;
    this.style = style ?? DarkButtonStyles.Large;
  }

  @override
  Widget build(BuildContext context) {
    return 
        !inverted ? 
          PrimaryButton(text, onPressed: onPressed, rightArrow: rightArrow, style: style) 
        : SecondaryButton(text, onPressed: onPressed, rightArrow: rightArrow, style: style);
  }
}

class SecondaryButton extends StatelessWidget {

  VoidCallback onPressed;
  String text;
  bool rightArrow;
  DarkButtonStyles style;

  SecondaryButton( 
   this.text, 
   {
   @required this.onPressed,
   @required this.rightArrow,
   @required this.style,
   } 
  );
  
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: darkButtonStyleStyles[style]['height'],
      elevation: 0,
      color: Colors.white,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(darkButtonStyleStyles[style]['borderRadius']),
        side: BorderSide(
          color: Theme.of(context).buttonColor,
          width: 3.0
        ),
      ),
      child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: darkButtonStyleStyles[style]['vPadding'],
              horizontal: darkButtonStyleStyles[style]['hPadding'],
            ),
            child: Text(
              text,
              style: textStyleFrom(
                Theme.of(context).primaryTextTheme.button,
                color: Theme.of(context).buttonColor,
                fontSize: darkButtonStyleStyles[style]['fontSize'],
              ),
            ),
          ),

    );
  }
}

class PrimaryButton extends StatelessWidget {

  VoidCallback onPressed;
  String text;
  bool rightArrow;
  DarkButtonStyles style;

  PrimaryButton( 
   this.text, 
   {
   @required this.onPressed,
   @required this.rightArrow,
   @required this.style,
   } 
  );
  
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: darkButtonStyleStyles[style]['height'],
      color: Theme.of(context).buttonColor ,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(darkButtonStyleStyles[style]['borderRadius']),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          !rightArrow ? Container() :
          Container(
            width: 5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: darkButtonStyleStyles[style]['vPadding'],
              horizontal: darkButtonStyleStyles[style]['hPadding'],
            ),
            child: Text(
              text,
              style: textStyleFrom(
                Theme.of(context).primaryTextTheme.button,
                color: Colors.white,
                fontSize: darkButtonStyleStyles[style]['fontSize'],
              ),
            ),
          ),
          !rightArrow ? Container() :
          Icon(
            Icons.chevron_right, 
            size: 25,
            color: Colors.white,
          ),
        ],
      ),

    );
  }
}

