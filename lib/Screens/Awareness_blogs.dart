import 'package:flutter/material.dart';
import 'package:poly_forensic/Screens/Awareness_opening.dart';

class AwarenessBlogs extends StatefulWidget {
  const AwarenessBlogs({Key? key}) : super(key: key);

  @override
  State<AwarenessBlogs> createState() => _AwarenessBlogsState();
}

class _AwarenessBlogsState extends State<AwarenessBlogs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Awareness Blogs"),
        centerTitle: true,
        
      ),
      body: ListView.builder(
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: (){
                showDialog(context: context,
                    builder: (context)=>AwarenessOpening(
                      // image: data!.articles[index].urlToImage == null ?
                      // data!.articles[2].urlToImage! : data!.articles[index].urlToImage!  ,
                      // title: data!.articles[index].title ==null?
                      // data!.articles[2].title! : data!.articles[index].title! ,
                      // description: data!.articles[index].description ==null?
                      // data!.articles[2].description! : data!.articles[index].description! ,
                      // source: data!.articles[index].source.name ==null?
                      // data!.articles[2].source.name!  : data!.articles[index].source.name! ,
                      // author:data!.articles[index].author==null?
                      // data!.articles[2].author!: data!.articles[index].author!  ,
                      // publishedAt: data!.articles[index].publishedAt ==null?
                      // data!.articles[2].publishedAt!  : data!.articles[index].publishedAt! ,

                    ));
              },
              child: Container(

                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(
                     color: Colors.white
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xffD660CA).withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: ListTile(
                    leading: Image(image: NetworkImage("https://www.shutterstock.com/image-photo/stethoscope-on-note-book-womens-260nw-572706325.jpg"),),
                    // trailing:  Column(
                    //   children: [
                    //     Text(
                    //       "GFG",
                    //       style: TextStyle(color: Colors.green, fontSize: 15),
                    //     ),
                    //   ],
                    // ),
                    title: Column(
                      children: [
                        Text("Blog 1",style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),),
                        Text("This blog brings knowledge on the topic of PCOS a common "
                            "disorder found in  women of reproductive age"),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            Icon(Icons.star,color: Colors.yellow,),
                          Text("4.5"),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                            onPressed: (){}, child: Text("Read More"),

                          ),


                        ]),
                      ],
                    )),
              ),
            );
          }),
    );
  }
}
