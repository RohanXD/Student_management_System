import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomButton extends StatefulWidget {
  const CustomButton(this.label,this.icon, this.iconcolor,
      {super.key,required this.screen});

  final String label;
  final IconData? icon;
  final Color iconcolor;
  final Widget Function() screen;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _screen = false;
  @override
  Widget build(context) {
    return OutlinedButton(
      onPressed: _screen ? null : () {
        setState(() {
          _screen = true;
        });
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget.screen()),
        );
      },
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        backgroundColor: const Color.fromARGB(255, 39, 39, 39),
        side: const BorderSide(color: Color.fromARGB(255, 39, 39, 39)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
    ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.icon != null)
            Icon(
              widget.icon!,
              size: 30,
              color: widget.iconcolor,
            ),
          Text(
            widget.label,
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
