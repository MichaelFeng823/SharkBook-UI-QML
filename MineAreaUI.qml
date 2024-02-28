import QtQuick 2.0
import QtQuick.Controls 2.12
/*
Anthor:@MichaelFeng
Date:2023/07/06
biref:我的界面
*/
Rectangle {
    color: "gray";
    anchors.fill: parent;
    Label {
        anchors.centerIn: parent;
        text: qsTr("我的界面");
    }
    Component.onCompleted: {
        console.log("我的界面初始化构建");
    }
    Component.onDestruction:{
        console.log("我的界面开始析构");
    }
}

