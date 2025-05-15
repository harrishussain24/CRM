import 'package:crm/dashboard/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Freelance CRM',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF3CB0FF),
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.person,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              searchBar(
                hintText: 'Search clients, projects…',
                prefixIcon: Icons.search,
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear, color: Colors.grey.shade600),
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Performance Over Time',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StatsCard(
                    icon: Icons.people,
                    title: 'Total Clients',
                    value: '128',
                    percentageChange: 12.4,
                    iconBgColor: Colors.blue.shade100,
                  ),
                  StatsCard(
                    icon: Icons.work,
                    title: 'Active Projects',
                    value: '9',
                    percentageChange: -8.5,
                    iconBgColor: Colors.orange.shade100,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StatsCard(
                    icon: Icons.attach_money,
                    title: 'Revenue',
                    value: '\$5,420',
                    percentageChange: 3.2,
                    iconBgColor: Colors.green.shade100,
                  ),
                  StatsCard(
                    icon: Icons.schedule,
                    title: 'Upcoming Tasks',
                    value: '5',
                    percentageChange: 7.8,
                    iconBgColor: Colors.purple.shade100,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: SizedBox(height: 220, child: PerformanceBarChart()),
              ),
              const SizedBox(height: 20),
              Text(
                'Upcoming Tasks',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TaskCard(
                title: 'Submit UI design',
                dueDate: 'Due: May 16, 2025 – 10:00 AM',
                project: 'Client: DesignHub',
                priority: 'High',
              ),
              TaskCard(
                title: 'Fix portfolio bug',
                dueDate: 'Due: May 18, 2025 – 4:00 PM',
                project: 'Client: Self',
                priority: 'Medium',
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle new task / add client / action here
        },
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}

class StatsCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final double? percentageChange;
  final Color? iconBgColor;

  const StatsCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    this.percentageChange,
    this.iconBgColor,
  });

  @override
  Widget build(BuildContext context) {
    final bool isPositive = (percentageChange ?? 0) >= 0;

    return Container(
      width: MediaQuery.sizeOf(context).width * 0.44,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon with background circle
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconBgColor ?? Colors.blue.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 28, color: Colors.blue.shade700),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade700,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 3),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          if (percentageChange != null) ...[
            SizedBox(height: 5),
            Row(
              children: [
                Icon(
                  isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                  size: 16,
                  color: isPositive ? Colors.green : Colors.red,
                ),
                SizedBox(width: 4),
                Text(
                  '${percentageChange!.abs().toStringAsFixed(1)}%',
                  style: TextStyle(
                    color: isPositive ? Colors.green : Colors.red,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ]
        ],
      ),
    );
  }
}

class PerformanceBarChart extends StatelessWidget {
  const PerformanceBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: 20,
        barTouchData: BarTouchData(enabled: false),
        titlesData: FlTitlesData(
          show: true,
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              getTitlesWidget: (value, meta) {
                return Text(value.toInt().toString());
              },
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (double value, TitleMeta meta) {
                const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];
                return Text(months[value.toInt()]);
              },
            ),
          ),
        ),
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        barGroups: [
          BarChartGroupData(x: 0, barRods: [
            BarChartRodData(toY: 12, color: Colors.blue, width: 16)
          ]),
          BarChartGroupData(x: 1, barRods: [
            BarChartRodData(toY: 17, color: Colors.blue, width: 16)
          ]),
          BarChartGroupData(x: 2, barRods: [
            BarChartRodData(toY: 9, color: Colors.blue, width: 16)
          ]),
          BarChartGroupData(x: 3, barRods: [
            BarChartRodData(toY: 14, color: Colors.blue, width: 16)
          ]),
          BarChartGroupData(x: 4, barRods: [
            BarChartRodData(toY: 7, color: Colors.blue, width: 16)
          ]),
          BarChartGroupData(x: 5, barRods: [
            BarChartRodData(toY: 15, color: Colors.blue, width: 16)
          ]),
        ],
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  final String title;
  final String dueDate;
  final String project;
  final String priority;
  final bool isCompleted;

  const TaskCard({
    super.key,
    required this.title,
    required this.dueDate,
    required this.project,
    required this.priority,
    this.isCompleted = false,
  });

  Color getPriorityColor(String level) {
    switch (level.toLowerCase()) {
      case 'high':
        return Colors.redAccent;
      case 'medium':
        return Colors.orangeAccent;
      case 'low':
      default:
        return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(Icons.access_time, color: getPriorityColor(priority)),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(dueDate),
            Text(project, style: TextStyle(color: Colors.grey)),
          ],
        ),
        trailing: isCompleted
            ? Icon(Icons.check_circle, color: Colors.green)
            : Icon(Icons.radio_button_unchecked, color: Colors.grey),
      ),
    );
  }
}
