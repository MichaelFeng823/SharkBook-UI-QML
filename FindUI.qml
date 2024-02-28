import QtQuick 2.0
import QtQuick.Controls 2.12

/*
Anthor:@MichaelFeng
Date:2023/07/06
biref:发现页面
*/

Rectangle {
    color: "yellow";
    anchors.fill: parent;
    Label {
        anchors.centerIn: parent;
        text: qsTr("发现界面");
    }
    Component.onCompleted: {
        console.log("发现界面初始化构建");
    }
    Component.onDestruction:{
        console.log("发现界面开始析构");
    }
}
