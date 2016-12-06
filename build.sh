gcc main.m ./objGTK/GTKObject.m ./objGTK/GTKApplication.m ./objGTK/GTKWidget.m ./objGTK/GTKContainer.m ./objGTK/GTKWindow.m ./objGTK/GTKApplicationWindow.m ./objGTK/GTKFixed.m ./objGTK/GTKButton.m -std=gnu11 `pkg-config --cflags --libs gtk+-3.0` `gnustep-config --objc-flags` -I. -I./objGTK -rdynamic -lobjc -lm -lgnustep-base -o testApp

