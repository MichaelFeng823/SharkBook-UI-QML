import QtQuick 2.0
/*
Anthor:@MichaelFeng
Date:2023/07/06
biref:日期显示以及筛选控件
*/
Rectangle{
    id:dateControll;
    signal openDateSeletor;
    color: "transparent";
    Text {
        id: yearText;
        width:parent.width;
        height: parent.height * 0.4;
        text: qsTr("2023年");
        font.pointSize: 8;
        color: "gray";
        anchors.left: parent.left;
        anchors.leftMargin: 10;
        anchors.top: parent.top;
        horizontalAlignment: Text.AlignHCenter;
        verticalAlignment: Text.AlignBottom;
    }
    Text {
        id: monthText;
        width:parent.width * 0.7;
        height: parent.height * 0.6;
        text: qsTr("7月");
        color: "black";
        font.pointSize: 11;
        font.bold: true;
        anchors.top: yearText.bottom;
        anchors.left: yearText.left;
        horizontalAlignment: Text.AlignRight;
        verticalAlignment: Text.AlignVCenter;
    }
    BorderImage {
        id: arrow;
        width:parent.width * 0.3;
        height: monthText.height;
        source: "./image/calendar_arrow.jpg";
        anchors.left: monthText.right;
        anchors.top: monthText.top;
    }
    MouseArea{
        anchors.fill: parent;
        onClicked:openDateSeletor();
    }
}
