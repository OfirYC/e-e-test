import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class CustomTimeLineTile extends StatelessWidget {
  // const CustomTimeLineTile({Key? key, required this.title,  required this.subTitle, required this.time, this.isFirst = false,this.isLast = false}) : super(key: key);
  const CustomTimeLineTile({Key? key, required this.docId, this.isFirst = false,this.isLast = false}) : super(key: key);
  final docId;
  // final title;
  // final subTitle;
  // final time;
  final isFirst;
  final isLast;
  @override
  Widget build(BuildContext context) {
    CollectionReference activities = FirebaseFirestore.instance.collection("activities");
    return FutureBuilder<DocumentSnapshot>(
      future: activities.doc(docId).get(),
      builder: ((context, snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          return TimelineTile(
            alignment: TimelineAlign.start,
            endChild: Container(
              height: 60,
              // color: Colors.black,
              child: ListTile(
                title: Text('${data['name']}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
                subtitle:
                Row(
                  children: [
                    Container(
                      width: 28,
                      height: 28,
                      child: Card(
                        elevation: 2,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image(
                          image: AssetImage(
                              '${data['icon']}' == 'Education' ? 'assets/images/book.png' : 'assets/images/music.png'
                          ),
                        ),
                      ),
                    ),
                    Text('${data['type']}',style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: Color(0xff1a1a1a).withOpacity(0.5)),),
                  ],
                ),
                trailing: Text(
                  '${data['time']}',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16
                  ),
                ),
              ),

            ),
            indicatorStyle: IndicatorStyle(
              indicator: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: Color(0xffE5E5E5),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black, width: 6),
                ),
              ),
            ),
            beforeLineStyle: LineStyle(thickness: 2),
            isFirst: isFirst,
            isLast: isLast,
          );
        }
        return Text('loading');
      }),
    );
  }
}
