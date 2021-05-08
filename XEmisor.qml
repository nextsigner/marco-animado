import QtQuick 2.0
import QtQuick.Particles 2.0

Item {
    id: root
    width: parent.width
    height: parent.height
    //anchors.fill: parent
    property alias img1: blip.source
    property alias emitRate1: e1.emitRate
    property alias lifeSpan1: e1.lifeSpan
    property alias lifeSpanVariation1: e1.lifeSpanVariation
    property alias size1: e1.size
    property alias sizeVariation1: e1.sizeVariation
    property alias pda1X: pda1.x
    property alias pda1Y: pda1.y
    property alias pda1Vx: pda1.xVariation
    property alias pda1Vy: pda1.yVariation
    property bool paused: false
    property int uER: e1.emitRate
    onPausedChanged: {
        if(!paused){
            e1.emitRate=uER
        }else{
            uER=e1.emitRate
            e1.emitRate=0
        }
    }
    ParticleSystem {
        id: particleSys

    }

    Emitter {
        id: e1
        //anchors.fill: parent
        width: parent.width
        height: parent.height
        system: particleSys
        emitRate: 300
        lifeSpan: 2000


        //y: mouseArea.pressed ? mouseArea.mouseY : circle.cy
        //x: mouseArea.pressed ? mouseArea.mouseX : circle.cx

        velocity: PointDirection {id: pdv1; xVariation: 4; yVariation: 10;}
        acceleration: PointDirection {id: pda1; xVariation: 10; yVariation: 10;}
        velocityFromMovement: 8

        size: app.fs*10
        sizeVariation: app.fs*5

        shape: RectangleShape {fill: false}
        ImageParticle {
            id: blip
            anchors.fill: parent
            system: particleSys
            source: "./rojo_1.png"
            clip: true
        }

    }
}

