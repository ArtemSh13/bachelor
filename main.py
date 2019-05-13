# -*- coding: utf-8 -*-
# from PyQt5 import QtWidgets
#
# # Импортируем наш шаблон.
# from gui.gui import Ui_MainWindow
# import sys
#
# class mywindow(QtWidgets.QMainWindow):
#     def __init__(self):
#         super(mywindow, self).__init__()
#         self.ui = Ui_MainWindow()
#         self.ui.setupUi(self)
#
#
# app = QtWidgets.QApplication([])
# application = mywindow()
# application.show()
#
# sys.exit(app.exec())
#######################################

from matplotlib import pyplot as pp
from PyQt5 import QtWidgets
from PyQt5 import QtCore
from PyQt5 import QtGui
from pyqtgraph import examples
import sys
import pyqtgraph as pg

# методом проб и ошибок обнаружил, что начало экрана имеет такие координаты
X0 = -10
Y0 = 0

# Создаем объект-приложение Qt
app = QtWidgets.QApplication(sys.argv)

# Получение данных о системе
# получаем объект, содержащий данные об экране
desktop = QtWidgets.QApplication.desktop()

# Создание и настройка окна
window = QtWidgets.QWidget()    # создаем окно
window.setWindowTitle("Обработка стабилографич еских данных")   # пишем заголовок окна
window.move(X0, Y0)   # задаем свойства окна таким образом, чтобы оно занимало весь экран
window.resize(desktop.width(), desktop.height())
window.baseSize()
# заводим слой
layout = QtWidgets.QGridLayout()
# добавляем слой к окну
window.setLayout(layout)
# добавляем к слою плот
plot = pg.PlotWidget()
layout.addWidget(plot, 0, 1, 3, 1)
# выводим окно на экран
window.show()

sys.exit(app.exec_())