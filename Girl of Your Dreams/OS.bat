import pygame as pg
import os
from pygame.locals import *

#Sets main variable
running = True
background_colour = (255,229,229)
(width, height) = (1000, 800)
score = 10
maxScore = 100
bars = 10
clock = pg.time.Clock()
name = "Ezra"
#Functions for Relationship Bar
def ScoreBar(score, adder):
    score = score + adder
    if score <= 0:
        score = 0
        relationship_rect = pg.draw.rect(screen, (0,0,0), (width/40, height-230, 200, 50))
        relationship_bar = pg.draw.rect(screen, (255,0,0), (width/40, height-230, 0, 50))
    elif score >= 200:
        score = 200
        relationship_rect = pg.draw.rect(screen, (0,0,0), (width/40, height-230, 200, 50))
        relationship_bar = pg.draw.rect(screen, (255,0,0), (width/40, height-230, 200, 50))
    elif score < 200:
        if adder == (-10):
            relationship_rect = pg.draw.rect(screen, (0,0,0), (width/40, height-230, 200, 50))
            relationship_bar = pg.draw.rect(screen, (255,0,0), (width/40, height-230, 0, 50))
            relationship_bar = pg.draw.rect(screen, (255,0,0), (25, height-230, score-10, 50))
        elif adder == 10:
            relationship_rect = pg.draw.rect(screen, (0,0,0), (width/40, height-230, 200, 50))
            relationship_bar = pg.draw.rect(screen, (255,0,0), (width/40, height-230, 0, 50))
            relationship_bar = pg.draw.rect(screen, (255,0,0), (25, height-230, score+10, 50))

    return (score)
def makethetexties (text, x, y):
    d = font.render(text, True, (0,0,0))
    screen.blit(d, (x, y))
    pg.display.update()
    clock.tick(1)
def maketheblankies():
    textbox = pg.image.load("dialogue box.png")
    textbox = pg.transform.scale(textbox, (600, 200))
    screen.blit(textbox, (width-630, height-230))
    pg.display.update()
    clock.tick(3)
def drawbutton(x, y):
    button1 = pg.image.load("button.png")
    button1 = pg.transform.scale(button1, (400,100))
    screen.blit(button1, (x, y))
def drawname(text):
    location = pg.image.load('name.png')
    location = pg.transform.scale(location, (200,40))
    text = font2.render(text, True, (0,0,0))
    
    screen.blit(location, (width-630, height-290))
    screen.blit(text, (width-600, height-280))
def buttontext(text, x, y):
    d = font.render(text, True, (0,0,0))
    screen.blit(d, (x, y))
    pg.display.update()
def redraw():
    screen.fill(background_colour)
    #Makes relationship Bar
    relationship_rect = pg.draw.rect(screen, (0,0,0), (width/40, height-230, 200, 50))
    relationship_bar = pg.draw.rect(screen, (255,0,0), (width/40, height-230, 0, 50))

    #Location Label
    location = pg.image.load('name.png')
    location = pg.transform.scale(location, (200,40))
    screen.blit(location, (width/40, 30))



    #Makes Text area
    maketheblankies()

    text = font.render("Willow High", True, (0,0,0))
    screen.blit(text, (width/40+20, 41))
#Sets the Width an Height of Screen
screen = pg.display.set_mode((width, height))
pg.display.set_caption('Dating Section')


#Colors Screen
screen.fill(background_colour)

#Initialzies the Screen
pg.font.init()

#Imports Fonts
font = pg.font.Font("Pokemon GB.ttf", 12)

font2 = pg.font.Font("Pokemon GB.ttf", 14)
#Makes relationship Bar
relationship_rect = pg.draw.rect(screen, (0,0,0), (width/40, height-230, 200, 50))
relationship_bar = pg.draw.rect(screen, (255,0,0), (width/40, height-230, 0, 50))

#Location Label
location = pg.image.load('name.png')
location = pg.transform.scale(location, (200,40))
screen.blit(location, (width/40, 30))



#Makes Text area
maketheblankies()

text = font2.render("Willow High", True, (0,0,0))
screen.blit(text, (width/40+20, 41))


