import 'package:flutter/material.dart';
import 'package:kinder/Teacher/teacher.dart';
import 'dart:async';
import 'dart:math';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(GuardianApp());
}

class GuardianApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Guardian School Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'SF Pro Display',
        scaffoldBackgroundColor: Color(0xFFF8F9FA),
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
        ),
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Splash Screen
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => UserTypeSelection()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[600],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.school,
              size: 100,
              color: Colors.white,
            ),
            SizedBox(height: 20),
            Text(
              'ABC School & College',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'For Students & Guardians',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// User Type Selection Screen
class UserTypeSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              const Spacer(flex: 2),
              // Header
              Text(
                'Select Your Role',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo[900],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Please choose how you want to use the app',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              
              // Student Card
              _UserTypeCard(
                icon: Icons.person_outline,
                title: 'Student/Guardian',
                subtitle: 'Access learning materials and track progress',
                color: Colors.blue,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(userType: 'student'),
                    ),
                  );
                },
              ),
              
              const SizedBox(height: 24),
              
              // Teacher Card
              _UserTypeCard(
                icon: Icons.school_outlined,
                title: 'Teacher',
                subtitle: 'Create content and manage classes',
                color: Colors.teal,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(userType: 'teacher'),
                    ),
                  );
                },
              ),
              
              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}

class _UserTypeCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _UserTypeCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: color.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: 28,
                  color: color,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo[900],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: color,
                size: 28,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class RoleCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final double height;
  final VoidCallback onTap;

  const RoleCard({
    required this.icon,
    required this.title,
    required this.color,
    required this.height,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color.withOpacity(0.95),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.35),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 32, color: Colors.white),
              const SizedBox(width: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// Login Screen

class LoginScreen extends StatefulWidget {
  final String userType;
  
  LoginScreen({required this.userType});
  
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with TickerProviderStateMixin {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _obscurePassword = true;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _slideAnimation = Tween<Offset>(
      begin: Offset(0.0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack));
    
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Color get primaryColor => widget.userType == 'student' 
      ? Color(0xFF6366F1) // Indigo
      : Color(0xFF10B981); // Emerald

  Color get secondaryColor => widget.userType == 'student'
      ? Color(0xFF8B5CF6) // Purple
      : Color(0xFF059669); // Dark emerald

  void _login() async {
    if (!_formKey.currentState!.validate()) return;
    
    setState(() {
      _isLoading = true;
    });

    // Simulate login process
    await Future.delayed(Duration(seconds: 2));

    if (widget.userType == 'student') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => TeacherMainPage()),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              primaryColor.withOpacity(0.1),
              secondaryColor.withOpacity(0.05),
              Colors.white,
            ],
            stops: [0.0, 0.3, 1.0],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Back button
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back_ios, color: primaryColor),
                      style: IconButton.styleFrom(
                        //backgroundColor: Colors.white,
                        elevation: 2,
                      ),
                    ),
                  ),
                  
                  SizedBox(height: 40),
                  
                  // Animated header section
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: SlideTransition(
                      position: _slideAnimation,
                      child: Column(
                        children: [
                          // Logo/Icon with gradient background
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [primaryColor, secondaryColor],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: primaryColor.withOpacity(0.3),
                                  blurRadius: 20,
                                  offset: Offset(0, 10),
                                ),
                              ],
                            ),
                            child: Icon(
                              widget.userType == 'student' ? Icons.school : Icons.person_2,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                          
                          SizedBox(height: 24),
                          
                          // Welcome text
                          Text(
                            'Welcome Back!',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800],
                            ),
                          ),
                          
                          SizedBox(height: 8),
                          
                          Text(
                            widget.userType == 'student' 
                                ? 'Sign in to your student account'
                                : 'Sign in to your teacher account',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  SizedBox(height: 50),
                  
                  // Phone number field
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    child: TextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        if (value.length < 10) {
                          return 'Please enter a valid phone number';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        labelStyle: TextStyle(color: Colors.grey.shade500,fontSize: 15),
                        //hintText: 'Enter your phone number',
                        prefixIcon: Container(
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(Icons.phone, color: primaryColor),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey[50],
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: primaryColor, width: 2),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.red, width: 1),
                        ),
                      ),
                    ),
                  ),
                  
                  SizedBox(height: 20),
                  
                  // Password field
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.grey.shade500,fontSize: 15),

                        //hintText: 'Enter your password',
                        prefixIcon: Container(
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(Icons.lock, color: primaryColor),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                          icon: Icon(
                            _obscurePassword ? Icons.visibility : Icons.visibility_off,
                            color: Colors.grey[600],
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey[50],
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: primaryColor, width: 2),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.red, width: 1),
                        ),
                      ),
                    ),
                  ),
                  
                  //SizedBox(height: 6),
                  
                  // Forgot password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Handle forgot password
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  
                  //SizedBox(height: 30),
                  
                  // Login button
                  Container(
                    height: 56,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [primaryColor, secondaryColor],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: primaryColor.withOpacity(0.3),
                          blurRadius: 15,
                          offset: Offset(0, 8),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: _isLoading
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                  ),
                                ),
                                SizedBox(width: 12),
                                Text(
                                  'Signing In...',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )
                          : Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                  
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}

// Models
class Child {
  final String id;
  final String name;
  final String className;
  final String section;
  final String rollNumber;

  Child({
    required this.id,
    required this.name,
    required this.className,
    required this.section,
    required this.rollNumber,
  });
}

class AttendanceRecord {
  final DateTime date;
  final bool isPresent;
  final String checkInTime;
  final String checkOutTime;
  final bool isHoliday;
  final String? holidayReason;

  AttendanceRecord({
    required this.date,
    required this.isPresent,
    required this.checkInTime,
    required this.checkOutTime,
    this.isHoliday = false,
    this.holidayReason,
  });
}

class Subject {
  final String name;
  final String code;
  final String teacher;
  final IconData icon;
  final Color color;

  Subject({
    required this.name,
    required this.code,
    required this.teacher,
    required this.icon,
    required this.color,
  });
}

class ExamResult {
  final String examName;
  final String subject;
  final double marks;
  final double totalMarks;
  final String grade;
  final DateTime examDate;
  final Color color;
  final IconData icon;

  ExamResult({
    required this.examName,
    required this.subject,
    required this.marks,
    required this.totalMarks,
    required this.grade,
    required this.examDate,
    required this.color,
    required this.icon,
  });

  double get percentage => (marks / totalMarks) * 100;
}

class Notice {
  final String title;
  final String content;
  final DateTime date;
  final bool isUrgent;
  final String type;
  final String? actionText;

  Notice({
    required this.title,
    required this.content,
    required this.date,
    required this.isUrgent,
    required this.type,
    this.actionText,
  });
}

class ClassRoutine {
  final String day;
  final String subject;
  final String teacher;
  final String room;
  final String time;
  final Color color;

  ClassRoutine({
    required this.day,
    required this.subject,
    required this.teacher,
    required this.room,
    required this.time,
    required this.color,
  });
}

class Fee {
  final String month;
  final double amount;
  final bool isPaid;
  final DateTime dueDate;
  final String description;

