import QtQuick 2.0
import QtQuick.Controls 2.12

/*
Anthor:@MichaelFeng
Date:2023/07/06
biref:图表界面
*/

Rectangle {
    color: "green";
    anchors.fill: parent;
    Label {
        anchors.centerIn: parent;
        text: qsTr("图表界面");
    }
    Component.onCompleted: {
        console.log("图表界面初始化构建");
    }
    Component.onDestruction:{
        console.log("图表界面开始析构");
    }
}
