import 'package:flutter/material.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void showSuccessBottomSheet(BuildContext context) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        builder: (context) => Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).viewInsets.bottom + 40,
            left: 30,
            right: 30,
            bottom: MediaQuery.of(context).viewInsets.bottom + 60,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle, color: Colors.lightBlue, size: 60),
              SizedBox(height: 20),
              Text("Register Successfully",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text(
                "Congratulations! Your account created successfully. Now you can get amazing experience with our services.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
              SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    backgroundColor: const Color(0xFF3CB0FF),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    'Go To HomePage',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            // Back icon and title
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
                const Expanded(
                  child: Text(
                    'Verification',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(width: 48), // for symmetry with IconButton
              ],
            ),
            const SizedBox(height: 32),

            // Lock Icon in circle
            CircleAvatar(
              radius: 48,
              backgroundColor: const Color(0xFFE3F2FD),
              foregroundColor: const Color(0xFF3CB0FF),
              child: const Icon(Icons.lock, color: Colors.white, size: 40),
            ),
            const SizedBox(height: 32),

            const Text(
              'Verification Code',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const Text(
              'We have sent the code to\nabc@gmail.com',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 32),

            // Code input
            const CodeInputRow(),

            const SizedBox(height: 32),

            // Submit button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => showSuccessBottomSheet(context),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: const Color(0xFF3CB0FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Didn't receive the code? ",
                    style: TextStyle(color: Colors.grey)),
                Text(
                  "Resend",
                  style: TextStyle(color: Color(0xFF3CB0FF)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CodeInputRow extends StatefulWidget {
  const CodeInputRow({super.key});

  @override
  State<CodeInputRow> createState() => _CodeInputRowState();
}

class _CodeInputRowState extends State<CodeInputRow> {
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onCodeComplete() {
    String code = _controllers.map((c) => c.text).join();
    debugPrint("Code entered: $code");
    // You can pass this code back to VerificationScreen using a callback or state management
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(6, (index) {
        return Container(
          width: 48,
          height: 56,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          child: TextField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            onChanged: (value) {
              if (value.isNotEmpty) {
                if (index < 5) {
                  FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                } else {
                  _focusNodes[index].unfocus(); // Last box
                  _onCodeComplete(); // All done
                }
              } else if (value.isEmpty && index > 0) {
                FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
              }
            },
            decoration: InputDecoration(
              counterText: "",
              filled: true,
              fillColor: Colors.grey.shade100,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        );
      }),
    );
  }
}