  Fee({
    required this.month,
    required this.amount,
    required this.isPaid,
    required this.dueDate,
    required this.description,
  });
}

class DetentionRecord {
  final DateTime date;
  final String status;
  final String description;
  final Color color;
  final String? detentionReason;

  DetentionRecord({
    required this.date,
    required this.status,
    required this.description,
    required this.color,
    this.detentionReason,
  });
}

class SportsActivity {
  final String name;
  final String type;
  final DateTime date;
  final String venue;
  final String description;
  final bool isParticipating;
  final String? position;
  final Color color;
  final IconData icon;

  SportsActivity({
    required this.name,
    required this.type,
    required this.date,
    required this.venue,
    required this.description,
    required this.isParticipating,
    this.position,
    required this.color,
    required this.icon,
  });
}

// Main Screen
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  // Mock Data
  final Child currentChild = Child(
    id: '1',
    name: 'Jhon Stifler',
    className: 'Class 10',
    section: 'A',
    rollNumber: '15',
  );

  List<AttendanceRecord> attendanceRecords = [];
  List<Subject> subjects = [
    Subject(
      name: 'Physics',
      code: 'PHY',
      teacher: 'Dr. Smith',
      icon: Icons.science,
      color: Color(0xFF4A90E2),
    ),
    Subject(
      name: 'Chemistry',
      code: 'CHE',
      teacher: 'Mrs. Johnson',
      icon: Icons.biotech,
      color: Color(0xFF50C878),
    ),
    Subject(
      name: 'Mathematics',
      code: 'MATH',
      teacher: 'Mr. Brown',
      icon: Icons.calculate,
      color: Color(0xFFFF6B6B),
    ),
    Subject(
      name: 'Biology',
      code: 'BIO',
      teacher: 'Dr. Wilson',
      icon: Icons.local_florist,
      color: Color(0xFF4ECDC4),
    ),
    Subject(
      name: 'English',
      code: 'ENG',
      teacher: 'Ms. Davis',
      icon: Icons.book,
      color: Color(0xFFFFD93D),
    ),
  ];

  List<ExamResult> examResults = [];
  List<Notice> notices = [
    Notice(
      title: 'Holiday and Vacation Notices',
      content:
          'Winter vacation will start from 20th December 2024 and will end on 5th January 2025. School will remain closed during this period.',
      date: DateTime.now().subtract(Duration(days: 2)),
      isUrgent: false,
      type: 'Holiday',
    ),
    Notice(
      title: 'Event Invitations',
      content:
          'Annual Science Fair will be held on 15th February 2025. All students are invited to participate and showcase their projects.',
      date: DateTime.now().subtract(Duration(days: 1)),
      isUrgent: false,
      type: 'Event',
    ),
    Notice(
      title: 'Fee Payment Reminder',
      content:
          'Monthly fee payment is due on 10th of every month. Please ensure timely payment to avoid late fees.',
      date: DateTime.now(),
      isUrgent: true,
      type: 'Fee',
      actionText: 'Pay Online',
    ),
    Notice(
      title: 'Parent-Teacher Meeting',
      content:
          'Parent-Teacher meeting scheduled for next Saturday at 10:00 AM. Please confirm your attendance.',
      date: DateTime.now().subtract(Duration(hours: 5)),
      isUrgent: true,
      type: 'Meeting',
    ),
    Notice(
      title: 'Exam Schedule Released',
      content:
          'Final term examination schedule has been released. Please check the academic portal for detailed timetable.',
      date: DateTime.now().subtract(Duration(days: 3)),
      isUrgent: false,
      type: 'Academic',
    ),
  ];

  List<ClassRoutine> classRoutines = [
    // Saturday
    ClassRoutine(day: 'Saturday', subject: 'Physics', teacher: 'Dr. Smith', room: 'A101', time: '9:00 AM', color: Colors.blue),
    ClassRoutine(day: 'Saturday', subject: 'English', teacher: 'Ms. Davis', room: 'B101', time: '9:00 AM', color: Colors.yellow),
    ClassRoutine(day: 'Saturday', subject: 'Chemistry', teacher: 'Mrs. Johnson', room: 'D101', time: '11:00 AM', color: Colors.teal),
    ClassRoutine(day: 'Saturday', subject: 'ICT', teacher: 'Ms. Grey', room: 'F101', time: '12:00 PM', color: Colors.orange),
    // Sunday
    ClassRoutine(day: 'Sunday', subject: 'English', teacher: 'Ms. Davis', room: 'B101', time: '9:00 AM', color: Colors.yellow),
    ClassRoutine(day: 'Sunday', subject: 'Physics', teacher: 'Dr. Smith', room: 'A101', time: '9:00 AM', color: Colors.blue),
    ClassRoutine(day: 'Sunday', subject: 'ICT', teacher: 'Ms. Grey', room: 'F101', time: '12:00 PM', color: Colors.orange),
    ClassRoutine(day: 'Sunday', subject: 'History', teacher: 'Mr. Black', room: 'E101', time: '8:30 AM', color: Colors.purple),
    // Monday
    ClassRoutine(day: 'Monday', subject: 'Biology', teacher: 'Dr. Wilson', room: 'C101', time: '9:00 AM', color: Colors.green),
    ClassRoutine(day: 'Monday', subject: 'English', teacher: 'Ms. Davis', room: 'B101', time: '9:00 AM', color: Colors.yellow),
    ClassRoutine(day: 'Monday', subject: 'Chemistry', teacher: 'Mrs. Johnson', room: 'D101', time: '11:00 AM', color: Colors.teal),
    ClassRoutine(day: 'Monday', subject: 'ICT', teacher: 'Ms. Grey', room: 'F101', time: '12:00 PM', color: Colors.orange),
    // Tuesday
    ClassRoutine(day: 'Tuesday', subject: 'Chemistry', teacher: 'Mrs. Johnson', room: 'D101', time: '11:00 AM', color: Colors.teal),
    ClassRoutine(day: 'Tuesday', subject: 'English', teacher: 'Ms. Davis', room: 'B101', time: '9:00 AM', color: Colors.yellow),
    ClassRoutine(day: 'Tuesday', subject: 'Physics', teacher: 'Dr. Smith', room: 'A101', time: '9:00 AM', color: Colors.blue),
    ClassRoutine(day: 'Tuesday', subject: 'ICT', teacher: 'Ms. Grey', room: 'F101', time: '12:00 PM', color: Colors.orange),
    // Wednesday
    ClassRoutine(day: 'Wednesday', subject: 'History', teacher: 'Mr. Black', room: 'E101', time: '8:30 AM', color: Colors.purple),
    ClassRoutine(day: 'Wednesday', subject: 'Physics', teacher: 'Dr. Smith', room: 'A101', time: '9:00 AM', color: Colors.blue),
    ClassRoutine(day: 'Wednesday', subject: 'ICT', teacher: 'Ms. Grey', room: 'F101', time: '12:00 PM', color: Colors.orange),
    ClassRoutine(day: 'Wednesday', subject: 'History', teacher: 'Mr. Black', room: 'E101', time: '8:30 AM', color: Colors.purple),
    // Thursday
    ClassRoutine(day: 'Thursday', subject: 'ICT', teacher: 'Ms. Grey', room: 'F101', time: '12:00 PM', color: Colors.orange),
    ClassRoutine(day: 'Thursday', subject: 'English', teacher: 'Ms. Davis', room: 'B101', time: '9:00 AM', color: Colors.yellow),
    ClassRoutine(day: 'Thursday', subject: 'Physics', teacher: 'Dr. Smith', room: 'A101', time: '9:00 AM', color: Colors.blue),
    ClassRoutine(day: 'Thursday', subject: 'ICT', teacher: 'Ms. Grey', room: 'F101', time: '12:00 PM', color: Colors.orange),
    // Friday is intentionally skipped.
  ];

  // Fees model
  List<Fee> feeRecords = [
    Fee(
      month: 'December 2024',
      amount: 5000.0,
      isPaid: false,
      dueDate: DateTime.now().add(Duration(days: 5)),
      description: 'Monthly Tuition Fee',
    ),
    Fee(
      month: 'November 2024',
      amount: 5000.0,
      isPaid: true,
      dueDate: DateTime.now().subtract(Duration(days: 25)),
      description: 'Monthly Tuition Fee',
    ),
    Fee(
      month: 'October 2024',
      amount: 5000.0,
      isPaid: true,
      dueDate: DateTime.now().subtract(Duration(days: 55)),
      description: 'Monthly Tuition Fee',
    ),
    Fee(
      month: 'September 2024',
      amount: 5500.0,
      isPaid: true,
      dueDate: DateTime.now().subtract(Duration(days: 85)),
      description: 'Monthly Tuition + Lab Fee',
    ),
  ];

  List<DetentionRecord> DetentionRecords = [];
  List<SportsActivity> sportsActivities = [];

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  void _initializeData() {
    _generateAttendanceData();
    _generateExamResults();
    _generateDetentionData();
    _generateSportsData();
  }

  void _generateAttendanceData() {
    final now = DateTime.now();
    for (int day = 1; day <= now.day; day++) {
      final date = DateTime(now.year, now.month, day);
      
      // Friday is always a holiday
      if (date.weekday == DateTime.friday) {
        attendanceRecords.add(
          AttendanceRecord(
            date: date,
            isPresent: false,
            checkInTime: '',
            checkOutTime: '',
            isHoliday: true,
            holidayReason: 'Friday Holiday',
          ),
        );
        continue;
      }
      
      // Saturday is weekend
      if (date.weekday == DateTime.saturday) {
        attendanceRecords.add(
          AttendanceRecord(
            date: date,
            isPresent: false,
            checkInTime: '',
            checkOutTime: '',
            isHoliday: true,
            holidayReason: 'Weekend',
          ),
        );
        continue;
      }

      bool isPresent = Random().nextDouble() > 0.1;
      attendanceRecords.add(
        AttendanceRecord(
          date: date,
          isPresent: isPresent,
          checkInTime: isPresent ? '9:${20 + Random().nextInt(20)}am' : '',
          checkOutTime: isPresent ? '2:${20 + Random().nextInt(20)}pm' : '',
        ),
      );
    }
  }

  void _generateExamResults() {
    final examTypes = ['Unit Test', 'Mid Term', 'Final'];
    final subjectData = [
      {'name': 'Physics', 'icon': Icons.science, 'color': Color(0xFF4A90E2)},
      {'name': 'Chemistry', 'icon': Icons.biotech, 'color': Color(0xFF50C878)},
      {
        'name': 'Mathematics',
        'icon': Icons.calculate,
        'color': Color(0xFFFF6B6B),
      },
      {
        'name': 'Biology',
        'icon': Icons.local_florist,
        'color': Color(0xFF4ECDC4),
      },
      {'name': 'English', 'icon': Icons.book, 'color': Color(0xFFFFD93D)},
    ];

    for (String examType in examTypes) {
      for (var subjectInfo in subjectData) {
        double marks;
        if (subjectInfo['name'] == 'Physics') {
          marks = examType == 'Final' ? 86 : 75 + Random().nextDouble() * 20;
        } else if (subjectInfo['name'] == 'Chemistry') {
          marks = examType == 'Final' ? 90 : 80 + Random().nextDouble() * 15;
        } else if (subjectInfo['name'] == 'Biology') {
          marks = examType == 'Mid Term' ? 20 : 70 + Random().nextDouble() * 25;
        } else {
          marks = 70.0 + Random().nextDouble() * 25;
        }

        final totalMarks = 100.0;
        String grade;
        if (marks >= 90)
          grade = 'A+';
        else if (marks >= 80)
          grade = 'A';
        else if (marks >= 70)
          grade = 'B';
        else if (marks >= 60)
          grade = 'C';
        else if (marks >= 40)
          grade = 'D';
        else
          grade = 'F';

        examResults.add(
          ExamResult(
            examName: examType,
            subject: subjectInfo['name'] as String,
            marks: marks,
            totalMarks: totalMarks,
            grade: grade,
            examDate: DateTime.now().subtract(
              Duration(days: Random().nextInt(90)),
            ),
            color: subjectInfo['color'] as Color,
            icon: subjectInfo['icon'] as IconData,
          ),
        );
      }
    }
  }

  void _generateDetentionData() {
    final now = DateTime.now();
    final statuses = ['Excellent', 'Good', 'Average', 'Detention'];
    final colors = [
      Color(0xFF4CAF50),
      Color(0xFF2196F3),
      Color(0xFFFF9800),
      Color(0xFFFF5722),
    ];
    final detentionReasons = [
      'No homework completed',
      'Disturbing class discipline',
      'Late submission of assignment',
      'Not paying attention in class',
      'Incomplete project work',
      'Talking during lecture',
      'Not bringing required books',
      'Poor handwriting in notebook',
    ];

    for (int day = 1; day <= now.day; day++) {
      final date = DateTime(now.year, now.month, day);
      if (date.weekday != DateTime.saturday &&
          date.weekday != DateTime.friday) {
        final statusIndex = Random().nextInt(statuses.length);
        final status = statuses[statusIndex];
        
        DetentionRecords.add(
          DetentionRecord(
            date: date,
            status: status,
            description: status == 'Detention'
                ? 'Student needs improvement in behavior & Detention'
                : 'Daily Detention & behavior assessment',
            color: colors[statusIndex],
            detentionReason: status == 'Detention'
                ? detentionReasons[Random().nextInt(detentionReasons.length)]
                : null,
          ),
        );
      }
    }
  }

  void _generateSportsData() {
    sportsActivities = [
      SportsActivity(
        name: 'Annual Sports Day',
        type: 'Competition',
        date: DateTime.now().add(Duration(days: 15)),
        venue: 'School Ground',
        description: 'Annual inter-house sports competition with various events',
        isParticipating: true,
        position: 'Team Captain - Red House',
        color: Color(0xFFFF5722),
        icon: Icons.emoji_events,
      ),
      SportsActivity(
        name: 'Football Tournament',
        type: 'Tournament',
        date: DateTime.now().add(Duration(days: 30)),
        venue: 'City Stadium',
        description: 'Inter-school football championship',
        isParticipating: true,
        position: 'Forward Player',
        color: Color(0xFF4CAF50),
        icon: Icons.sports_soccer,
      ),
      SportsActivity(
        name: 'Basketball League',
        type: 'League',
        date: DateTime.now().subtract(Duration(days: 10)),
        venue: 'School Court',
        description: 'Monthly basketball league matches',
        isParticipating: true,
        position: '2nd Place Winner',
        color: Color(0xFFFF9800),
        icon: Icons.sports_basketball,
      ),
      SportsActivity(
        name: 'Swimming Competition',
        type: 'Competition',
        date: DateTime.now().add(Duration(days: 45)),
        venue: 'Aquatic Center',
        description: 'District level swimming championship',
        isParticipating: false,
        color: Color(0xFF2196F3),
        icon: Icons.pool,
      ),
      SportsActivity(
        name: 'Cricket Match',
        type: 'Match',
        date: DateTime.now().subtract(Duration(days: 5)),
        venue: 'School Ground',
        description: 'Friendly match against neighboring school',
        isParticipating: true,
        position: 'Wicket Keeper',
        color: Color(0xFF9C27B0),
        icon: Icons.sports_cricket,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HomeScreen(
            child: currentChild,
            attendanceRecords: attendanceRecords,
            onFeatureTap: _navigateToFeature,
          ),
          MessagesScreen(),
          SportsScreen(sportsActivities: sportsActivities),
          ProfileScreen(child: currentChild),
        ],
      ),
bottomNavigationBar: Container(
  decoration: BoxDecoration(
    color: Colors.white,
   
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 10,
        offset: Offset(0, -5),
      ),
    ],
  ),
  child: Theme(
    data: Theme.of(context).copyWith(
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
    ),
    child: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      onTap: (index) => setState(() => _currentIndex = index),
      selectedItemColor: Color(0xFF4A90E2),
      unselectedItemColor: Color(0xFF9E9E9E),
      backgroundColor: Colors.white,
      elevation: 0,
      selectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 12,
      ),
      unselectedLabelStyle: TextStyle(fontSize: 12),
      items: [
        BottomNavigationBarItem(
          icon: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: _currentIndex == 0
                  ? Color(0xFF4A90E2)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.home_rounded,
              color:
                  _currentIndex == 0 ? Colors.white : Color(0xFF9E9E9E),
            ),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: _currentIndex == 1
                  ? Color(0xFF4A90E2)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.chat_bubble_outline_rounded,
              color:
                  _currentIndex == 1 ? Colors.white : Color(0xFF9E9E9E),
            ),
          ),
          label: 'Message',
        ),
        BottomNavigationBarItem(
          icon: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: _currentIndex == 2
                  ? Color(0xFF4A90E2)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.support_sharp,
              color:
                  _currentIndex == 2 ? Colors.white : Color(0xFF9E9E9E),
            ),
          ),
          label: 'Sports',
        ),
        BottomNavigationBarItem(
          icon: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: _currentIndex == 3
                  ? Color(0xFF4A90E2)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.person_outline,
              color:
                  _currentIndex == 3 ? Colors.white : Color(0xFF9E9E9E),
            ),
          ),
          label: 'Profile',
        ),
      ],
    ),
  ),
),


    );
  }

  void _navigateToFeature(String feature) {
    Widget screen;
    switch (feature) {
      case 'Attendance':
        screen = AttendanceDetailScreen(attendanceRecords: attendanceRecords);
        break;
      case 'Routine':
        screen = ClassesScreen(classRoutines: classRoutines);
        break;
      case 'Notice':
        screen = NoticeScreen(notices: notices);
        break;
      case 'Result':
        screen = ResultScreen(examResults: examResults, subjects: subjects);
        break;
      case 'Detention':
        screen = DetentionScreen(DetentionRecords: DetentionRecords);
        break;
      case 'Fees':
        screen = FeesScreen(feeRecords: feeRecords);
        break;
      case 'BookList':
        screen = BookListScreen();
        break;
      case 'Meeting':
        screen = MeetingScreen();
        break;
      default:
        return;
    }
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }
}

