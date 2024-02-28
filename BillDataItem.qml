import QtQuick 2.0
import QtQuick.Shapes 1.12

/*
Anthor:@MichaelFeng
Date:2023/07/06
biref:详情界面账单单条数据Item
*/

Rectangle{
    id:frame;
    // 绘制一条边框
    property url iconpath;
    property alias date: dateText.text;
    property alias priceSimple: priceSimpleText.text;
    property alias type: typeText.text;
    property alias notes: notes.text;
    property alias price: priceText.text;
   Shape {
       z:1000;
       anchors.fill: frame;
       ShapePath {
           strokeWidth: 1;
           strokeColor: "gainsboro"
           strokeStyle: ShapePath.SolidLine
           startX: 0;
           startY: 0 + title.height;
           PathLine {
               x: 0 + frame.width;
               y: 0 + title.height;
           }
       }
   }
    //上半区
    Rectangle{
        id:title;
        color: "white";
        width: parent.width;
        height: parent.height / 3.5;
       //日期文本
        Text {
            id: dateText;
            text: qsTr("07月10日 星期一");
            width: parent.width / 2 - 10;
            height: parent.height;
            color: "darkgrey";
            font.pointSize: 7;
            anchors.left: parent.left;
            anchors.leftMargin: 10;
            anchors.top: parent.top;
            horizontalAlignment: Text.AlignLeft;
            verticalAlignment: Text.AlignVCenter;
        }
        //金额文本
        Text {
            id: priceSimpleText;
            text: qsTr("支出: 500");
            width: dateText.width;
            color: "darkgrey";
            font.pointSize: 7;
            height: dateText.height;
            anchors.left: dateText.right;
            anchors.top: dateText.top;
            horizontalAlignment: Text.AlignRight;
            verticalAlignment: Text.AlignVCenter;
        }
    }
    //下半区
    Rectangle{
        id:buttomArea;
        color: "white";
        width: parent.width;
        height: parent.height - title.height;
        anchors.top: title.bottom;
        anchors.left: title.left;
        BorderImage {
            id: typeIcon;
            width: parent.width * 0.2;
            height: parent.height;
            anchors.left: parent.left;
            anchors.top: parent.top;
            source: iconpath;
        }
        //类型文本
        Text {
            id: typeText;
            width: (parent.width - 20) * 0.2;
            height: parent.height;
            anchors.left: typeIcon.right;
            anchors.top: typeIcon.top;
            text: qsTr("餐饮");
            color: "black";
            font.pointSize: 8;
            horizontalAlignment: Text.AlignLeft;
            verticalAlignment: Text.AlignVCenter;
        }
        //备注
        Text {
            id: notes;
            width: parent.width - 20 - typeText.width - priceText.width - typeIcon.width;
            height: parent.height;
            anchors.left: typeText.right;
            anchors.top: typeText.top;
            text: qsTr("和春景王汝霖吃晚饭");
            color: "black";
            font.pointSize: 7;
            horizontalAlignment: Text.AlignHCenter;
            verticalAlignment: Text.AlignVCenter;
        }
        //具体价格
        Text {
            id: priceText;
            width: typeText.width;
            height: typeText.height;
            anchors.left: notes.right;
            anchors.top: notes.top;
            text: qsTr("-500");
            color: "black";
            font.pointSize: 8;
            horizontalAlignment: Text.AlignRight;
            verticalAlignment: Text.AlignVCenter;
        }

    }
}

