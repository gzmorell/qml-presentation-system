import QtQuick 2.0
import Prezo 1.0

import Qt.labs.particles 2.0

Presentation {
    width: 640
    height: 360

    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0; color: "lightsteelblue" }
            GradientStop { position: 1; color: "black" }
        }
    }

    Rectangle {
        id: colorTableItem
        width: 16
        height: 16
        anchors.fill: parent

        property color color1: Qt.rgba(0.8, 0.8, 1, 0.5)
        property color color2: Qt.rgba(0.8, 0.8, 1, 0.5)

        gradient: Gradient {
            GradientStop { position: 0; color: colorTableItem.color1 }
            GradientStop { position: 0.3; color: "transparent" }
            GradientStop { position: 0.7; color: "transparent" }
            GradientStop { position: 1; color: colorTableItem.color2 }
        }

        visible: false
    }

    ShaderEffectSource {
        id: colorTableSource
        sourceItem: colorTableItem
        smooth: true
    }

    Repeater {
        model: 4
        Swirl {

            anchors.bottom: parent.bottom
            height: parent.height / (2 + index)
            opacity: 0.3
            speed: index + 1
            colorTable: colorTableSource
        }
    }

    ParticleSystem{
        id: particles
    }
    ColoredParticle{
        anchors.fill: parent
        system: particles
        image: "particle.png"
        alpha: 0
        colorVariation: 0.3
    }
    TrailEmitter{
        anchors.fill: parent
        system: particles
        particlesPerSecond: Math.sqrt(parent.width * parent.height) / 30
        particleDuration: 1000
        emitting: true
        particleSize: 4
        particleSizeVariation: 2

        acceleration: AngleVector{ angle: 90; angleVariation: 360; magnitude: 50; }
        speed: AngleVector{ angle: 90; angleVariation: 360; magnitude: 10; }

    }

    property color textColor: "white"

    Slide {
        centeredText: "Animated Backgrounds"
        fontScale: 2
    }

    Slide {
        centeredText: "Just create what ever you want in the background, like shaders or rotating boxes and then put your Slide{} elements on top.."
    }

}
