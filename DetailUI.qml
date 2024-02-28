import QtQuick 2.0
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.0

/*
Anthor:@MichaelFeng
Date:2023/07/06
biref:详情界面
*/

Rectangle {
    id:detailui;
    color: "#f9db61";
    anchors.fill: parent;
    signal openDateSelector(bool status);
    //title部分
    Rectangle{
        id:title;
        width: parent.width;
        height: parent.height / 14;
        BorderImage {
            id: titlebackground;
            source: "./image/DetialTitle.jpg";
            smooth: true;
            //antialiasing: true;
            horizontalTileMode: BorderImage.Stretch;
            verticalTileMode: BorderImage.Stretch;
            anchors.fill: parent;
        }
        anchors.top: parent.top;
        anchors.left: parent.left;
        anchors.right: parent.right;
    }
    //InAndOutShow部分
    Rectangle{
        id:inAndOutShow;
        width: parent.width;
        height: parent.height / 14 * 1.5
        anchors.top: title.bottom;
        anchors.left: title.left;
        color: "transparent";
        //日期显示以及筛选控件
        DetailDateControll{
            id:datecontroll;
            width: parent.width * 0.2;
            height: parent.height;
            anchors.left: parent.left;
            anchors.top:parent.top;
            onOpenDateSeletor:{
                mainarea.onOpenDateSelector();
            }
        }
        //收入可点击控件界面
        DetailInOrOutClickableItem{
            id:incomeClickableItem;
            width: parent.width * 0.4;
            height: parent.height;
            anchors.left: datecontroll.right;
            anchors.top: parent.top;
            typeName: "收入";
            numValue: "700.00";

        }
        //支出可点击控件界面
        DetailInOrOutClickableItem{
            id:expandClickableItem;
            width: parent.width * 0.4;
            height: parent.height;
            anchors.left: incomeClickableItem.right;
            anchors.top: parent.top;
            typeName: "支出";
            numValue: "1650.00";
        }
    }
    //toolwidget部分
    Rectangle{
        id:toolwidget;
        width: parent.width;
        height: parent.height / 14 * 1.5
        anchors.top: inAndOutShow.bottom;
        anchors.left: inAndOutShow.left;
        //线性渐变
        LinearGradient{
             anchors.fill:parent
             gradient: Gradient{
                 GradientStop{position:0.0;color:"#f9db61"}
                 GradientStop{position:1;color: "white"}
             }
         }


        PicButton{
            id:billbutton;
            width: (parent.width - 20) / 5;
            height: parent.height - 10;
            anchors.left: parent.left;
            anchors.leftMargin: 10;
            anchors.top: parent.top;
            anchors.topMargin: 10;
            imagepathOnClicked:"./image/BillToolButton.jpg";
            imagepathOnReleased:"./image/BillToolButton.jpg";
        }
        PicButton{
            id:budgetbutton;
            width: billbutton.width;
            height: billbutton.height;
            imagepathOnClicked:"./image/BudGetToolButton.jpg";
            imagepathOnReleased:"./image/BudGetToolButton.jpg";
            anchors.left: billbutton.right;
            anchors.top: billbutton.top;
        }
        PicButton{
            id:assetsmanagerbutton;
            width: billbutton.width;
            height: billbutton.height;
            imagepathOnClicked:"./image/AssetManagerToolButton.jpg";
            imagepathOnReleased:"./image/AssetManagerToolButton.jpg";
            anchors.left: budgetbutton.right;
            anchors.top: budgetbutton.top;
        }
        PicButton{
            id:shopbutton;
            width: billbutton.width;
            height: billbutton.height;
            imagepathOnClicked:"./image/ShoppingReturnToolButton.jpg";
            imagepathOnReleased:"./image/ShoppingReturnToolButton.jpg";
            anchors.left: assetsmanagerbutton.right;
            anchors.top: assetsmanagerbutton.top;
        }
        PicButton{
            id:morebutton;
            width: billbutton.width;
            height: billbutton.height;
            imagepathOnClicked:"./image/MoreToolButton.jpg";
            imagepathOnReleased:"./image/MoreToolButton.jpg";
            anchors.left: shopbutton.right;
            anchors.top: shopbutton.top;
        }
    }

    Rectangle{
        width: parent.width;
        height: parent.height / 14 * 10 ;
        anchors.left: toolwidget.left;
        anchors.top: toolwidget.bottom;
        color: "white";
        ListView{
            id:billview;
            width: parent.width;
            height: parent.height;
            anchors.fill:parent;
            clip: true;
            model:billmodel;
           delegate: billdataitem;
        }
    }

    ListModel{
        id:billmodel;
    }

    Component{
        id:billdataitem;

        BillDataItem{
            width: billview.width;
            height: billview.height / 6;
            iconpath: IconPath;
            date:DateText;
            priceSimple: PriceSimple;
            type:Type;
            notes: Notes;
            price: Price;
        }
    }
    Component.onCompleted: {
        console.log("明细界面初始化构建");
        initModel();
    }
    Component.onDestruction:{
        console.log("明细界面开始析构");
    }
//    property url iconpath;
//    property alias date: dateText.text;
//    property alias priceSimple: priceSimpleText.text;
//    property alias type: typeText.text;
//    property alias notes: notes.text;
//    property alias price: priceText.text;

    function initModel(){
        var expandType = ["餐饮","购物","日用","交通","蔬菜","水果","零食","运动"];
        var expandNote = ["和王汝霖吃饭","到超市买饮料","买洗衣液和洗发水","打车","买西红柿","买芒果和波罗蜜","买辣条","嘿哈猫健身"];
        var expandTotalPrice = 0;
        for(var i = 1; i <= 12; i++){
            var expandPrice = Math.floor(Math.random() * 500);
             expandTotalPrice += expandPrice;
             var picNumber = Math.floor(Math.random() * 8 + 1);
             var date = new Date(2023,6,Math.random() * 18 + 1)
             console.log("picNumber:",picNumber);
             billmodel.append({"DateText":Qt.formatDate(date,"MM月dd日 ddd"),"PriceSimple":"支出:" + expandPrice ,"Type":expandType[picNumber - 1]
                                  ,"Notes":expandNote[picNumber - 1],"Price":"-" + expandPrice,
                                  "IconPath":"./image/BillPage_Expand_"+ picNumber +".jpg"});
        }
        expandClickableItem.numValue = expandTotalPrice + ".00";

    }
}