pg.display.flip()
drawname("Narrator")
makethetexties("You’ve just moved to a new town", width-620, height-220)
makethetexties("and it’s your first day at school.", width-620, height-200)
makethetexties("You’ve just walked into your English class", width-620, height-180)
makethetexties("your first class of the day.", width-620, height-160)
maketheblankies()
makethetexties("You notice that all of the seats are filled up", width-620, height-220)
makethetexties("besides the one in the back.", width-620, height-200)
makethetexties("You make your way towards the seat.", width-620, height-180)
maketheblankies()
makethetexties("The teacher walks in and once class begins", width-620, height-220)
makethetexties("she starts talking", width-620, height-200)
makethetexties("about the objectives of the day.", width-620, height-180)
maketheblankies()
drawname("Teacher")
makethetexties("“So today we are reading- oh! her eyes land on you,", width-620, height-220)
makethetexties("“You must be our new student! " + name + ", right?”", width-620, height-200)
maketheblankies()
drawname(name)
makethetexties("Uh, yeah, that’s me", width-620, height-220)
maketheblankies()
drawname("Narrator")
makethetexties("You hear a scoff from the girl next to you.", width-620, height-220)
maketheblankies()
girl3 = pg.image.load("Girl 3.png")
screen.blit(girl3,(600, 75))
pg.display.update()
clock.tick(1/3)
redraw()
drawname("Narrator")
makethetexties("You hear a mumble from the girl in front of you.", width-620, height-220)
girl2 = pg.image.load("Girl 2.png")
screen.blit(girl2,(600, 75))
pg.display.update()
clock.tick(1/3)
redraw()
drawname("Narrator")
makethetexties("And you hear a giggle from the girl diagonal.", width-620, height-220)
girl1 = pg.image.load("Wife 1 Happy.png")
screen.blit(girl1, (600, 75))
pg.display.update()
clock.tick(1/3)
redraw()

maketheblankies()
drawname("Teacher")
makethetexties("“Wonderful! Meet me after class and", width-620, height-220)
makethetexties("I can work with you to catch you up.", width-620, height-200)
makethetexties("We will be doing a group activity today,", width-620, height-180)
makethetexties("but don’t worry, you should be fine.”", width-620, height-160)
maketheblankies()
drawname("Narrator")
makethetexties("You nod in understanding and", width-620, height-220)
makethetexties("she continues to explain the assignment.", width-620, height-200)
makethetexties("Apparently you will be reading and analyzing a poem.", width-620, height-180)
maketheblankies()
drawname("Teacher")
makethetexties("“Now get into groups of four!”", width-620, height-220)
maketheblankies()
drawname("Narrator")
makethetexties("At this, you panic, not knowing anyone.", width-620, height-220)
maketheblankies()
makethetexties("You notice the girl next to you,", width-620, height-220)
makethetexties("in front of you,", width-620, height-200)
makethetexties("and diagonal to you", width-620, height-180)
makethetexties("also seem to not have anyone to work with.", width-620, height-160)
maketheblankies()

