package com.roro.gui

import javafx.application.Application
import javafx.geometry.Insets
import javafx.scene.Scene
import javafx.scene.control.Button
import javafx.scene.layout.GridPane
import javafx.scene.layout.Pane
import javafx.scene.layout.VBox
import javafx.stage.FileChooser
import javafx.stage.Stage


class OpenFile : Application() {
    override fun start(stage: Stage) {
        stage.title = "Open File"

        val openButton = Button("open File")

        openButton.setOnAction {
            val fileChooser = FileChooser()
            fileChooser.title = "Open Resource File"
            fileChooser.showOpenDialog(stage)
        }
        val inputGridPane = GridPane()

        GridPane.setConstraints(openButton, 0, 0)
        inputGridPane.hgap = 6.0
        inputGridPane.vgap = 6.0
        inputGridPane.children.addAll(openButton)
        val rootGroup: Pane = VBox(12.0)
        rootGroup.children.addAll(inputGridPane)
        rootGroup.padding = Insets(320.0, 320.0, 320.0, 320.0)

        stage.scene = Scene(rootGroup)
        stage.show()
    }
}

fun main() {
    Application.launch(OpenFile::class.java)
}
