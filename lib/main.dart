import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

const Color primaryColor = Color(0xFFFFFFFF);
const Color secondaryColor = Color(0xFF1565C0);
const Color accentColor = Color(0xFF424242);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MCA Department App',
      theme: ThemeData(
        primaryColor: primaryColor,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: primaryColor,
        appBarTheme: AppBarTheme(
          backgroundColor: primaryColor,
          iconTheme: IconThemeData(color: secondaryColor),
          titleTextStyle:
              TextStyle(color: secondaryColor, fontWeight: FontWeight.bold),
        ),
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: secondaryColor),
        title: Row(
          children: [
            Image.asset(
              'assets/images/LogoSPIT.png',
              height: 40,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.school, color: secondaryColor, size: 40);
              },
            ),
            SizedBox(width: 12),
            Text(
              'SPIT MCA',
              style: TextStyle(
                color: secondaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: secondaryColor,
                image: DecorationImage(
                  image: NetworkImage('assets/images/LogoSPIT.png'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    secondaryColor.withOpacity(0.7),
                    BlendMode.srcOver,
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SPIT MCA',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Excellence in Education',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.people, color: secondaryColor),
              title: Text('Faculty', style: TextStyle(color: accentColor)),
              onTap: () {
                _tabController.animateTo(0);
                Navigator.pop(context);
              },
            ),
            Divider(height: 1),
            ListTile(
              leading: Icon(Icons.visibility, color: Colors.blue),
              title: Text('Vision & Mission'),
              onTap: () {
                _tabController.animateTo(1);
                Navigator.pop(context);
              },
            ),
            Divider(height: 1),
            ListTile(
              leading: Icon(Icons.notifications, color: Colors.blue),
              title: Text('Notifications'),
              onTap: () {
                _tabController.animateTo(2);
                Navigator.pop(context);
              },
            ),
            Divider(height: 1),
            ListTile(
              leading: Icon(Icons.language, color: Colors.blue),
              title: Text('Website'),
              onTap: () {
                _tabController.animateTo(3);
                Navigator.pop(context);
              },
            ),
            Divider(height: 1),
            ListTile(
              leading: Icon(Icons.feedback, color: Colors.blue),
              title: Text('Feedback'),
              onTap: () {
                _tabController.animateTo(4);
                Navigator.pop(context);
              },
            ),
            Divider(height: 1),
            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Sardar Patel Institute of Technology',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 4),
                  Text(
                    '© 2025 SPIT MCA',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          FacultyTab(),
          VisionMissionTab(),
          NotificationsTab(),
          WebsiteTab(),
          FeedbackTab(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: primaryColor,
          boxShadow: [
            BoxShadow(
              color: accentColor.withOpacity(0.1),
              blurRadius: 4,
            ),
          ],
        ),
        child: TabBar(
          controller: _tabController,
          labelColor: secondaryColor,
          unselectedLabelColor: accentColor.withOpacity(0.5),
          indicatorColor: secondaryColor,
          indicatorWeight: 3,
          labelStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 12,
          ),
          tabs: [
            Tab(
              icon: Icon(Icons.people),
              text: 'Faculty',
            ),
            Tab(
              icon: Icon(Icons.visibility),
              text: 'Vision',
            ),
            Tab(
              icon: Icon(Icons.notifications),
              text: 'Notices',
            ),
            Tab(
              icon: Icon(Icons.language),
              text: 'Website',
            ),
            Tab(
              icon: Icon(Icons.feedback),
              text: 'Feedback',
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

class FacultyTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        ExpansionTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/Untitled.jpg'),
            radius: 25,
            backgroundColor: Colors.grey[200],
            onBackgroundImageError: (_, __) => Icon(Icons.person),
          ),
          title: Text('Prof. Dr. Dhananjay Kalbande',
              style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text('Professor & HOD'),
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Qualification: Ph.D. (Computer Engineering)'),
                  SizedBox(height: 8),
                  Text('Experience: 24+ years'),
                  SizedBox(height: 8),
                  Text(
                      'Research Areas: Machine Learning, IoT, Cloud Computing'),
                  SizedBox(height: 8),
                  Text('Email: drkalbande@spit.ac.in'),
                ],
              ),
            ),
          ],
        ),
        ExpansionTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/PR-e1670491866552.jpg'),
            radius: 25,
            backgroundColor: Colors.grey[200],
            onBackgroundImageError: (_, __) => Icon(Icons.person),
          ),
          title: Text('Prof. Dr. Pooja Raundale',
              style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text('Professor & Head'),
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Qualification: Ph.D. (Computer Science)'),
                  SizedBox(height: 8),
                  Text('Experience: 15+ years'),
                  SizedBox(height: 8),
                  Text('Research Areas: Data Mining, Machine Learning'),
                  SizedBox(height: 8),
                  Text('Email: pooja.raundale@spit.ac.in'),
                ],
              ),
            ),
          ],
        ),
        ExpansionTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/aarti.png'),
            radius: 25,
            backgroundColor: Colors.grey[200],
            onBackgroundImageError: (_, __) => Icon(Icons.person),
          ),
          title: Text('Prof. Dr. Aarti Karande',
              style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text('Assistant Professor'),
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Qualification: Ph.D. (Computer Engineering)'),
                  SizedBox(height: 8),
                  Text('Experience: 12+ years'),
                  SizedBox(height: 8),
                  Text('Research Areas: Image Processing, Pattern Recognition'),
                  SizedBox(height: 8),
                  Text('Email: aartimkarande@spit.ac.in'),
                ],
              ),
            ),
          ],
        ),
        ExpansionTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/HK.png'),
            radius: 25,
            backgroundColor: Colors.grey[200],
            onBackgroundImageError: (_, __) => Icon(Icons.person),
          ),
          title: Text('Prof. Harshil Kanakia',
              style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text('Assistant Professor'),
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Qualification: M.Tech (Computer Engineering)'),
                  SizedBox(height: 8),
                  Text('Experience: 8+ years'),
                  SizedBox(height: 8),
                  Text('Research Areas: Web Technologies, Cloud Computing'),
                  SizedBox(height: 8),
                  Text('Email: harshil.kanakia@spit.ac.in'),
                ],
              ),
            ),
          ],
        ),
        ExpansionTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/NM.jpg'),
            radius: 25,
            backgroundColor: Colors.grey[200],
            onBackgroundImageError: (_, __) => Icon(Icons.person),
          ),
          title: Text('Prof. Nikhita Mangaonkar',
              style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text('Assistant Professor'),
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Qualification: M.E. (Computer Engineering)'),
                  SizedBox(height: 8),
                  Text('Experience: 5+ years'),
                  SizedBox(height: 8),
                  Text('Research Areas: Machine Learning, Deep Learning'),
                  SizedBox(height: 8),
                  Text('Email: nikhita.mangaonkar@spit.ac.in'),
                ],
              ),
            ),
          ],
        ),
        ExpansionTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/SK-150x150.png'),
            radius: 25,
            backgroundColor: Colors.grey[200],
            onBackgroundImageError: (_, __) => Icon(Icons.person),
          ),
          title: Text('Prof. Sakina Shaikh',
              style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text('Assistant Professor'),
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Qualification: M.E. (Computer Engineering)'),
                  SizedBox(height: 8),
                  Text('Experience: 4+ years'),
                  SizedBox(height: 8),
                  Text('Research Areas: Data Science, Machine Learning'),
                  SizedBox(height: 8),
                  Text('Email: sakina.shaikh@spit.ac.in'),
                ],
              ),
            ),
          ],
        ),
        //      ExpansionTile(
        // leading: CircleAvatar(
        //   backgroundImage: AssetImage('assets/images/Untitled.jpg'),
        //   radius: 25,
        //   backgroundColor: Colors.grey[200],
        //   onBackgroundImageError: (_, __) => Icon(Icons.person),
        // ),
        //         title: Text('Prof. Pallavi Thakur',
        //             style: TextStyle(fontWeight: FontWeight.bold)),
        //         subtitle: Text('Assistant Professor'),
        //         children: [
        //           Padding(
        //             padding: EdgeInsets.all(16),
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 Text('Qualification: M.E. (Computer Engineering)'),
        //                 SizedBox(height: 8),
        //                 Text('Experience: 3+ years'),
        //                 SizedBox(height: 8),
        //                 Text('Research Areas: AI, Machine Learning'),
        //                 SizedBox(height: 8),
        //                 Text('Email: pallavi.thakur@spit.ac.in'),
        //               ],
        //             ),
        //           ),
        //         ],
        //       ),
      ],
    );
  }
}

class VisionMissionTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        _buildCard(
          title: 'Vision',
          icon: Icons.visibility,
          content:
              'To create technically competent professionals in the field of Computer Applications '
              'and prepare them for contributing to the needs of business and society.',
        ),
        _buildCard(
          title: 'Mission',
          icon: Icons.flag, // Use a suitable mission icon
          content: '''
1. To impart quality education in the field of Computer Applications.
2. To create opportunities for learning emerging technologies.
3. To develop analytical and problem-solving capabilities.
4. To inculcate professional and ethical values.
5. To prepare students for higher education and research.
''',
        ),
        _buildCard(
          title: 'Program Educational Objectives (PEOs)',
          icon: Icons.school,
          content: '''
PEO1: To prepare students with strong foundation in Computer Applications.
PEO2: To develop skills to analyze, design, and implement software solutions.
PEO3: To inculcate professional and ethical attitude, communication skills, teamwork, and multidisciplinary approach.
PEO4: To create desire for higher studies, research, and lifelong learning.
''',
        ),
      ],
    );
  }

  Widget _buildCard(
      {required String title,
      required IconData icon,
      required String content}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        leading: Icon(icon, color: Colors.blueAccent),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              content,
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Notifications',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade900,
            ),
          ),
          SizedBox(height: 16),
          NotificationText('Parents Teacher Meeting, November 2022'),
          NotificationText('Parents Teacher Meeting, April 2023'),
          NotificationText('Parents Teacher Meeting Notice, 2023'),
          NotificationText('Parents Teacher Meeting, November 2023'),
        ],
      ),
    );
  }
}