drawbutton(width/40, height/9)
drawbutton(width/40, 2.5*height/9)
buttontext("Ask if they\'d like to work", width/40+25, height/9+15)
buttontext("together.", width/40+25, height/9+40)
buttontext("Wait to see if anyone else", width/40+25, 240)
buttontext("doesn’t have a partner.", width/40+25, 240+15)
while running:
    for event in pg.event.get():
        if event.type == pg.QUIT:
            running = False
            pg.quit()
            exit()
        else:
            if event.type == pg.MOUSEBUTTONDOWN:
                mouse = pg.mouse.get_pos()
                if (350 > mouse[0] > 50 and 170 > mouse[1] > 70):
                    maketheblankies()
                    pg.display.update()
                    
                    girl3 = pg.image.load("Girl 3.png")
                    screen.blit(girl3,(600, 75))
                    pg.display.update()
                    clock.tick(1/3)
                    drawname("Roxxi")
                    makethetexties("“Whatever.", width-620, height-220)
                    redraw()
                    maketheblankies()
                    
                    girl2 = pg.image.load("Girl 2.png")
                    screen.blit(girl2,(600, 75))
                    
                    drawname("Tatiana")
                    makethetexties("“Ugh Sure.", width-620, height-220)
                    pg.display.update()
                    clock.tick(1/3)
                    
                    redraw()
                    maketheblankies()
                    
                    girl1 = pg.image.load("Wife 1 Happy.png")
                    screen.blit(girl1, (600, 75))
                    drawname("Sofie")
                    makethetexties("“Awesome!", width-620, height-220)
                    pg.display.update()
                    clock.tick(1/3)
                    
                    redraw()
                    maketheblankies()
                    drawname(name)
                    makethetexties("“Uh, ok… so I guess we should read the poem first", width-620, height-220)
                    makethetexties("and then we can discuss” you suggest.", width-620, height-200)
                    maketheblankies()
                    makethetexties("“Sure,” they say and", width-620, height-220)
                    makethetexties("you all turn read the poem on your own.", width-620, height-200)
                    maketheblankies()
                    makethetexties("“...Somewhere ages and ages hence:", width-620, height-220)
                    makethetexties("whose roads diverged in a wood, and", width-620, height-200)
                    makethetexties("I took the one less traveled by,", width-620, height-180)
                    makethetexties("And that has made all the difference.”", width-620, height-160)
                    maketheblankies()
                    makethetexties("You turn to the girl after finishing reading", width-620, height-220)
                    makethetexties("and notice she is on her phone", width-620, height-200)
                    maketheblankies()
                    drawbutton(width/40, height/9)
                    drawbutton(width/40, 2.5*height/9)
                    drawbutton(width/40, 4*height/9)
                    buttontext("“Were you even reading?”", width/40+25, height/9+15) #-1
                    buttontext("“So I’m assuming this was", width/40+25, 240)
                    buttontext("written by a hipster”", width/40+25, 240+15) #+1
                    buttontext("“I guess this is about not", width/40+25, 370)
                    buttontext("wanting to follow the crowd”", width/40+25, 370+15)
                    running = False
                    break
                elif (350 > mouse[0] > 50 and 300 > mouse[1] > 200):
                    maketheblankies()
                    
                    pg.display.update()
                    drawname("Narrator")
                    makethetexties("After a few moments of waiting, everyone else seems to be partnered up. You sigh.", width-620, height-220)
                    
                    maketheblankies()
                    drawname("Teacher")
                    makethetexties("“Who doesn’t have a partner?”", width-620, height-220)
                    
                    maketheblankies()
                    drawname("Narrator")
                    makethetexties("You slowly raise your hand. You notice the girl next to you,", width-620, height-220)
                    makethetexties("the girl in front of you, and the girl diagonal to you", width-620, height-200)
                    makethetexties("also raises their hands, although halfheartedly.", width-620, height-180)
                    
                    maketheblankies()
                    drawname("Teacher")
                    makethetexties("“Oh, perfect! " + name + " , Ashe, Sofie, and Tatiana, you four can work together!”", width-620, height-220)
                    
                    maketheblankies()
                    drawname("Narrator")
                    makethetexties("You sigh, turning to face the girls.", width-620, height-220)
                    maketheblankies()
                    drawname("Roxxi")
                    girl3 = pg.image.load("Girl 3.png")
                    screen.blit(girl3,(600, 75))
                    makethetexties("“I’m not that thrilled to be your partner either”", width-620, height-220)
                    pg.display.update()
                    clock.tick(1/3)
                    
                    redraw()
                    maketheblankies()
                    
                    girl2 = pg.image.load("Girl 2.png")
                    screen.blit(girl2,(600, 75))
                    
                    drawname("Tatiana")
                    makethetexties("“Ugh I don\'t want to have to work with the losers", width-620, height-220)
                    pg.display.update()
                    clock.tick(1/3)
                    redraw()
                    maketheblankies()
                    
                    girl1 = pg.image.load("Wife 1 Happy.png")
                    screen.blit(girl1, (600, 75))
                    drawname("Sofie")
                    makethetexties("“I'm okay with working with anyone.", width-620, height-220)
                    makethetexties("I usually work alone.", width-620, height-200)
                    pg.display.update()
                    clock.tick(1/3)
                    
                    drawname(name)
                    makethetexties("“Uh, ok… so I guess we should read the poem first", width-620, height-220)
                    makethetexties("and then we can discuss” you suggest.", width-620, height-200)
                    maketheblankies()
                    makethetexties("“Sure,” they say and", width-620, height-220)
                    makethetexties("you all turn read the poem on your own.", width-620, height-200)
                    maketheblankies()
                    makethetexties("“...Somewhere ages and ages hence:", width-620, height-220)
                    makethetexties("whose roads diverged in a wood, and", width-620, height-200)
                    makethetexties("I took the one less traveled by,", width-620, height-180)
                    makethetexties("And that has made all the difference.”", width-620, height-160)
                    maketheblankies()
                    makethetexties("You turn to the girl after finishing reading", width-620, height-220)
                    makethetexties("and notice she is on her phone", width-620, height-200)
                    maketheblankies()
                    drawbutton(width/40, height/9)
                    drawbutton(width/40, 2.5*height/9)
                    drawbutton(width/40, 4*height/9)
                    buttontext("“Were you even reading?”", width/40+25, height/9+15) #-1
                    buttontext("“So I’m assuming this was", width/40+25, 240)
                    buttontext("written by a hipster”", width/40+25, 240+15) #+1
                    buttontext("“I guess this is about not", width/40+25, 370)
                    buttontext("wanting to follow the crowd”", width/40+25, 370+15)
                    running = False
                    break