// Home Screen
class HomeScreen extends StatefulWidget {
  final Child child;
  final List<AttendanceRecord> attendanceRecords;
  final Function(String) onFeatureTap;

  const HomeScreen({
    required this.child,
    required this.attendanceRecords,
    required this.onFeatureTap,
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late DateTime _focusedDay;
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
    _selectedDay = _focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    final todayAttendance = widget.attendanceRecords.firstWhere(
      (e) =>
          e.date.year == DateTime.now().year &&
          e.date.month == DateTime.now().month &&
          e.date.day == DateTime.now().day,
      orElse: () => AttendanceRecord(
        date: DateTime.now(),
        isPresent: false,
        checkInTime: '',
        checkOutTime: '',
        isHoliday: false,
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _getGreeting(),
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF9E9E9E),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: const Color(0xFF4A90E2),
                              child: Text(
                                widget.child.name
                                    .split(' ')
                                    .map((e) => e.isNotEmpty ? e[0] : '')
                                    .join(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              '${widget.child.name}!',
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2C3E50),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            const Icon(
                              Icons.notifications_outlined,
                              color: Color(0xFF9E9E9E),
                              size: 25,
                            ),
                            Positioned(
                              right: 0,
                              top: 0,
                              child: Container(
                                width: 8,
                                height: 8,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 85, 111, 239),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),

              /// Feature Grid
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                crossAxisSpacing: 16,
                mainAxisSpacing: 5,
                childAspectRatio: 0.85,
                children: [
                  _buildFeatureItem(
                    'Attendance',
                    Icons.book,
                    () => widget.onFeatureTap('Attendance'),
                  ),
                  _buildFeatureItem(
                    'Routine',
                    Icons.class_outlined,
                    () => widget.onFeatureTap('Routine'),
                  ),
                  _buildFeatureItem(
                    'Notice',
                    Icons.campaign_outlined,
                    () => widget.onFeatureTap('Notice'),
                  ),
                  _buildFeatureItem(
                    'Result',
                    Icons.bar_chart_outlined,
                    () => widget.onFeatureTap('Result'),
                  ),
                  _buildFeatureItem(
                    'Detention',
                    Icons.psychology_outlined,
                    () => widget.onFeatureTap('Detention'),
                  ),
                  _buildFeatureItem(
                    'Fees',
                    Icons.account_balance_outlined,
                    () => widget.onFeatureTap('Fees'),
                  ),
                  _buildFeatureItem(
                    'BookList',
                    Icons.local_library_outlined,
                    () => widget.onFeatureTap('BookList'),
                  ),
                  _buildFeatureItem(
                    'Meeting',
                    Icons.video_call_outlined,
                    () => widget.onFeatureTap('Meeting'),
                  ),
                ],
              ),

              /// Today's Attendance
              const Text(
                'Today\'s Attendance',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C3E50),
                ),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Check In: ${todayAttendance.checkInTime.isEmpty ? 'N/A' : todayAttendance.checkInTime}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF9E9E9E),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Check Out: ${todayAttendance.checkOutTime.isEmpty ? 'N/A' : todayAttendance.checkOutTime}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF9E9E9E),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: todayAttendance.isHoliday
                            ? Colors.orange
                            : todayAttendance.isPresent
                                ? Colors.green
                                : Colors.redAccent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        todayAttendance.isHoliday
                            ? 'Holiday'
                            : todayAttendance.isPresent
                                ? 'Present'
                                : 'Absent',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              /// Calendar Title
              const Text(
                'Attendance Calendar',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C3E50),
                ),
              ),
              const SizedBox(height: 16),

              /// Attendance Calendar
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.white,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(12),
                child: _buildAttendanceCalendar(),
              ),
              
              const SizedBox(height: 16),
              
              /// Calendar Legend
              _buildCalendarLegend(),
              
              SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureItem(String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: const Color(0xFF4A90E2).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFF4A90E2), size: 24),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF4A90E2),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildAttendanceCalendar() {
    return TableCalendar(
      firstDay: DateTime.utc(2022, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      focusedDay: _focusedDay,
      selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
      calendarFormat: CalendarFormat.month,
      availableCalendarFormats: const {
        CalendarFormat.month: 'Month',
      },
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        titleTextStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color(0xFF2C3E50),
        ),
        leftChevronIcon: Icon(Icons.chevron_left, color: Color(0xFF4A90E2)),
        rightChevronIcon: Icon(Icons.chevron_right, color: Color(0xFF4A90E2)),
      ),
      startingDayOfWeek: StartingDayOfWeek.monday,
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
      },
      onPageChanged: (focusedDay) {
        setState(() => _focusedDay = focusedDay);
      },
      calendarStyle: CalendarStyle(
        todayDecoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.blueAccent, width: 2),
        ),
        selectedDecoration: BoxDecoration(
          color: Colors.green,
          shape: BoxShape.circle,
        ),
        weekendTextStyle: const TextStyle(color: Colors.redAccent),
        defaultTextStyle: const TextStyle(color: Colors.black),
        outsideDaysVisible: false,
      ),
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, day, _) => _buildDayCell(day),
        todayBuilder: (context, day, _) => _buildDayCell(day, isToday: true),
        selectedBuilder: (context, day, _) => _buildDayCell(day, isSelected: true),
        disabledBuilder: (context, day, _) => _buildDayCell(day, isDisabled: true),
      ),
    );
  }

  Widget _buildDayCell(
    DateTime day, {
    bool isToday = false,
    bool isSelected = false,
    bool isDisabled = false,
  }) {
    final record = widget.attendanceRecords.firstWhere(
      (r) =>
          r.date.year == day.year &&
          r.date.month == day.month &&
          r.date.day == day.day,
      orElse: () => AttendanceRecord(
        date: day,
        isPresent: false,
        checkInTime: '',
        checkOutTime: '',
        isHoliday: false,
      ),
    );

    final today = DateTime.now();
    bool isFuture = day.isAfter(DateTime(today.year, today.month, today.day));
    bool isTodayDate = day.year == today.year && day.month == today.month && day.day == today.day;

    Color textColor = Colors.black87;
    Color borderColor = Colors.transparent;
    Color bgColor = Colors.transparent;

    if (isFuture) {
      bgColor = Colors.grey.shade100;
      textColor = Colors.black;
    } else if (record.isHoliday) {
      bgColor = Colors.orangeAccent; // orange for holidays
      textColor = Colors.white;
    } else if (record.isPresent) {
      bgColor = const Color(0xFF4CAF50); // Green for present
      textColor = Colors.white;
    } else if (!record.isPresent && record.checkInTime == '') {
      bgColor = const Color(0xFFFF5722); // Red for absent
      textColor = Colors.white;
    } else {
      bgColor = const Color(0xFFE0E0E0);
    }

    // Today's special styling
    if (isTodayDate) {
      if (record.isHoliday) {
        bgColor =  Colors.orangeAccent;
        borderColor = Colors.white;
      } else if (record.isPresent) {
        bgColor = const Color(0xFF4CAF50);
        borderColor = Colors.white;
      } else {
        bgColor = const Color(0xFFFF5722);
        borderColor = Colors.white;
      }
      // Add a thicker border for today
      //borderColor = Colors.black;
    }

    if (isSelected && !isTodayDate) {
      borderColor = Colors.green;
    }

    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 9, vertical: 9),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: borderColor, width: isTodayDate ? 2.2 : 1.5),
      ),
      child: Text(
        '${day.day}',
        style: TextStyle(
          color: textColor,
          fontWeight: isTodayDate ? FontWeight.normal : FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildCalendarLegend() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildLegendItem('Present', Color(0xFF4CAF50)),
              _buildLegendItem('Absent', Color(0xFFFF5722)),
              _buildLegendItem('Holiday', Colors.orangeAccent),
              //_buildLegendItem('Future', Colors.grey.shade300),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        SizedBox(width: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Color(0xFF666666),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good Morning';
    if (hour < 17) return 'Good Afternoon';
    return 'Good Evening';
  }
}

