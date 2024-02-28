import QtQuick 2.0

/*
Anthor:@MichaelFeng
Date:2023/07/06
biref:详情界面 支出 / 收入 可点击item
*/

Rectangle{
    color: "transparent";
    property alias typeName: typename.text;
    property alias numValue: numlabel.text;
    Text {
        id: typename;
        width:parent.width;
        height: parent.height * 0.4;
        text: qsTr("支出");
        font.pointSize: 8;
        color: "gray";
        anchors.left: parent.left;
        anchors.top: parent.top;
        horizontalAlignment: Text.AlignHCenter;
        verticalAlignment: Text.AlignBottom;
    } Text {
        id: numlabel;
        width:parent.width;
        height: parent.height * 0.6;
        text: qsTr("700.00");
        font.pointSize: 12;
        font.bold: true;
        color: "black";
        anchors.left: typename.left;
        anchors.top: typename.bottom;
        horizontalAlignment: Text.AlignHCenter;
        verticalAlignment: Text.AlignVCenter;
    }
}
