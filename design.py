# -*- coding: utf-8 -*-

from PyQt5 import QtWidgets  # данный модуль содержит классы, реализующие графический интерфейс
import sys  # при помощи этого модуля будем использовать список параметров

app = QtWidgets.QApplication(sys.argv)  # создаем объект-приложение
sizes = app.desktop().screenGeometry()  # получаем размеры экрана устройства
SCREEN_HEIGHT = sizes.height()  # получаем высоту экрана
SCREEN_WIDTH = sizes.width()  # получаем ширину экрана
window = QtWidgets.QWidget()  # создаем объект-окно
window.setWindowTitle("Первая программа на PyQt")  # устанавливаем заголовок окна
window.resize(SCREEN_WIDTH, SCREEN_HEIGHT)  # задаем минимальные размеры окна
label = QtWidgets.QLabel("<center>Привет, мир!</center>")  # создаем объект надписи
btnQuit = QtWidgets.QPushButton("&Закрыть окно")  # создаем объект-кнопку
'''
при помощи амперсанда перед надписью создается кнопка быстрого доступа:
если зажать Alt и нажать букву, стоящую после амперсанда, кнопка сработает
'''
vbox = QtWidgets.QVBoxLayout()  # создаем вертикальный контейнер
vbox.addWidget(label)    # добавляем объекты
vbox.addWidget(btnQuit)  # в контейнер
window.setLayout(vbox)  # добавление контейнера в окно
'''
добавляем обработчик сигнала clicked, который генерируется при ее нажатии;
через метод connect() назначаем ему обработчик (передается первым параметром)  
'''
btnQuit.clicked.connect(app.quit)
window.show()  # выводим на экран окно и все ранее добавленные компоненты
sys.exit(app.exec_())  # запускаем бесконечный цикл обработки событий в приложении
