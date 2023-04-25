import 'package:barcode_widget/barcode_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:printsecure/screens/constant.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ViewShareDocuments extends StatefulWidget {
  final FileModel file;
  final Duration duration;
  final bool isShared;

  const ViewShareDocuments(
      {super.key,
      required this.file,
      required this.isShared,
      required this.duration});

  @override
  State<ViewShareDocuments> createState() => _ViewShareDocumentsState();
}

class _ViewShareDocumentsState extends State<ViewShareDocuments> {
  bool isSharing = false;
  @override
  void initState() {
    super.initState();
    iniitAsync();
  }

  iniitAsync() async {}

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    Map<String, dynamic> userMap = {
      'name': user!.displayName,
      'email': user.email,
      'profile_pic': user.photoURL,
      'contact': user.phoneNumber,
    };
    print(userMap);
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(17),
                bottomRight: Radius.circular(17))),
        backgroundColor: const Color.fromARGB(255, 96, 173, 235),
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.menu),
        ),
        title: Text(
          appname,
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                dialog();
              },
              icon: const Icon(Icons.notifications))
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.isShared || isSharing)
                    const Text(
                      "Document Available for ",
                      style: TextStyle(fontSize: 16),
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (widget.isShared || isSharing)
                    TweenAnimationBuilder<Duration>(
                        duration: widget.duration,
                        tween:
                            Tween(begin: widget.duration, end: Duration.zero),
                        onEnd: () {
                          if (widget.isShared) {
                            dialog();
                          } else {
                            setState(() {
                              isSharing = false;
                            });
                          }
                        },
                        builder: (BuildContext context, Duration value,
                            Widget? child) {
                          final minutes = value.inMinutes;
                          final seconds = value.inSeconds % 60;
                          return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Text('$minutes:$seconds',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30)));
                        }),
                  Center(
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  image: DecorationImage(
                                    image: NetworkImage(widget.file.url),
                                  )),
                            ),
                            Opacity(
                              opacity: 0.5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 100,
                                  child: BarcodeWidget(
                                    barcode: Barcode.code128(),
                                    data:
                                        "MdMobin,djsmk123@gmail.com,9667041944",
                                    drawText: false,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            RowValueWidget(
                              label: "Document name: ",
                              value: widget.file.name,
                            ),
                            RowValueWidget(
                              label: "Document type: ",
                              value: widget.file.documentType,
                            ),
                            RowValueWidget(
                                label: "Document size: ",
                                value:
                                    "${((double.parse(widget.file.size)) / 1024).toStringAsFixed(2)} MB"),
                            RowValueWidget(
                                label: "Uploaded date: ",
                                value: timeAgoSinceDate(
                                    date:
                                        DateTime.parse(widget.file.dateTime))),
                            const SizedBox(
                              height: 30,
                            ),
                            InkWell(
                              onTap: () {
                                if (widget.isShared) {
                                } else {
                                  setState(() {
                                    isSharing = true;
                                  });
                                }
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width / 2,
                                height: 50,
                                alignment: Alignment.center,
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(16)),
                                child: Text(
                                  widget.isShared
                                      ? "Download"
                                      : "Shared Document ",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            if (isSharing)
                              QrImage(
                                data: widget.file.id.toString(),
                                version: QrVersions.auto,
                                size: 200.0,
                              ),
                          ],
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  dialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text(
                "Document Availablity Ends!!!",
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    "We are sorry to inform you that the document you were trying to view and download is no longer available. Our policy is to protect documents by allowing access only for a limited time, and unfortunately, that time has now expired.\nIf you need to view and download the document again, you will need to rescan it. We apologize for any inconvenience this may cause, but we take our policy of document protection seriously to ensure the confidentiality and integrity of our documents.\nIf you have any further questions or concerns, please do not hesitate to contact us for assistance. We thank you for your understanding.",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Acknowledge",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ))
              ],
            )).then((value) {
      //Navigator.pop(context);
    });
  }
}

class FileModel {
  final int id;
  final String name;
  final String url;
  final String dateTime;
  final String size;
  final String documentType;
  FileModel(
      {required this.id,
      required this.name,
      required this.size,
      required this.url,
      required this.documentType,
      required this.dateTime});
  factory FileModel.fromJson(Map<String, dynamic> json) {
    return FileModel(
        id: json['id'],
        name: json['name'],
        size: json['size'],
        url: json['url'],
        documentType: json['document_type'],
        dateTime: json['dateTime']);
  }
}

class RowValueWidget extends StatelessWidget {
  final String label;
  final String value;
  const RowValueWidget({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
          Text(
            value,
            style: const TextStyle(color: Colors.grey, fontSize: 16),
          )
        ],
      ),
    );
  }
}

String timeAgoSinceDate({bool numericDates = true, required DateTime date}) {
  final date2 = DateTime.now().toLocal();
  final difference = date2.difference(date);

  if (difference.inSeconds < 5) {
    return 'Just now';
  } else if (difference.inSeconds <= 60) {
    return '${difference.inSeconds} seconds ago';
  } else if (difference.inMinutes <= 1) {
    return (numericDates) ? '1 minute ago' : 'A minute ago';
  } else if (difference.inMinutes <= 60) {
    return '${difference.inMinutes} minutes ago';
  } else if (difference.inHours <= 1) {
    return (numericDates) ? '1 hour ago' : 'An hour ago';
  } else if (difference.inHours <= 60) {
    return '${difference.inHours} hours ago';
  } else if (difference.inDays <= 1) {
    return (numericDates) ? '1 day ago' : 'Yesterday';
  } else if (difference.inDays <= 6) {
    return '${difference.inDays} days ago';
  } else if ((difference.inDays / 7).ceil() <= 1) {
    return (numericDates) ? '1 week ago' : 'Last week';
  } else if ((difference.inDays / 7).ceil() <= 4) {
    return '${(difference.inDays / 7).ceil()} weeks ago';
  } else if ((difference.inDays / 30).ceil() <= 1) {
    return (numericDates) ? '1 month ago' : 'Last month';
  } else if ((difference.inDays / 30).ceil() <= 30) {
    return '${(difference.inDays / 30).ceil()} months ago';
  } else if ((difference.inDays / 365).ceil() <= 1) {
    return (numericDates) ? '1 year ago' : 'Last year';
  }
  return '${(difference.inDays / 365).floor()} years ago';
}
