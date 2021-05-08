import QtQuick 2.7
import QtQuick.Controls 2.12
import QtQuick.Window 2.2
import Qt.labs.settings 1.1
ApplicationWindow{
    id: app
    visible: true
    visibility: "Windowed"
    color: 'transparent'
    title: 'marco-animado'
    width: 739
    height: 554
    //y:710//0-Screen.height*0.5
    property int fs: width*0.02
    property bool editable: false

    property int m: 0

    Settings{
        id: apps
        property string uHtml: ''
    }
    Item{
        id: xApp
        anchors.fill: parent
        XEmisor{
            anchors.fill: parent
        }
        XEmisor{
            img1: './amarillo_1.png'
        }
    }
    MouseArea{
        anchors.fill: parent
        onWheel: {
            if (wheel.modifiers & Qt.ControlModifier) {
                let z=wheel.angleDelta.y / 120;
                var e=xApp.children[app.m]
                if(z<0){
                    e.size1-=e.size1*0.1
                }else{
                    e.size1+=e.size1*0.1
                }
            }
        }
        onClicked: {
            var e=xApp.children[app.m]
            e.pda1Vx=mouseX
            e.pda1Vy=mouseY
        }
        onDoubleClicked: {
            var e=xApp.children[app.m]
            e.paused=!e.paused
        }
    }
    Timer{
        running: true
        repeat: true
        interval: 1000
        //onTriggered: app.y=720
    }
    Shortcut{
        sequence: 'Tab'
        onActivated: {
            if(app.m<xApp.children.length-1){
                app.m++
            }else{
                app.m=0
            }
        }
    }
}