running = True
while running:
    for event in pg.event.get():
        if event.type == pg.QUIT:
            running = False
            pg.quit()
            exit()
        elif event.type == pg.MOUSEBUTTONDOWN:
            mouse = pg.mouse.get_pos()
            if (350 > mouse[0] > 50 and 170 > mouse[1] > 70):
                ScoreBar(score, -10)
                girl3 = pg.image.load("Girl 3 Mad.png")
                screen.blit(girl3,(600, 75))
                drawname("Roxxi")
                makethetexties("“Yes, idiot, not everyone’s as slow of a reader as you”", width-620, height-220)
                pg.display.update()
                clock.tick(1/3)
                maketheblankies()
                redraw()
                
                girl2 = pg.image.load("Girl 2 Mad.png")
                screen.blit(girl2,(600, 75))
                    
                drawname("Tatiana")
                makethetexties("“I agree with the loser. You're such a slowpoke", width-620, height-220)
                pg.display.update()
                clock.tick(1/3)
                redraw()
                maketheblankies()
                    
                girl1 = pg.image.load("Girl 1 Sad.png")
                screen.blit(girl1, (600, 75))
                drawname("Sofie")
                makethetexties("“Don't be mean to them!", width-620, height-220)
                makethetexties("Even then Slowpoke is such a cool Pokemon.", width-620, height-200)
                pg.display.update()
                clock.tick(1/3)
                
                redraw()
                maketheblankies()
                drawname("Narrator")
                makethetexties("Not knowing how to reply, you decide to ignore that", width-620, height-220)
                makethetexties("and go into discussing the poem.", width-620, height-200)
                maketheblankies()
                running = False
            elif (350 > mouse[0] > 50 and 300 > mouse[1] > 200):
                ScoreBar(score, 10)
                girl3 = pg.image.load("Girl 3 Mad.png")
                screen.blit(girl3,(600, 75))
                drawname("Roxxi")
                makethetexties("", width-620, height-220)
                pg.display.update()
                clock.tick(1/3)
                maketheblankies()
                redraw()
                
                girl2 = pg.image.load("Girl 2 Mad.png")
                screen.blit(girl2,(600, 75))
                    
                drawname("Tatiana")
                makethetexties("", width-620, height-220)
                pg.display.update()
                clock.tick(1/3)
                redraw()
                maketheblankies()
                    
                girl1 = pg.image.load("Girl 1 Sad.png")
                screen.blit(girl1, (600, 75))
                drawname("Sofie")
                makethetexties("“", width-620, height-220)
                pg.display.update()
                clock.tick(1/3)
                running = False         
            elif (350 > mouse[0] > 50 and 430 > mouse[1] > 330):
                ScoreBar(score, 0)
                girl3 = pg.image.load("Girl 3 Mad.png")
                screen.blit(girl3,(600, 75))
                drawname("Roxxi")
                makethetexties("", width-620, height-220)
                pg.display.update()
                clock.tick(1/3)
                maketheblankies()
                redraw()
                
                girl2 = pg.image.load("Girl 2 Mad.png")
                screen.blit(girl2,(600, 75))
                    
                drawname("Tatiana")
                makethetexties("", width-620, height-220)
                pg.display.update()
                clock.tick(1/3)
                redraw()
                maketheblankies()
                    
                girl1 = pg.image.load("Girl 1 Sad.png")
                screen.blit(girl1, (600, 75))
                drawname("Sofie")
                makethetexties("“", width-620, height-220)
                pg.display.update()
                clock.tick(1/3)
                running = False

#More Dialogue


#Final Choice
makethetextie("I really want to ask one of these girls out", width-620, height-220)
makethetexties("They\'re all pretty cool.", width-620, height-200)
maketheblankies()
drawbutton(width/40, height/9)
drawbutton(width/40, 2.5*height/9)
drawbutton(width/40, 4*height/9)
buttontext("Roxxi", width/40+25, height/9+15)
buttontext("Tatiana", width/40+25, 240)
buttontext("Sofie", width/40+25, 370)
choice = ("Who will be your Dream Girl?", True, (0,0,0))
screen.blit(choice, (width-620, height-220))
pg.display.update()
running = True
while running:
    for event in pg.event.get():
        if event.type == pg.QUIT:
            running = False
            pg.quit()
            exit()
        elif event.type == pg.MOUSEBUTTONDOWN:
            mouse = pg.mouse.get_pos()
            if (350 > mouse[0] > 50 and 170 > mouse[1] > 70):
                
                running = False
            elif (350 > mouse[0] > 50 and 300 > mouse[1] > 200):
                
                running = False
            elif (350 > mouse[0] > 50 and 430 > mouse[1] > 330):
                
                running = False
    pg.display.update()
    
    
    
    
#running = True
#while running:
#    for event in pg.event.get():
#        if event.type == pg.QUIT:
#            running = False
#            pg.quit()
#            exit()
#        elif event.type == pg.MOUSEBUTTONDOWN:
#            mouse = pg.mouse.get_pos()
#            if (350 > mouse[0] > 50 and 170 > mouse[1] > 70):
#                running = False
#            elif (350 > mouse[0] > 50 and 300 > mouse[1] > 200):
#                running = False
#            elif (350 > mouse[0] > 50 and 430 > mouse[1] > 330):
#                running = False    

