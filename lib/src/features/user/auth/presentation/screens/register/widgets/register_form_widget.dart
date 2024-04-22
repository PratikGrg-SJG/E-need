part of '../register_screen.dart';

class RegisterFormWidget extends StatelessWidget {
  const RegisterFormWidget({
    super.key,
  });

  // Method to check the strength of the password
  String? isPasswordStrong(String password) {
    // Regular expressions to check for different criteria
    RegExp lowercaseRegex = RegExp(r'[a-z]');
    RegExp uppercaseRegex = RegExp(r'[A-Z]');
    RegExp digitRegex = RegExp(r'\d');
    RegExp specialCharRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

    // Check for minimum length
    if (password.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    // Check for presence of lowercase letters
    if (!lowercaseRegex.hasMatch(password)) {
      return 'Password must contain at least one lowercase letter';
    }

    // Check for presence of uppercase letters
    if (!uppercaseRegex.hasMatch(password)) {
      return 'Password must contain at least one uppercase letter';
    }

    // Check for presence of digits
    if (!digitRegex.hasMatch(password)) {
      return 'Password must contain at least one digit';
    }

    // Check for presence of special characters
    if (!specialCharRegex.hasMatch(password)) {
      return 'Password must contain at least one special character';
    }

    // If all criteria are met, return null
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          style: TextStyle(color: Colors.white),
          textInputAction: TextInputAction.next,
          controller: sl.get<RegisterUserCubit>().nameController,
          validator: (userName) {
            if (userName == null || userName.isEmpty) {
              return "Required field!";
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: "UserName",
            labelStyle: TextStyle(color: Colors.white),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          height: 6,
        ),
        TextFormField(
          style: TextStyle(color: Colors.white),
          textInputAction: TextInputAction.next,
          controller: sl.get<RegisterUserCubit>().emailController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "This is required filed";
            }
            if (!value.contains("@")) {
              // if value ma @ chaina vane
              return "please enter a valied emails";
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: "Email",
            labelStyle: TextStyle(color: Colors.white),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          height: 6,
        ),
        TextFormField(
          controller: sl.get<RegisterUserCubit>().phoneController,
          textInputAction: TextInputAction.next,
          validator: (phone) {
            if (phone == null || phone.isEmpty) {
              return "Please enter your contact number!";
            }
            if (phone.length < 10 || phone.length > 10) {
              return "Invalid contact number!!";
            }
            return null;
          },
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            labelText: "Phone",
            labelStyle: TextStyle(color: Colors.white),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          height: 6,
        ),
        TextFormField(
          controller: sl.get<RegisterUserCubit>().addressController,
          textInputAction: TextInputAction.next,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter your address!";
            }

            return null;
          },
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            labelText: "Address",
            labelStyle: TextStyle(color: Colors.white),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          height: 6,
        ),
        TextFormField(
          style: TextStyle(color: Colors.white),
          textInputAction: TextInputAction.next,
          controller: sl.get<RegisterUserCubit>().passwordController,
          obscureText: true,
          validator: (password) {
            var strengthMessage = isPasswordStrong(password ?? '');
            if (password == null || password.isEmpty) {
              return "Required field!";
            }
            if (password.length < 8) {
              return "Password needs to be atleast of 8 Characters !";
            }
            if (strengthMessage != null) {
              return strengthMessage;
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: "Password",
            labelStyle: TextStyle(color: Colors.white),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          height: 6,
        ),
        TextFormField(
          style: TextStyle(color: Colors.white),
          textInputAction: TextInputAction.done,
          controller: sl.get<RegisterUserCubit>().confirmPasswordController,
          obscureText: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please confirm your password!";
            }
            if (value != sl.get<RegisterUserCubit>().passwordController.text) {
              return "Passwords donot match!";
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: "Confirm Password",
            labelStyle: TextStyle(color: Colors.white),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
