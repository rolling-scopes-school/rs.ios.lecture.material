//
//  Task.m
//  RSSchool-iOS-Task-MRC
//
//  Created by Aliaksei Piatyha on 4/30/21.
//  Copyright © 2021 Alexei. All rights reserved.
//

#import "Task.h"
#import "Printer.h"
#import "Text.h"
#import "Page.h"
#import "Document.h"

@implementation Task

// MAIN TASK:
// Fix all memory management issues by adding retain, release and autorelease methods or
// changing property ownership attributes. You shouldn't modify the existing base code.
// Check yourself using special instruments and by crosscheck :)

- (void)execute {
    Printer *printer = [[Printer alloc] init];
   // NSLog(@"task printer: %lu", printer.retainCount);
    Text *welcomeText = [Text textWithContent:@"Hello, welcome to the first MRC task"];

    [printer printObject:welcomeText];

    Page *titlePage = [self getTitlePage];
    Page *mainPage = [self getMainPage];
    Page *lastPage = [self getLastPage];
    
    Text *documentTitle = [[Text alloc] initWithContent:@"Very useful document"];

    Document *document = [[Document alloc] initWithTitle: documentTitle];
    
   
   // NSLog(@"task titlePage1: %lu", titlePage.retainCount);  //rc=1
   // NSLog(@"task mainPage1: %lu", mainPage.retainCount);    //rc=1
   // NSLog(@"task lastPage1: %lu", lastPage.retainCount);    //rc=1
    
    [document addPage:titlePage];
    [document addPage:mainPage];
    [document addPage:lastPage];
    //NSLog(@"task titlePage2: %lu", titlePage.retainCount);  //rc=4
    //NSLog(@"task mainPage2: %lu", mainPage.retainCount);    //rc=3
    //NSLog(@"task lastPage2: %lu", lastPage.retainCount);    //rc=2
    //NSLog(@"task document: %lu", document.retainCount);    //rc=1
    
    titlePage.document = document;
    mainPage.document = document;
    lastPage.document = document;
    //NSLog(@"task titlePage3: %lu", titlePage.retainCount);  //rc=4
    //NSLog(@"task mainPage3: %lu", mainPage.retainCount);    //rc=3
    //NSLog(@"task lastPage3: %lu", lastPage.retainCount);    //rc=2
    
    [printer printObject:document];
    //NSLog(@"task printer2: %lu", printer.retainCount);
    [documentTitle release];
    [document release];
    [printer release];
}

- (Page *)getTitlePage {
    NSString *title = [[NSString alloc] initWithUTF8String:"How to become the best iOS developer?"];
    Text *text = [[Text alloc] initWithContent:title];
   
    Page *page = [[Page alloc] init];
    page.number = 1;
    page.text = text;
    [title autorelease];
    [text autorelease];
    //NSLog(@"task pageTitle: %lu", page.retainCount);  //rc=1
    return [page autorelease];
    //return page;

}

- (Page *)getMainPage {
    NSString *title = [[NSString alloc] initWithUTF8String:"You need to learn the materials, practice a lot and believe in yourself!"];
    Text *text = [[Text alloc] initWithContent:title];
    
    Page *page = [Page pageWithText:text];
    page.number = 2;
    page.text = text;
    
    
    [title autorelease];
    [text autorelease];
    [page retain];
    return [page autorelease];
    //return page;
}

- (Page *)getLastPage {
    NSString *title = [[NSString alloc] initWithUTF8String:"Good luck!"];
    Text *text = [Text textWithContent:title];
    
    Text *hiddenText = [[Text alloc] initWithContent:@"With love from RSSchool :)"];
    Page *page = [[Page alloc] init];
    page.number = 3;
    page.text = text;
    page.hiddenText = hiddenText;
    [title autorelease];
    //NSLog(@"task pageLast: %lu", title.retainCount);  //rc=1
    [hiddenText autorelease];
  
    return [page autorelease];
    //return page;
}

@end
