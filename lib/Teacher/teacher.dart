import 'package:flutter/material.dart';

///// Teacher Main Page
class TeacherMainPage extends StatefulWidget {
  @override
  _TeacherMainPageState createState() => _TeacherMainPageState();
}

class _TeacherMainPageState extends State<TeacherMainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    TeacherHomePage(),
    HomeworkUploadPage(),
    ResultUploadPage(),
    TeacherChatPage(), // Renamed from 'teach chat'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: Colors.green[600],
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Homework'),
          BottomNavigationBarItem(icon: Icon(Icons.grade), label: 'Results'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: 'Chat'), // Updated label
        ],
      ),
    );
  }
}

// Teacher Home Page
class TeacherHomePage extends StatefulWidget {
  @override
  _TeacherHomePageState createState() => _TeacherHomePageState();
}

class _TeacherHomePageState extends State<TeacherHomePage> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> _searchResults = [];
  bool _isSearching = false;

  void _searchStudent() {
    setState(() {
      _isSearching = true;
      _searchResults = []; // Clear previous results
    });

    // Simulate search delay and results
    Future.delayed(Duration(seconds: 1), () {
      final query = _searchController.text.toLowerCase();
      final allStudents = [
        {'name': 'John Doe', 'roll': '15', 'class': 'Class 8', 'section': 'A'},
        {'name': 'Jane Smith', 'roll': '12', 'class': 'Class 9', 'section': 'B'},
        {'name': 'Mike Johnson', 'roll': '08', 'class': 'Class 8', 'section': 'A'},
        {'name': 'Sarah Wilson', 'roll': '22', 'class': 'Class 10', 'section': 'C'},
        {'name': 'David Brown', 'roll': '18', 'class': 'Class 9', 'section': 'A'},
      ];

      setState(() {
        _searchResults = allStudents.where((student) {
          return student['name']!.toLowerCase().contains(query) ||
              student['roll']!.toLowerCase().contains(query) ||
              student['class']!.toLowerCase().contains(query);
        }).toList();
        _isSearching = false;
      });
    });
  }

  void _showStudentDetails(Map<String, String> student) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Student Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: ${student['name']}', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              Text('Roll: ${student['roll']}'),
              Text('Class: ${student['class']}'),
              Text('Section: ${student['section']}'),
              SizedBox(height: 10),
              Text('Contact: +880 1234-567890'),
              Text('Guardian: Mr. ${student['name']?.split(' ')[1] ?? 'Guardian'}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teacher Dashboard', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green[600],
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.white, size: 30),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back!',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'Mr. Ahmed Khan - Mathematics Teacher',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 20),

            // Stats Cards
            Row(
              children: [
                Expanded(
                  child: _buildStatCard('Total Classes', Colors.blue, Icons.class_),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: _buildStatCard('Payment History',  Colors.green, Icons.payment_sharp,
                     onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PaymentStatusPage()),
                      );
                    },),
                ),
              ],
            ),

            SizedBox(height: 15),

            Row(
              children: [
                Expanded(
                  child: _buildStatCard('Routine ', Colors.orange, Icons.assignment,
                     onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ClassRoutinePage()),
                      );
                    },
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: _buildStatCard(
                    'Meetings',
                    Colors.purple,
                    Icons.meeting_room,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MeetingPage()),
                      );
                    },
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            // Today's Schedule
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.green[200]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.today, color: Colors.green[600]),
                      SizedBox(width: 10),
                      Text(
                        'Today\'s Schedule',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text('9:00 AM - Mathematics (Class 8)'),
                  Text('10:30 AM - Physics (Class 9)'),
                  Text('12:00 PM - Chemistry (Class 10)'),
                  Text('2:00 PM - Mathematics (Class 9)'),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Student Search Section
            Text(
              'Find Student',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      labelText: 'Search by name, roll, or class',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _isSearching ? null : _searchStudent,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[600],
                    padding: EdgeInsets.all(15),
                  ),
                  child: _isSearching
                      ? SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                        )
                      : Icon(Icons.search, color: Colors.white),
                ),
              ],
            ),

            SizedBox(height: 20),

            if (_searchResults.isNotEmpty) ...[
              Text(
                'Search Results (${_searchResults.length})',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: _searchResults.length,
                  itemBuilder: (context, index) {
                    final student = _searchResults[index];
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.green[600],
                          child: Text(
                            student['name']![0],
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                        title: Text(
                          student['name']!,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text('Roll: ${student['roll']} | ${student['class']} - Section ${student['section']}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.visibility, color: Colors.blue[600]),
                              onPressed: () {
                                _showStudentDetails(student);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.chat, color: Colors.green[600]),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => IndividualChatPage(studentName: student['name']!),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title,  Color color, IconData icon, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          children: [
            Icon(icon, size: 30, color: color),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// Homework Upload Page
class HomeworkUploadPage extends StatefulWidget {
  @override
  _HomeworkUploadPageState createState() => _HomeworkUploadPageState();
}

class _HomeworkUploadPageState extends State<HomeworkUploadPage> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  String _selectedClass = 'Class 8';
  String _selectedSubject = 'Mathematics';
  DateTime _dueDate = DateTime.now().add(Duration(days: 1));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Homework', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green[600],
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _selectedClass,
                decoration: InputDecoration(
                  labelText: 'Select Class',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
                items: ['Class 8', 'Class 9', 'Class 10'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedClass = newValue!;
                  });
                },
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _selectedSubject,
                decoration: InputDecoration(
                  labelText: 'Select Subject',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
                items: ['Mathematics', 'English', 'Physics', 'Chemistry', 'Biology'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedSubject = newValue!;
                  });
                },
              ),
              SizedBox(height: 20),
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Homework Title',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _descriptionController,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: 'Detailed Description',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(height: 20),
              // Due Date Picker
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Due Date: ${_dueDate.day}/${_dueDate.month}/${_dueDate.year}'),
                    ElevatedButton(
                      onPressed: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: _dueDate,
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(Duration(days: 365)),
                        );
                        if (picked != null && picked != _dueDate) {
                          setState(() {
                            _dueDate = picked;
                          });
                        }
                      },
                      child: Text('Change'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (_titleController.text.isNotEmpty && _descriptionController.text.isNotEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Homework uploaded successfully!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                      _titleController.clear();
                      _descriptionController.clear();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please fill all fields'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[600],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Text('Upload Homework', style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
              SizedBox(height: 20),
              // Recent Homework List
              Text(
                'Recent Homework',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _buildRecentHomeworkCard('Mathematics', 'Algebra Problems', 'Class 8', 'Due: Tomorrow'),
              SizedBox(height: 10),
              _buildRecentHomeworkCard('Physics', 'Motion and Force', 'Class 9', 'Due: 2 days'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecentHomeworkCard(String subject, String title, String className, String dueDate) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blue[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                subject,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                className,
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            ],
          ),
          SizedBox(height: 5),
          Text(title),
          SizedBox(height: 5),
          Text(
            dueDate,
            style: TextStyle(fontSize: 12, color: Colors.orange[600]),
          ),
        ],
      ),
    );
  }
}

// Class Routine Page
class ClassRoutinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Class Routine', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[600],
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildRoutineCard('Sunday', [
                {'time': '9:00 AM', 'subject': 'Mathematics', 'class': 'Class 8'},
                {'time': '10:30 AM', 'subject': 'English', 'class': 'Class 9'},
                {'time': '12:00 PM', 'subject': 'Physics', 'class': 'Class 10'},
                {'time': '2:00 PM', 'subject': 'Chemistry', 'class': 'Class 9'},
              ]),
              SizedBox(height: 15),
              _buildRoutineCard('Monday', [
                {'time': '9:00 AM', 'subject': 'Physics', 'class': 'Class 9'},
                {'time': '10:30 AM', 'subject': 'Chemistry', 'class': 'Class 10'},
                {'time': '12:00 PM', 'subject': 'Mathematics', 'class': 'Class 8'},
                {'time': '2:00 PM', 'subject': 'Biology', 'class': 'Class 9'},
              ]),
              SizedBox(height: 15),
              _buildRoutineCard('Tuesday', [
                {'time': '9:00 AM', 'subject': 'History', 'class': 'Class 8'},
                {'time': '10:30 AM', 'subject': 'Geography', 'class': 'Class 9'},
                {'time': '12:00 PM', 'subject': 'Mathematics', 'class': 'Class 10'},
                {'time': '2:00 PM', 'subject': 'English', 'class': 'Class 8'},
              ]),
              SizedBox(height: 15),
              _buildRoutineCard('Wednesday', [
                {'time': '9:00 AM', 'subject': 'Mathematics', 'class': 'Class 9'},
                {'time': '10:30 AM', 'subject': 'Physics', 'class': 'Class 8'},
                {'time': '12:00 PM', 'subject': 'Chemistry', 'class': 'Class 10'},
                {'time': '2:00 PM', 'subject': 'Biology', 'class': 'Class 8'},
              ]),
              SizedBox(height: 15),
              _buildRoutineCard('Thursday', [
                {'time': '9:00 AM', 'subject': 'English', 'class': 'Class 10'},
                {'time': '10:30 AM', 'subject': 'Mathematics', 'class': 'Class 8'},
                {'time': '12:00 PM', 'subject': 'Physics', 'class': 'Class 9'},
                {'time': '2:00 PM', 'subject': 'Chemistry', 'class': 'Class 8'},
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoutineCard(String day, List<Map<String, String>> classes) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blue[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            day,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue[800]),
          ),
          SizedBox(height: 10),
          ...classes.map((cls) => Padding(
                padding: EdgeInsets.symmetric(vertical: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${cls['time']} - ${cls['subject']}'),
                    Text(
                      cls['class']!,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )).toList(),
        ],
      ),
    );
  }
}

