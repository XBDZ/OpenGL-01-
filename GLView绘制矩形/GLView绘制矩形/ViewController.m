//
//  ViewController.m
//  OpenGL GLKview绘制一个矩形
//
//  Created by 苹果 on 17/7/17.
//  Copyright © 2017年 Mr Liu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    EAGLContext *_context;
    GLuint buffer;
}

@property (nonatomic,strong) GLKBaseEffect *baseEffect;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _context = [[EAGLContext alloc]initWithAPI:kEAGLRenderingAPIOpenGLES2];
    
    GLKView *glView = (GLKView *)self.view;
    glView.context = _context;
    [EAGLContext setCurrentContext:_context];
    
    const GLfloat vertices[] =
    {
        //左边的三角形
        -0.5f, 0.5f, 0.0f,  //左上
        -0.5f, -0.5f, 0.0f, //左下
        0.5f,  -0.5f,  0.0f, //右下
        
        //右边的三角形
        -0.5f, 0.5f, 0.0f,  //左上
        0.5f, 0.5f, 0.0f, //左下
        0.5f,  -0.5f,  0.0f, //右下
    };
    //添加着色器
    self.baseEffect = [[GLKBaseEffect alloc] init];
    self.baseEffect.useConstantColor = GL_TRUE;
    self.baseEffect.constantColor = GLKVector4Make(0.4f,//red
                                                   0.6f,//green
                                                   0.2f,//blue
                                                   1.0f);
    glClearColor(1.0f, 1.0f, 1.0f, 1.0f);
    
    glGenBuffers(1, &buffer);
    glBindBuffer(GL_ARRAY_BUFFER, buffer);
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glVertexAttribPointer(GLKVertexAttribPosition, 3
                          , GL_FLOAT, GL_FALSE, 0, NULL);
    
}
-(void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{
    [self.baseEffect prepareToDraw];
    glClear(GL_COLOR_BUFFER_BIT);
    glDrawArrays(GL_TRIANGLE_FAN, 0, 6);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
