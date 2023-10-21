import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LodingView{
  static LodingView shard =LodingView();
  BuildContext? context;

  Widget createLodingView({Color ? color, double size = 30}) {
    return Stack(children: [getCirculerIndecator(color:color,size:size)],);
  }
  Widget getCirculerIndecator({Color ? color, double size = 30}){
    return Center(child: SpinKitFadingCircle(color: color ?? Colors.red,size: size,),);
  }
  void startLoading(BuildContext ? context){
    if(context==null) {
      return;
    }
    LodingView.shard.context=context;

   showDialog(context: context, builder:(context){return createLodingView();},barrierDismissible: false )
     ; }
void stopLoading(){
    try{if(LodingView.shard.context!=null&&Navigator.of(LodingView.shard.context!).canPop()){
      Navigator.of(LodingView.shard.context!,rootNavigator: true).pop();
      LodingView.shard.context=null;
    }}
        catch(_){

        }
}

}