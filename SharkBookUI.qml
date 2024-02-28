import QtQuick 2.12
import QtQuick.Window 2.12

/*
Anthor:@MichaelFeng
Date:2023/07/06
biref:主程序入口页面
*/

Window {
    id:mainwindow;
    visible: true
    width: 540 / 3 * 2
    height: 1200 / 3 * 2
    Login{
        id:loginwindow;
        visible: true;
        anchors.fill: parent;
    }
    Component.onCompleted: {
            loginwindow.loginSuccess.connect(createMainArea);
        }
    function createMainArea() {
        // 直接从文本中创建一个动态对象，直接返回结果，保证动态对象的依赖项都存在
        loginwindow.visible = false;
        var component;
        component = Qt.createComponent("MainArea.qml");
        // qml没问题则实例化qml元素
        if (component.status === Component.Ready || component.status === Component.Error) {
            finishCreation(component);
        } else {
            component.statusChanged.connect(finishCreation);
        }
    }

    function finishCreation(component) {
        if (component.status === Component.Ready) {
            // qml组件 ready之后方可实例化，这样实例化的qml元素没有id
            var image = component.createObject(mainwindow, {"anchors.fill":mainwindow});
            if (image === null) {
                console.log("Error creating image");
            }
        } else if (component.status === Component.Error) {
            console.log("Error loading component:", component.errorString());
        }
    }

}