// Result Upload Page
class ResultUploadPage extends StatefulWidget {
  @override
  _ResultUploadPageState createState() => _ResultUploadPageState();
}

class _ResultUploadPageState extends State<ResultUploadPage> {
  final _studentNameController = TextEditingController();
  final _rollController = TextEditingController();
  final _marksController = TextEditingController();
  String _selectedSubject = 'Mathematics';
  String _selectedClass = 'Class 8';
  String _selectedExamType = 'Class Test';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Results', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green[600],
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _selectedClass,
                decoration: InputDecoration(
                  labelText: 'Select Class',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
                items: ['Class 8', 'Class 9', 'Class 10'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedClass = newValue!;
                  });
                },
              ),
              SizedBox(height: 20),
              TextField(
                controller: _studentNameController,
                decoration: InputDecoration(
                  labelText: 'Student Name',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _rollController,
                decoration: InputDecoration(
                  labelText: 'Roll Number',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _selectedSubject,
                decoration: InputDecoration(
                  labelText: 'Subject',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
                items: ['Mathematics', 'English', 'Physics', 'Chemistry', 'Biology'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedSubject = newValue!;
                  });
                },
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _selectedExamType,
                decoration: InputDecoration(
                  labelText: 'Exam Type',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
                items: ['Class Test', 'Mid Term', 'Final Exam', 'Assignment'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedExamType = newValue!;
                  });
                },
              ),
              SizedBox(height: 20),
              TextField(
                controller: _marksController,
                decoration: InputDecoration(
                  labelText: 'Marks Obtained',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (_studentNameController.text.isNotEmpty &&
                        _rollController.text.isNotEmpty &&
                        _marksController.text.isNotEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Result uploaded successfully!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                      _studentNameController.clear();
                      _rollController.clear();
                      _marksController.clear();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please fill all fields'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[600],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Text('Upload Result', style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
              SizedBox(height: 20),
              // Recent Results
              Text(
                'Recent Results',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _buildRecentResultCard('John Doe', '15', 'Mathematics', '85', 'A'),
              SizedBox(height: 10),
              _buildRecentResultCard('Jane Smith', '12', 'Physics', '92', 'A+'),
              SizedBox(height: 10),
              _buildRecentResultCard('Mike Johnson', '08', 'Chemistry', '78', 'A-'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecentResultCard(String name, String roll, String subject, String marks, String grade) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.green[200]!),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$name (Roll: $roll)',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Text(subject),
            ],
          ),
          Row(
            children: [
              Text(
                marks,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green[600],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  grade,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Result Page (for students - kept for completeness, though not directly used in teacher flow)
class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[600],
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // Overall Performance
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.blue[200]!),
              ),
              child: Column(
                children: [
                  Text(
                    'Overall Performance',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'A-',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[600],
                    ),
                  ),
                  Text('Average Grade'),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Subject-wise Results',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Expanded(
              child: ListView(
                children: [
                  _buildResultCard('Mathematics', '85', 'A', Colors.green),
                  SizedBox(height: 10),
                  _buildResultCard('English', '90', 'A+', Colors.green),
                  SizedBox(height: 10),
                  _buildResultCard('Physics', '78', 'A-', Colors.blue),
                  SizedBox(height: 10),
                  _buildResultCard('Chemistry', '82', 'A', Colors.green),
                  SizedBox(height: 10),
                  _buildResultCard('Biology', '88', 'A', Colors.green),
                  SizedBox(height: 10),
                  _buildResultCard('History', '75', 'B+', Colors.orange),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultCard(String subject, String marks, String grade, Color color) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subject,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text('Class Test - March 2024'),
            ],
          ),
          Row(
            children: [
              Text(
                marks,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  grade,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Meeting Page
class MeetingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meetings', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green[600],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Upcoming Meetings',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Expanded(
              child: ListView(
                children: [
                  _buildMeetingCard(
                    'Teachers Meeting',
                    'Tomorrow at 10:00 AM',
                    'Principal\'s Office',
                    'Discuss curriculum updates and student progress',
                    true,
                    Colors.red,
                  ),
                  SizedBox(height: 15),
                  _buildMeetingCard(
                    'Parent-Teacher Meeting',
                    '15th March at 3:00 PM',
                    'School Hall',
                    'Individual meetings with parents about student performance',
                    false,
                    Colors.blue,
                  ),
                  SizedBox(height: 15),
                  _buildMeetingCard(
                    'Subject Department Meeting',
                    '20th March at 9:00 AM',
                    'Science Building',
                    'Mathematics and Science teachers coordination meeting',
                    false,
                    Colors.green,
                  ),
                  SizedBox(height: 15),
                  _buildMeetingCard(
                    'Exam Committee Meeting',
                    '25th March at 11:00 AM',
                    'Conference Room',
                    'Final exam preparation and schedule discussion',
                    false,
                    Colors.orange,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMeetingCard(String title, String time, String location, String description, bool isUrgent, Color color) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              if (isUrgent) ...[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'URGENT',
                    style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.access_time, size: 16, color: Colors.grey[600]),
              SizedBox(width: 5),
              Text(time, style: TextStyle(color: Colors.grey[600])),
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
              SizedBox(width: 5),
              Text(location, style: TextStyle(color: Colors.grey[600])),
            ],
          ),
          SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(fontSize: 13),
          ),
        ],
      ),
    );
  }
}

// Payment Status Page
class PaymentStatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Status', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green[600],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // Summary Card
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.blue[200]!),
              ),
              child: Column(
                children: [
                  Text(
                    'Payment Summary',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            '৳45,000',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green[600]),
                          ),
                          Text('Paid', style: TextStyle(color: Colors.green[600])),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '৳15,000',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red[600]),
                          ),
                          Text('Pending', style: TextStyle(color: Colors.red[600])),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Monthly Payment Status',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Expanded(
              child: ListView(
                children: [
                  _buildPaymentCard('March 2024', true, '৳15,000', 'Paid on 5th March'),
                  SizedBox(height: 10),
                  _buildPaymentCard('February 2024', true, '৳15,000', 'Paid on 3rd February'),
                  SizedBox(height: 10),
                  _buildPaymentCard('January 2024', true, '৳15,000', 'Paid on 8th January'),
                  SizedBox(height: 10),
                  _buildPaymentCard('December 2023', false, '৳15,000', 'Due: 5th December'),
                  SizedBox(height: 10),
                  _buildPaymentCard('November 2023', true, '৳15,000', 'Paid on 2nd November'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentCard(String month, bool isPaid, String amount, String details) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: isPaid ? Colors.green[50] : Colors.red[50],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: isPaid ? Colors.green[200]! : Colors.red[200]!),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                month,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(amount, style: TextStyle(fontSize: 14)),
              Text(
                details,
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: isPaid ? Colors.green[600] : Colors.red[600],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              isPaid ? 'PAID' : 'PENDING',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

// Individual Chat Page
class IndividualChatPage extends StatefulWidget {
  final String studentName;

  IndividualChatPage({required this.studentName});

  @override
  _IndividualChatPageState createState() => _IndividualChatPageState();
}

class _IndividualChatPageState extends State<IndividualChatPage> {
  final _messageController = TextEditingController();
  List<Map<String, dynamic>> _messages = [];

  @override
  void initState() {
    super.initState();
    // Load previous messages
    _messages = [
      {'sender': 'Guardian', 'message': 'How is my child performing in class?', 'time': '10:30 AM', 'isMe': false},
      {'sender': 'You', 'message': 'Your child is doing very well. Very attentive in class.', 'time': '10:35 AM', 'isMe': true},
      {'sender': 'Guardian', 'message': 'Thank you for the update. Any homework for today?', 'time': '10:40 AM', 'isMe': false},
    ];
  }

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      setState(() {
        _messages.add({
          'sender': 'You',
          'message': _messageController.text.trim(),
          'time': '${DateTime.now().hour}:${DateTime.now().minute.toString().padLeft(2, '0')}',
          'isMe': true,
        });
      });
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with ${widget.studentName}\'s Guardian', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green[600],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(20),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return _buildChatBubble(
                  message['sender'],
                  message['message'],
                  message['time'],
                  message['isMe'],
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              border: Border(top: BorderSide(color: Colors.grey[300]!)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                SizedBox(width: 10),
                CircleAvatar(
                  backgroundColor: Colors.green[600],
                  child: IconButton(
                    icon: Icon(Icons.send, color: Colors.white),
                    onPressed: _sendMessage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatBubble(String sender, String message, String time, bool isMe) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.all(12),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
        decoration: BoxDecoration(
          color: isMe ? Colors.green[600] : Colors.grey[300],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message,
              style: TextStyle(
                color: isMe ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(height: 5),
            Text(
              time,
              style: TextStyle(
                fontSize: 10,
                color: isMe ? Colors.white70 : Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Teacher Chat Page
class TeacherChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with Guardians', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green[600],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text(
            'Recent Conversations',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15),
          _buildChatListItem(
            'Mr. John Doe Sr.',
            'John Doe\'s Father',
            'How is my son\'s performance in mathematics?',
            '2 min ago',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => IndividualChatPage(studentName: 'John Doe'),
                ),
              );
            },
          ),
          SizedBox(height: 10),
          _buildChatListItem(
            'Mrs. Jane Smith',
            'Jane Smith\'s Mother',
            'Thank you for the homework update',
            '10 min ago',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => IndividualChatPage(studentName: 'Jane Smith'),
                ),
              );
            },
          ),
          SizedBox(height: 10),
          _buildChatListItem(
            'Mr. Mike Johnson',
            'Mike Johnson\'s Father',
            'When is the parent-teacher meeting?',
            '1 hour ago',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => IndividualChatPage(studentName: 'Mike Johnson'),
                ),
              );
            },
          ),
          SizedBox(height: 10),
          _buildChatListItem(
            'Mrs. Sarah Wilson',
            'Sarah Wilson\'s Mother',
            'My daughter needs extra help in physics',
            '2 hours ago',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => IndividualChatPage(studentName: 'Sarah Wilson'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildChatListItem(String name, String relation, String lastMessage, String time, VoidCallback onTap) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.green[600],
          child: Text(
            name[0],
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(
          name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              relation,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
            SizedBox(height: 2),
            Text(lastMessage),
          ],
        ),
        trailing: Text(
          time,
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        onTap: onTap,
      ),
    );
  }
}

// New Profile Page
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green[600],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.green[600],
              child: Icon(Icons.person, size: 80, color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              'Mr. Ahmed Khan',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'Mathematics Teacher',
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
            SizedBox(height: 20),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 10),
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    _buildProfileInfoRow(Icons.email, 'Email', 'ahmed.khan@school.com'),
                    Divider(),
                    _buildProfileInfoRow(Icons.phone, 'Phone', '+880 1234-567890'),
                    Divider(),
                    _buildProfileInfoRow(Icons.school, 'Department', 'Science & Mathematics'),
                    Divider(),
                    _buildProfileInfoRow(Icons.calendar_today, 'Joined', 'January 15, 2010'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // Implement edit profile functionality
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Edit Profile functionality coming soon!')),
                );
              },
              icon: Icon(Icons.edit, color: Colors.white),
              label: Text('Edit Profile', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[600],
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.green[600], size: 24),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
              Text(
                value,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}