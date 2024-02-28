import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Dialogs 1.2

/*
Anthor:@MichaelFeng
Date:2023/07/06
biref:登陆窗口界面
*/
//login.qml

Rectangle {
    id:loginwindow;
    visible: true;
    signal loginSuccess(bool status);
    BorderImage {
        id: loginbackground;
        source: "./image/Login.jpg";
        horizontalTileMode: BorderImage.Stretch;
        verticalTileMode: BorderImage.Stretch;
        anchors.fill: parent;
    }

    LineEdit{
        id:usernameLineedit;
        headertext.text: qsTr("用户名:");
        text:"MichaelFeng";
        x:loginwindow.width / 7;
        y:loginwindow.height / 5 * 3;
        width: loginwindow.width * 0.7;

        inputControll.echoMode: TextInput.Normal;
        KeyNavigation.tab:passwordLineedit.inputControll;
        //lineeditBackground:  "white";
        //anchors.left:usernamelabel.right + 20;
    }
    LineEdit{
        headertext.text: qsTr("密码:");
        text:"fj082300";
        id:passwordLineedit;
        width: loginwindow.width * 0.7;
        KeyNavigation.tab:usernameLineedit.inputControll;
        inputControll.echoMode: TextInput.Password;
        //inputControll.passwordCharacter: "*";
        anchors.top: usernameLineedit.bottom;
        anchors.topMargin: 20;
        anchors.left: usernameLineedit.left;
    }
    MCheckBox{
        id:rememberPass
        text:"记住密码";
        body.font.pointSize:14;
        width:passwordLineedit.width / 3;
        anchors.top: passwordLineedit.bottom;
        anchors.topMargin: 20;
        anchors.left: passwordLineedit.left;
        anchors.leftMargin: 20;
    }
    MCheckBox{
        id:autologin;
        text:"自动登陆";
        body.font.pointSize:14;
        width:passwordLineedit.width / 3;
        anchors.right: passwordLineedit.right;
        anchors.rightMargin: 20;
        anchors.top: rememberPass.top;
    }
    Button{
        id:loginbutton;
        text:"登 陆";
        width:passwordLineedit.width / 3;
        height:passwordLineedit.height * 0.8
        background: Rectangle{
            opacity: enabled ? 1 : 0.3
            border.color: loginbutton.down ? "#17a81a" : "#21be2b"
            color: loginbutton.down ? "#17a81a" : "#21be2b"
            border.width: 1
            radius: 2
                }
        contentItem: Text{
                    text: loginbutton.text
                    font.bold: true;
                    font.pointSize: 15;
                    color: "white";
                    //anchors.centerIn: background;
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
        onClicked: {
            if(login(usernameLineedit.text,passwordLineedit.text)){
                loginSuccess(true);
                console.log(qsTr("登陆成功"));
            }
            else{
                openFailureDialog("用户名或者密码错误\n请重试!");
                console.log(qsTr("用户名或者密码错误"));
            }
        }
        anchors.left: passwordLineedit.left;
        anchors.top: rememberPass.bottom;
        anchors.topMargin: 50 + rememberPass.height;
    }
    Button{
        id:registerbutton;
        text:"注 册";
        width:loginbutton.width;
        height: loginbutton.height;
        background: Rectangle{
            opacity: enabled ? 1 : 0.3
            border.color: registerbutton.down ? "#17a81a" : "#21be2b"
            color: registerbutton.down ? "#17a81a" : "#21be2b"
            border.width: 1
            radius: 2
                }
        contentItem: Text{
                    text: registerbutton.text
                    font.bold: true;
                    font.pointSize: 15;
                    color: "white";
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
        anchors.right: passwordLineedit.right
        anchors.top: loginbutton.top;
    }
    MessageDialog {
        visible: false;
        id: failureDialog
        title: qsTr("Error")
        icon:StandardIcon.Critical;
        standardButtons: StandardButton.Ok
        //text: qsTr("用户名或者密码错误");
    }
    function login(user,pass){
        console.log("username:",user);
        console.log("password:",pass);
        var result = true;
        if(user !== "MichaelFeng"){
            result =  false;
            openFailureDialog("用户名错误\n请重试!");
        }
        else if(pass !== "fj082300"){
            openFailureDialog("密码错误\n请重试!");
            result =  false;
        }
        return result;
    }

    function openFailureDialog(failinfo)
    {
        failureDialog.setText(failinfo);
        failureDialog.open();
    }
}