// Sports Screen
class SportsScreen extends StatelessWidget {
  final List<SportsActivity> sportsActivities;

  SportsScreen({required this.sportsActivities});

  @override
  Widget build(BuildContext context) {
    final upcomingActivities = sportsActivities
        .where((activity) => activity.date.isAfter(DateTime.now()))
        .toList();
    final pastActivities = sportsActivities
        .where((activity) => activity.date.isBefore(DateTime.now()))
        .toList();

    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      appBar: AppBar(
        title: Text('Sports Activities'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sports Leadership Card
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF4A90E2), Color(0xFF357ABD)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF4A90E2).withOpacity(0.3),
                    blurRadius: 15,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.emoji_events, color: Colors.white, size: 30),
                      SizedBox(width: 12),
                      Text(
                        'Sports Leadership',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Team Captain - Red House',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Leading the Red House team in various sports competitions and maintaining team spirit.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),

            // Upcoming Activities
            Text(
              'Upcoming Activities',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2C3E50),
              ),
            ),
            SizedBox(height: 16),
            ...upcomingActivities.map((activity) => _buildActivityCard(activity)),
            SizedBox(height: 24),

            // Past Activities
            Text(
              'Past Activities',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2C3E50),
              ),
            ),
            SizedBox(height: 16),
            ...pastActivities.map((activity) => _buildActivityCard(activity)),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityCard(SportsActivity activity) {
    final isPast = activity.date.isBefore(DateTime.now());
    
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
        border: Border.all(
          color: activity.color.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: activity.color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  activity.icon,
                  color: activity.color,
                  size: 24,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      activity.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2C3E50),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      activity.type,
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF9E9E9E),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: activity.isParticipating
                      ? Color(0xFF4CAF50)
                      : Color(0xFF9E9E9E),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  activity.isParticipating ? 'Participating' : 'Not Participating',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            activity.description,
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF666666),
              height: 1.5,
            ),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Icon(Icons.location_on, size: 16, color: Color(0xFF9E9E9E)),
              SizedBox(width: 4),
              Text(
                activity.venue,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF9E9E9E),
                ),
              ),
              SizedBox(width: 16),
              Icon(Icons.calendar_today, size: 16, color: Color(0xFF9E9E9E)),
              SizedBox(width: 4),
              Text(
                '${activity.date.day}/${activity.date.month}/${activity.date.year}',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF9E9E9E),
                ),
              ),
            ],
          ),
          if (activity.position != null) ...[
            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: activity.color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    isPast ? Icons.emoji_events : Icons.star,
                    size: 16,
                    color: activity.color,
                  ),
                  SizedBox(width: 8),
                  Text(
                    activity.position!,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: activity.color,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// Detention Screen (Modified)
class DetentionScreen extends StatelessWidget {
  final List<DetentionRecord> DetentionRecords;

  DetentionScreen({required this.DetentionRecords});

  @override
  Widget build(BuildContext context) {
    final todayDetention = DetentionRecords.isNotEmpty 
        ? DetentionRecords.firstWhere(
            (record) => 
                record.date.year == DateTime.now().year &&
                record.date.month == DateTime.now().month &&
                record.date.day == DateTime.now().day,
            orElse: () => DetentionRecords.last,
          )
        : null;

    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      appBar: AppBar(
        title: Text('Detention'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Today's Detention
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Today\'s Detention & Behavior',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF2C3E50),
                            ),
                          ),
                          SizedBox(height: 4),
                          if (todayDetention?.detentionReason != null)
                            Text(
                              'Detention: ${todayDetention!.detentionReason}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFFFF5722),
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          else
                            Row(
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  size: 14,
                                  color: Color(0xFF4CAF50),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'Good Student',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF4CAF50),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: todayDetention?.color ?? Color(0xFF4CAF50),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          todayDetention?.status ?? 'Good',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),

            // Calendar
            _buildDetentionCalendar(),
            SizedBox(height: 16),
            
            // Detention Calendar Legend
            _buildDetentionLegend(),
            SizedBox(height: 24),

            // Detention History
            Text(
              'Recent Detention & Behavior Records',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2C3E50),
              ),
            ),
            SizedBox(height: 16),
            ...DetentionRecords.take(10).map(
              (record) => Container(
                margin: EdgeInsets.only(bottom: 12),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: record.color,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${record.date.day}/${record.date.month}/${record.date.year}',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF2C3E50),
                            ),
                          ),
                          Text(
                            record.description,
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF9E9E9E),
                            ),
                          ),
                          if (record.detentionReason != null)
                            Text(
                              'Reason: ${record.detentionReason}',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFFFF5722),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: record.color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        record.status,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: record.color,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetentionCalendar() {
    final now = DateTime.now();
    final currentMonth = now.month;
    final currentYear = now.year;
    final daysInMonth = DateTime(currentYear, currentMonth + 1, 0).day;
    final firstDayOfMonth = DateTime(currentYear, currentMonth, 1);
    final startingWeekday = firstDayOfMonth.weekday % 7;

    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'Detention Calendar - ${_getMonthName(currentMonth)} $currentYear',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C3E50),
            ),
          ),
          SizedBox(height: 20),
          // Weekday headers
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: ['M', 'T', 'W', 'T', 'F', 'S', 'S']
                .map(
                  (day) => Container(
                    width: 32,
                    height: 32,
                    alignment: Alignment.center,
                    child: Text(
                      day,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Color(0xFF9E9E9E),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          SizedBox(height: 8),
          // Calendar grid
          ...List.generate((daysInMonth + startingWeekday + 6) ~/ 7, (weekIndex) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(7, (dayIndex) {
                  final dayNumber = weekIndex * 7 + dayIndex - startingWeekday + 1;
                  if (dayNumber < 1 || dayNumber > daysInMonth) {
                    return Container(width: 32, height: 32);
                  }
                  final date = DateTime(currentYear, currentMonth, dayNumber);
                  final DetentionRecord = DetentionRecords
                      .where(
                        (record) =>
                            record.date.year == date.year &&
                            record.date.month == date.month &&
                            record.date.day == date.day,
                      )
                      .firstOrNull;

                  Color backgroundColor = Colors.transparent;
                  Color textColor = Color(0xFF2C3E50);
                  
                  if (DetentionRecord != null) {
                    backgroundColor = DetentionRecord.color.withOpacity(0.2);
                    textColor = DetentionRecord.color;
                  }

                  // Weekend styling
                  if (date.weekday == DateTime.saturday ||
                      date.weekday == DateTime.sunday) {
                    textColor = Color(0xFFCCCCCC);
                  }

                  // Today styling
                  if (dayNumber == now.day &&
                      currentMonth == now.month &&
                      currentYear == now.year) {
                    if (backgroundColor == Colors.transparent) {
                      backgroundColor = Color(0xFF4A90E2);
                      textColor = Colors.white;
                    }
                  }

                  return Container(
                    width: 32,
                    height: 32,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      dayNumber.toString(),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: textColor,
                      ),
                    ),
                  );
                }),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildDetentionLegend() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Detention Legend',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C3E50),
            ),
          ),
          SizedBox(height: 12),
          Wrap(
            spacing: 16,
            runSpacing: 8,
            children: [
              _buildDetentionLegendItem('Excellent', Color(0xFF4CAF50)),
              _buildDetentionLegendItem('Good', Color(0xFF2196F3)),
              _buildDetentionLegendItem('Average', Color(0xFFFF9800)),
              _buildDetentionLegendItem('Detention', Color(0xFFFF5722)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetentionLegendItem(String label, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: color, width: 2),
          ),
        ),
        SizedBox(width: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Color(0xFF666666),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  String _getMonthName(int month) {
    const months = [
      '',
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month];
  }
}

// Notice Screen
class NoticeScreen extends StatelessWidget {
  final List<Notice> notices;

  NoticeScreen({required this.notices});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      appBar: AppBar(
        title: Text('Notice'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: notices
              .map(
                (notice) => Container(
                  margin: EdgeInsets.only(bottom: 16),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          if (notice.isUrgent)
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xFFFF5722),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                'URGENT',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          if (notice.isUrgent) SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              notice.title,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2C3E50),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        '${notice.date.day}th ${_getMonthName(notice.date.month)} ${notice.date.year}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF9E9E9E),
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        notice.content,
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF666666),
                          height: 1.5,
                        ),
                      ),
                      if (notice.actionText != null) ...[
                        SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF4A90E2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: Text(
                              notice.actionText!,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  String _getMonthName(int month) {
    const months = [
      '',
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month];
  }
}

// Result Screen
class ResultScreen extends StatefulWidget {
  final List<ExamResult> examResults;
  final List<Subject> subjects;

  ResultScreen({required this.examResults, required this.subjects});

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String selectedExam = 'Final';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      appBar: AppBar(
        title: Text('Result'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // Tab Bar
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: TabBar(
              controller: _tabController,
              labelColor: Color(0xFF4A90E2),
              unselectedLabelColor: Color(0xFF9E9E9E),
              indicatorColor: Color(0xFF4A90E2),
              indicatorWeight: 3,
              labelStyle: TextStyle(fontWeight: FontWeight.w600),
              onTap: (index) {
                setState(() {
                  selectedExam = ['Unit Test', 'Mid Term', 'Final'][index];
                });
              },
              tabs: [
                Tab(text: 'Unit Test'),
                Tab(text: 'Mid Term'),
                Tab(text: 'Final'),
              ],
            ),
          ),
          SizedBox(height: 20),
          // Results List
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: _getResultsForExam(selectedExam)
                    .map(
                      (result) => Container(
                        margin: EdgeInsets.only(bottom: 16),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: result.color.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                result.icon,
                                color: result.color,
                                size: 24,
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    result.subject,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF2C3E50),
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Text(
                                        'Grade: ${_getGradeLetter(result.percentage)}',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF4A90E2),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        _getGradeDescription(result.percentage),
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF9E9E9E),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 60,
                              height: 60,
                              child: Stack(
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    child: CircularProgressIndicator(
                                      value: result.percentage / 100,
                                      strokeWidth: 4,
                                      backgroundColor: result.color.withOpacity(0.1),
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        result.color,
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      '${result.percentage.toInt()}%',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: result.color,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<ExamResult> _getResultsForExam(String examName) {
    return widget.examResults
        .where((result) => result.examName == examName)
        .toList();
  }

  String _getGradeDescription(double percentage) {
    if (percentage >= 90) return 'Excellent';
    if (percentage >= 80) return 'Very Good';
    if (percentage >= 70) return 'Good';
    if (percentage >= 60) return 'Average';
    if (percentage >= 40) return 'Below Average';
    return 'Poor';
  }

  String _getGradeLetter(double percentage) {
    if (percentage >= 80) return 'A+';
    if (percentage >= 70) return 'A';
    if (percentage >= 60) return 'B';
    if (percentage >= 50) return 'C';
    if (percentage >= 40) return 'D';
    return 'F';
  }
}

// Classes Screen
class ClassesScreen extends StatelessWidget {
  final List<ClassRoutine> classRoutines;

  ClassesScreen({required this.classRoutines});

  final List<String> days = [
    'Saturday',
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
  ];

  int getTodayTabIndex() {
    final today = DateTime.now().weekday;
    switch (today) {
      case DateTime.saturday:
        return 0;
      case DateTime.sunday:
        return 1;
      case DateTime.monday:
        return 2;
      case DateTime.tuesday:
        return 3;
      case DateTime.wednesday:
        return 4;
      case DateTime.thursday:
        return 5;
      case DateTime.friday:
        return 6;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final int initialTabIndex = getTodayTabIndex();

    return DefaultTabController(
      length: days.length,
      initialIndex: initialTabIndex,
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FA),
        appBar: AppBar(
          title: const Text('Class Routine'),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
          bottom: TabBar(
            labelColor: const Color(0xFF4A90E2),
            unselectedLabelColor: const Color(0xFF9E9E9E),
            indicatorColor: const Color(0xFF4A90E2),
            isScrollable: true,
            tabs: days.map((day) => Tab(text: day)).toList(),
          ),
        ),
        body: TabBarView(
          children: days.map((day) => _buildDaySchedule(day)).toList(),
        ),
      ),
    );
  }

  Widget _buildDaySchedule(String day) {
    final lowerDay = day.toLowerCase();
    final List<ClassRoutine> dayClasses = classRoutines
        .where((routine) => routine.day.toLowerCase() == lowerDay)
        .toList();

    if (lowerDay == 'friday') {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 200),
                Center(
                  child: Text(
                    'No classes today!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 42, 41, 41),
                    ),
                  ),
                ),
                Image.network(
                    "https://cdn-icons-png.flaticon.com/128/11887/11887123.png")
              ],
            ),
          ),
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: dayClasses.map((routine) {
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 4,
                  height: 50,
                  decoration: BoxDecoration(
                    color: routine.color,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        routine.subject,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2C3E50),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${routine.teacher} • ${routine.room}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF9E9E9E),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: routine.color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    routine.time,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: routine.color,
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

// Fees Screen
class FeesScreen extends StatelessWidget {
  final List<Fee> feeRecords;

  FeesScreen({required this.feeRecords});

  @override
  Widget build(BuildContext context) {
    final unpaidFees = feeRecords.where((fee) => !fee.isPaid).toList();
    final totalUnpaid = unpaidFees.fold(0.0, (sum, fee) => sum + fee.amount);

    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      appBar: AppBar(
        title: Text('Fee Payment'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Summary Card
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF4A90E2), Color(0xFF357ABD)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF4A90E2).withOpacity(0.3),
                    blurRadius: 15,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Fee Summary',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Outstanding',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            '৳${totalUnpaid.toStringAsFixed(0)}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '${unpaidFees.length} Pending',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),

            // Due Alert
            if (unpaidFees.isNotEmpty)
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFFFFE0B2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(Icons.warning, color: Color(0xFFFF8F00)),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'You have ${unpaidFees.length} pending fee payment(s)',
                        style: TextStyle(
                          color: Color(0xFFFF8F00),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            SizedBox(height: 24),

            Text(
              'Fee Records',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2C3E50),
              ),
            ),
            SizedBox(height: 16),
            ...feeRecords
                .map(
                  (fee) => Container(
                    margin: EdgeInsets.only(bottom: 12),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: Offset(0, 2),
                        ),
                      ],
                      border: Border.all(
                        color: fee.isPaid
                            ? Color(0xFF4CAF50).withOpacity(0.3)
                            : Color(0xFFFF5722).withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: fee.isPaid
                                    ? Color(0xFF4CAF50).withOpacity(0.1)
                                    : Color(0xFFFF5722).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                fee.isPaid ? Icons.check_circle : Icons.payment,
                                color: fee.isPaid
                                    ? Color(0xFF4CAF50)
                                    : Color(0xFFFF5722),
                                size: 20,
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                fee.month,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF2C3E50),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: fee.isPaid
                                    ? Color(0xFF4CAF50)
                                    : Color(0xFFFF5722),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                fee.isPaid ? 'PAID' : 'DUE',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Text(
                          fee.description,
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF666666),
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Amount: ৳${fee.amount.toStringAsFixed(0)}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF2C3E50),
                              ),
                            ),
                            Text(
                              'Due: ${fee.dueDate.day}/${fee.dueDate.month}/${fee.dueDate.year}',
                              style: TextStyle(
                                color: Color(0xFF9E9E9E),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        if (!fee.isPaid) ...[
                          SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () => _showPaymentDialog(context, fee),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF4A90E2),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 12),
                              ),
                              child: Text(
                                'Pay Now',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }

  void _showPaymentDialog(BuildContext context, Fee fee) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text('Payment Options'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Pay ৳${fee.amount.toStringAsFixed(0)} for ${fee.month}'),
            SizedBox(height: 16),
            _buildPaymentOption(
              context,
              'bKash',
              Color(0xFFE2136E),
              Icons.phone_android,
            ),
            _buildPaymentOption(
              context,
              'Nagad',
              Color(0xFFFF6600),
              Icons.phone_android,
            ),
            _buildPaymentOption(
              context,
              'Credit/Debit Card',
              Color(0xFF4A90E2),
              Icons.credit_card,
            ),
            _buildPaymentOption(
              context,
              'Bank Transfer',
              Color(0xFF4CAF50),
              Icons.account_balance,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(
    BuildContext context,
    String title,
    Color color,
    IconData icon,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        tileColor: color.withOpacity(0.1),
        leading: Icon(icon, color: color),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
        trailing: Icon(Icons.arrow_forward_ios, color: color, size: 16),
        onTap: () {
          Navigator.pop(context);
          _processPayment(context, title);
        },
      ),
    );
  }

  void _processPayment(BuildContext context, String method) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(color: Color(0xFF4A90E2)),
            SizedBox(height: 16),
            Text('Processing payment via $method...'),
          ],
        ),
      ),
    );

    Timer(Duration(seconds: 3), () {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.white),
              SizedBox(width: 8),
              Text('Payment successful via $method!'),
            ],
          ),
          backgroundColor: Color(0xFF4CAF50),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          behavior: SnackBarBehavior.floating,
        ),
      );
    });
  }
}

