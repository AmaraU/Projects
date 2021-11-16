import pygame as pg
import os

pg.init()

running = True

width = 1000
height = 800
surface = pg.display.set_mode((width, height))
    
white = (255, 255, 255)
pink = (255,192,203)
hotpink = (255,20,147)
    
surface.fill(pink)

pg.display.set_caption('Main Menu')

#Makes Title
title = pg.image.load("title.png")
title = pg.transform.scale(title, (540,250))
surface.blit(title, (220, 20))

#Makes Button1
button1 = pg.image.load("new game.png")
button1 = pg.transform.scale(button1, (400,150))
surface.blit(button1, (300, 240))
start_r = button1.get_rect()
start_r.x = 300
start_r.y = 240

start_down = pg.image.load("new game down.png").convert_alpha()
start_down = pg.transform.scale(start_down, (400,150))

#Makes Button2
button2 = pg.image.load("resume.png")
button2 = pg.transform.scale(button2, (400,150))
surface.blit(button2, (300, 405))
resume_r = button2.get_rect()
resume_r.x = 300
resume_r.y = 405

resume_down = pg.image.load("resume down.png").convert_alpha()
resume_down = pg.transform.scale(resume_down, (400,150))

#Makes Button3
button3 = pg.image.load("settings.png")
button3 = pg.transform.scale(button3, (400,150))
surface.blit(button3, (300, 570))
settings_r = button3.get_rect()
settings_r.x = 300
settings_r.y = 570

settings_down = pg.image.load("settings down.png").convert_alpha()
settings_down = pg.transform.scale(settings_down, (400,150))

#title
#pg.font.init()
#titlefont = pg.font.SysFont('04b_30__.ttf', 100)
#textsurface = titlefont.render('Main Menu', False, white)
#surface.blit(textsurface,(260,40))



def buttonSelect(click):
    if click == button1:
        #surface.fill(hotpink)
        print('new game')
        os.system("opening scene.py")
    
    elif click == button2:
        #surface.fill(pink)
        print('continue game')
    
    elif click == button3:
        #surface.fill(white)
        print('settings')

pg.display.flip()
while running:
    for event in pg.event.get():
        if (event.type == pg.QUIT) or (event.type == pg.KEYDOWN and event.__dict__['key'] == pg.K_q):
            running = False
            pg.quit()
        else:
            #Checks Where the Mouse Is
            mouse = pg.mouse.get_pos() 
            if (700 > mouse[0] > 300 and 390 > mouse[1] > 240):
                if event.type == pg.MOUSEBUTTONDOWN:
                    buttonSelect(button1)
            elif (700 > mouse[0] > 300 and 555 > mouse[1] > 405):
                if event.type == pg.MOUSEBUTTONDOWN:
                    buttonSelect(button2)
            elif (700 > mouse[0] > 300 and 730 > mouse[1] > 570):
                if event.type == pg.MOUSEBUTTONDOWN:
                    buttonSelect(button3)
    if start_r.collidepoint(pg.mouse.get_pos()):
        surface.blit(start_down, (300, 240))
    else:
        surface.blit(button1, (300, 240))
        
    if resume_r.collidepoint(pg.mouse.get_pos()):
        surface.blit(resume_down, (300,405))
    else:
        surface.blit(button2, (300,405))
    if settings_r.collidepoint(pg.mouse.get_pos()):
        surface.blit(settings_down, (300,570))
    else:
        surface.blit(button3, (300,570))
                    


        
    pg.display.update()