class NotificationText extends StatelessWidget {
  final String text;
  NotificationText(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: Colors.brown.shade700,
        ),
      ),
    );
  }
}

class WebsiteTab extends StatefulWidget {
  @override
  _WebsiteTabState createState() => _WebsiteTabState();
}

class _WebsiteTabState extends State<WebsiteTab> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://www.spit.ac.in/'));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WebViewWidget(
        controller: _controller,
      ),
    );
  }
}

class FeedbackTab extends StatefulWidget {
  @override
  _FeedbackTabState createState() => _FeedbackTabState();
}

class _FeedbackTabState extends State<FeedbackTab> {
  double _rating = 0;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Rating (0-5)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Slider(
              value: _rating,
              max: 5,
              divisions: 5,
              label: _rating.toString(),
              onChanged: (value) => setState(() => _rating = value),
            ),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
              validator: (value) =>
                  value?.isEmpty ?? true ? 'Please enter your name' : null,
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              validator: (value) =>
                  value?.isEmpty ?? true ? 'Please enter your email' : null,
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _feedbackController,
              decoration: InputDecoration(labelText: 'Your Feedback'),
              maxLines: 3,
              validator: (value) =>
                  value?.isEmpty ?? true ? 'Please enter feedback' : null,
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('Feedback submitted successfully!')),
                    );
                    _nameController.clear();
                    _emailController.clear();
                    _feedbackController.clear();
                    setState(() => _rating = 0);
                  }
                },
                child: Text('Submit Feedback'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _feedbackController.dispose();
    super.dispose();
  }
}
