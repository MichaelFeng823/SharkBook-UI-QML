import QtQuick 2.0

/*
Anthor:@MichaelFeng
Date:2023/07/06
biref:登陆界面 输入框
*/

Item {
    id:lineedit;
    width: 300;
    height: 50;

    property alias inputControll: input
    property alias headertext: lineeditheader
    property alias text: input.text;

    Row{
        spacing: 10;
        Rectangle{
            visible: true;
            color: "transparent";
            width: lineedit.width / 5;
            height: 50;
            Text {
                id: lineeditheader
                text: qsTr("用户名:")
                 anchors.verticalCenter:parent.verticalCenter;
            }
        }
        Rectangle{
            id:frame;
            width:lineedit.width / 5 * 4;
            height: 50;
            visible: true
            color: "white";
            radius: height / 3;
            TextInput{
                id:input;
                width: frame.width-10;
                font.pointSize: 16;
                color:"black";
                text: "MichaelFeng";
                clip: true //设置此属性
                anchors.verticalCenter:frame.verticalCenter;
                anchors.left: parent.left;
                anchors.leftMargin: 10;
            }
        }
    }
}

