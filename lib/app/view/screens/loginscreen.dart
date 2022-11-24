import 'package:flutter/material.dart';
import '../../controller/login_controlls.dart';
import '../../core/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool nomember = false;
  bool _isVisible = false;
 
  // final controller = TextEditingController();
  String _userid = "";
  String _password = '';
  void _onchangedid(String value) {
    _userid = value;
  }

  void _onchangedps(String value) {
    setState(() {
      _password = value;
    });
  }

  void updateStatus() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: EdgeInsets.fromLTRB(0, height * 0.245, 0, 0),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColor.themeColor),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 35),
                child: Center(
                  // ignore: avoid_unnecessary_containers
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.account_circle_outlined,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            Container(
                              padding: const EdgeInsets.all(5.0),
                              width: width * 0.65,
                              height: 50,
                              child: TextField(
                                //userid
                                // controller: controller,
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 255, 255, 255)),
                                decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(150, 255, 255, 255)),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)),
                                  ),
                                  hintText: "UserID",
                                  hintStyle: TextStyle(
                                    color: Color.fromARGB(150, 255, 255, 255),
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                onChanged: _onchangedid,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.key,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            Container(
                              padding: const EdgeInsets.all(5.0),
                              width: width * 0.65,
                              child: TextField(
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white),
                                onChanged: _onchangedps,
                                obscureText: _isVisible ? false : true,
                                decoration: InputDecoration(
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              150, 255, 255, 255)),
                                    ),
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255)),
                                    ),
                                    hintText: "Password",
                                    hintStyle: const TextStyle(
                                        color:
                                            Color.fromARGB(150, 255, 255, 255),
                                        fontSize: 18,
                                        fontStyle: FontStyle.italic),
                                    suffixIcon: IconButton(
                                      onPressed: () => updateStatus(),
                                      icon: Icon(
                                        _isVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
                                      ),
                                    )),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: nomember,
                              checkColor: AppColor.themeColor,
                              activeColor: Colors.white,
                              side: MaterialStateBorderSide.resolveWith(
                                (states) => const BorderSide(
                                    width: 2.0,
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                              onChanged: (boolvalue) {
                                setState(() {
                                  if (nomember == false) {
                                    nomember = true;
                                  } else {
                                    nomember = false;
                                  }
                                });
                              },
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                'Remember Me',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                            ),
                          ],
                        ),
                        
                     
                        InkWell(
                            onTap: () {
                              login(_userid, _password, context);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 8),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color.fromARGB(255, 242, 191, 17),
                              ),
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w800),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