// Library Screen
class Book {
  final String title;
  final String author;

  Book({required this.title, required this.author});
}

class BookListScreen extends StatelessWidget {
  final List<Book> books = [
    Book(title: 'Mathematics Grade 10', author: 'John Doe'),
    Book(title: 'Science Essentials', author: 'Jane Smith'),
    Book(title: 'English Grammar Guide', author: 'Emily Johnson'),
    Book(title: 'History of the World', author: 'Albert Stone'),
    Book(title: 'Introduction to ICT', author: 'Robert Allen'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      appBar: AppBar(
        title: Text('BookList'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: books.isEmpty
            ? Center(
                child: Text(
                  'No books available',
                  style: TextStyle(color: Colors.grey),
                ),
              )
            : ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 12),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.menu_book_rounded,
                            size: 36, color: Color(0xFF4A90E2)),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                book.title,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF2C3E50),
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Author name:  ${book.author}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF9E9E9E),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}

// Meeting Screen
class MeetingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      appBar: AppBar(
        title: Text('Virtual Meetings'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.video_call, size: 80, color: Color(0xFF4A90E2)),
            SizedBox(height: 16),
            Text(
              'Virtual Meetings',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2C3E50),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Video conferencing integration coming soon',
              style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// Attendance Detail Screen
class AttendanceDetailScreen extends StatelessWidget {
  final List<AttendanceRecord> attendanceRecords;

  AttendanceDetailScreen({required this.attendanceRecords});

  @override
  Widget build(BuildContext context) {
    final presentDays =
        attendanceRecords.where((r) => r.isPresent && !r.isHoliday).length;
    final absentDays =
        attendanceRecords.where((r) => !r.isPresent && !r.isHoliday).length;
    final holidays = attendanceRecords.where((r) => r.isHoliday).length;
    final totalDays = attendanceRecords.length;
    final attendancePercentage = totalDays > holidays
        ? ((presentDays / (totalDays - holidays)) * 100).round()
        : 0;

    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      appBar: AppBar(
        title: Text('Attendance Details'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Monthly Stats
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'This Month Summary',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2C3E50),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: attendancePercentage >= 90
                              ? Color(0xFF4CAF50)
                              : attendancePercentage >= 75
                                  ? Color(0xFFFF9800)
                                  : Color(0xFFFF5722),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          '$attendancePercentage%',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatItem(
                        'Present',
                        presentDays.toString(),
                        Color(0xFF4CAF50),
                      ),
                      _buildStatItem(
                        'Absent',
                        absentDays.toString(),
                        Color(0xFFFF5722),
                      ),
                      _buildStatItem(
                        'Holiday',
                        holidays.toString(),
                        Colors.orangeAccent,
                      ),
                      _buildStatItem(
                        'Total',
                        totalDays.toString(),
                        Colors.black.withOpacity(0.7),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),

            // Attendance List
            Text(
              'Recent Attendance',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2C3E50),
              ),
            ),
            SizedBox(height: 16),
            ...attendanceRecords
                .take(15)
                .map(
                  (record) => Container(
                    margin: EdgeInsets.only(bottom: 12),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: record.isHoliday
                                ? Colors.orangeAccent
                                : record.isPresent
                                    ? Color(0xFF4CAF50)
                                    : Color(0xFFFF5722),
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${record.date.day}/${record.date.month}/${record.date.year}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF2C3E50),
                                ),
                              ),
                              if (record.checkInTime.isNotEmpty)
                                Text(
                                  'Check In: ${record.checkInTime}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF9E9E9E),
                                  ),
                                ),
                              if (record.holidayReason != null)
                                Text(
                                  record.holidayReason!,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF9E9E9E),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: record.isHoliday
                                ? Colors.orangeAccent
                                : record.isPresent
                                    ? Color(0xFF4CAF50).withOpacity(0.1)
                                    : Color(0xFFFF5722).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            record.isHoliday
                                ? 'Holiday'
                                : record.isPresent
                                    ? 'Present'
                                    : 'Absent',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: record.isHoliday
                                  ? Colors.white
                                  : record.isPresent
                                      ? Color(0xFF4CAF50)
                                      : Color(0xFFFF5722),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(label, style: TextStyle(fontSize: 12, color: Color(0xFF9E9E9E))),
      ],
    );
  }
}

