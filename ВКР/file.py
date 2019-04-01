import random

studentList = ['Никита', 'Максим', 'Святослав', 'Георгий', 'Петр',
               'Дмитрий', 'Илья', 'Владимир', 'Даниил', 'Полина',
               'Егор', 'Тихон']
lessonItem = str(input('Тема занятия: '))
lessonAgenda = str(input('Сегодня мы прошли <механизм, блок, что-то из теории>: '))
constructionName = str(input('Название сборки (в винительном падеже): '))

baseComment = ['Тема занятия: ', '. Сегодня мы прошли ', ' и сконструировали ', '. ']
customComment = [' занимался в команде с ', '. У него отлично получилось', ]
customCommentOptions = [' освоить новую тему ', ' проявить себя в конструировании ',
                        'проявить себя в программировании ', 'проявить себя в командной работе ']

for i in studentList:
    print(i)

messages = []

for i in studentList:
    teamComrad = str(input('С кем в команде работал ' + i + ' в творительном падеже: '))
    line = baseComment[0] + lessonItem + baseComment[1] + lessonAgenda + baseComment[2] + constructionName + \
           baseComment[3] + i + customComment[0] + teamComrad + customComment[1] + customCommentOptions[
               random.randint(0, len(customCommentOptions) - 1)]
    messages += [line]
    print(line)
    print('|||||||||||||||||||||||||')

for i in messages:
    print(i)
