import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../configs/x_configs.dart';
import '../helpers/x_helpers.dart';

class FormInputText extends StatelessWidget {
  FormInputText(
    this.title, {
    this.text,
    this.txtController,
    this.isRequired = true,
    Key? key,
  }) : super(key: key);

  final String title;
  final String? text;
  final bool isRequired;
  final TextEditingController? txtController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: getFont(12)),
        TextFormField(
          controller: txtController,
          decoration: InputDecoration(
            enabledBorder:
                UnderlineInputBorder(borderSide: BorderSide(color: kAppGrey)),
            labelText: text,
            // filled: true,
            // fillColor: Colors.yellow,
            contentPadding: EdgeInsets.only(right: 10, top: 3),
            isDense: true,
          ),
          validator: (isRequired)
              ? (text) => text!.trim().isEmpty ? kFieldNullError : null
              : null,
        ),
        SizedBox(height: 15)
      ],
    );
  }
}

class FormInputWidget extends StatelessWidget {
  FormInputWidget(
    this.title, {
    this.text,
    this.txtController,
    this.widget,
    this.validator,
    Key? key,
  }) : super(key: key);

  final String title;
  final String? text;
  final TextEditingController? txtController;
  final Widget? widget;
  final dynamic validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(title, style: myText.copyWith(fontWeight: FontWeight.w300)),
        Text(title, style: getFont(12)),
        TextFormField(
          controller: txtController,
          decoration: InputDecoration(
              labelText: text,
              errorStyle: TextStyle(height: 0),
              // fillColor: Colors.yellow,
              enabledBorder:
                  UnderlineInputBorder(borderSide: BorderSide(color: kAppGrey)),
              contentPadding: EdgeInsets.only(right: 10, top: 3),
              // isDense: true,
              suffixIcon: widget),
          validator:
              validator, // (text) => text!.trim().isEmpty ? kFieldNullError : null,
        ),
        SizedBox(height: 15)
      ],
    );
  }
}

class FormInputNumber extends StatelessWidget {
  const FormInputNumber(
    this.label, {
    this.txtController,
    Key? key,
  }) : super(key: key);

  final String label;
  final TextEditingController? txtController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: getFont(12)),
        TextFormField(
          controller: txtController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            // filled: true,
            // fillColor: Colors.yellow,
            enabledBorder:
                UnderlineInputBorder(borderSide: BorderSide(color: kAppGrey)),
            contentPadding: EdgeInsets.only(right: 10, top: 3),
            isDense: true,
          ),
          validator: (text) => text!.trim().isEmpty ? kFieldNullError : null,
        ),
        SizedBox(height: 15)
      ],
    );
  }
}

class FormInputCurr extends StatelessWidget {
  FormInputCurr(
    this.title, {
    this.text,
    this.txtController,
    Key? key,
  }) : super(key: key);

  final String title;
  final String? text;
  final TextEditingController? txtController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(title, style: myText.copyWith(fontWeight: FontWeight.w300)),
        Text(title, style: getFont(12)),
        TextFormField(
          controller: txtController,
          inputFormatters: <TextInputFormatter>[
            CurrencyTextInputFormatter(
              locale: 'id',
              symbol: 'Rp ',
              decimalDigits: 0,
            )
          ],
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            enabledBorder:
                UnderlineInputBorder(borderSide: BorderSide(color: kAppGrey)),
            labelText: text,
            // filled: true,
            // fillColor: Colors.yellow,
            contentPadding: EdgeInsets.only(right: 10, top: 3),
            isDense: true,
          ),
          validator: (text) => text!.trim().isEmpty ? kFieldNullError : null,
        ),
        SizedBox(height: 15)
      ],
    );
  }
}

class FormInputHidden extends StatelessWidget {
  FormInputHidden(
    this.txtController,
    this.id, {
    Key? key,
  }) : super(key: key);

  final TextEditingController? txtController;
  final String? id;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: false,
      child: TextFormField(
        controller: txtController,
        decoration: InputDecoration(labelText: id),
      ),
    );
  }
}

class FormInputSearch extends StatefulWidget {
  FormInputSearch(
    this.isSearch,
    this.searchFocusNode,
    this.title, {
    this.text,
    this.txtController,
    Key? key,
  }) : super(key: key);

  final FocusNode searchFocusNode;
  final bool isSearch;
  final String title;
  final String? text;
  final TextEditingController? txtController;

  @override
  _FormInputSearchState createState() => _FormInputSearchState();
}

class _FormInputSearchState extends State<FormInputSearch> {
  // FocusNode searchFocusNode = FocusNode();

  @override
  void dispose() {
    widget.searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(bottom: 2),
      child: TextFormField(
        controller: widget.txtController,
        focusNode: widget.searchFocusNode,
        decoration: InputDecoration(
            labelText: widget.text,
            // filled: true,
            // fillColor: Colors.yellow,
            // contentPadding: EdgeInsets.only(right: 10, top: 3),
            isDense: true,
            suffixIcon: (widget.isSearch)
                ? InkWell(onTap: () {}, child: Icon(Icons.clear))
                : InkWell(onTap: () {}, child: Icon(Icons.check))),
      ),
    );
  }
}

class FormInputImage extends StatelessWidget {
  FormInputImage(this.title, this.fromCamera, this.fromGallery,
      {this.imageProv, Key? key})
      : super(key: key);

  final String title;
  final VoidCallback? fromCamera;
  final VoidCallback? fromGallery;
  final Widget? imageProv;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: getFont(12)),
        SizedBox(height: 5),
        Container(
          margin: EdgeInsets.only(bottom: 12),
          color: kAppGrey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: fromCamera, icon: Icon(Icons.camera)),
                  SizedBox(width: 30),
                  IconButton(
                      onPressed: fromGallery,
                      icon: Icon(Icons.folder_shared_outlined)),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                height: 250,
                width: 350,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            border: Border.all(width: 2, color: kWhite)),
                        child: imageProv ??
                            Image.asset('assets/images/noimage.jpg',
                                fit: BoxFit.cover))),
                // child: Image.asset('assets/images/noimage.jpg',fit: BoxFit.cover))),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class FormInputBlank extends StatelessWidget {
  FormInputBlank({
    this.text,
    this.txtController,
    this.widget,
    this.validator,
    Key? key,
  }) : super(key: key);

  final String? text;
  final TextEditingController? txtController;
  final Widget? widget;
  final dynamic validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: txtController,
            decoration: InputDecoration(
                labelText: text,
                errorStyle: TextStyle(height: 0),
                // fillColor: Colors.yellow,
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: kAppGrey)),
                contentPadding: EdgeInsets.only(right: 10, top: 3),
                // isDense: true,
                suffixIcon: widget),
            validator:
                validator, // (text) => text!.trim().isEmpty ? kFieldNullError : null,
          ),
          SizedBox(height: 15)
        ],
      ),
    );
  }
}