// Messages Screen
class MessagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      appBar: AppBar(
        title: Text('Messages'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.chat_bubble_outline, size: 80, color: Color(0xFF4A90E2)),
            SizedBox(height: 16),
            Text(
              'Messages',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2C3E50),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Chat feature coming soon',
              style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

// Profile Screen
class ProfileScreen extends StatelessWidget {
  final Child child;

  ProfileScreen({required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            // Profile Header
            Container(
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
              decoration: BoxDecoration(
                color: Color(0xFFF8F9FA),
                borderRadius: BorderRadius.circular(12),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.black.withOpacity(0.05),
                //     blurRadius: 10,
                //     offset: Offset(0, 2),
                //   ),
                // ],
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Color(0xFF4A90E2),
                    child: Text(
                      child.name.split(' ').map((e) => e[0]).join(''),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    child.name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2C3E50),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '${child.className} - Section ${child.section}',
                    style: TextStyle(color: Color(0xFF9E9E9E)),
                  ),
                  Text(
                    'Roll Number: ${child.rollNumber}',
                    style: TextStyle(color: Color(0xFF9E9E9E)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),

            // Profile Options
            _buildProfileOption('Edit Profile', Icons.edit),
            _buildProfileOption('Academic News', Icons.newspaper),
            _buildProfileOption('Settings', Icons.settings),
            _buildProfileOption('Help & Support', Icons.help),
            _buildProfileOption('About', Icons.info),
            _buildProfileOption('Logout', Icons.logout, isLogout: true),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(
    String title,
    IconData icon, {
    bool isLogout = false,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: isLogout ? Color(0xFFFF5722) : Color(0xFF4A90E2),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: isLogout ? Color(0xFFFF5722) : Color(0xFF2C3E50),
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Color(0xFF9E9E9E),
        ),
        onTap: () {},
      ),
    );
  }
}



////////////////////////////////////////////////////////

