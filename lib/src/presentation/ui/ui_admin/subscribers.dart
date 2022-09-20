import 'package:flutter/material.dart';
import 'package:flutter_app1111/src/data/models/all_users.dart';
import 'package:flutter_app1111/src/presentation/ui/ui_admin/add_points_to_user.dart';
class Subscriber extends StatelessWidget {
  final List<User>? users;

  const Subscriber({Key? key,required this.users}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Participants',
        ),
      ),
      body: ListView.builder(
        itemCount:users!.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => AddPointsToUser(user: users![index],)));
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  //  color: Colors.grey[200],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        20.0,
                                      ),
                                      border: Border.all(
                                        color: Colors.grey,
                                      )),
                                  child: Icon(Icons.person)),
                              SizedBox(
                                width: 20.0,
                              ),
                              Text(
                                '${users![index].firstName} ${users![index].lastName}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            '${users![index].email}',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
