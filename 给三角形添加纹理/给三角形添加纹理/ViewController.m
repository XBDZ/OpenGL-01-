//
//  ViewController.m
//  OprnGL-绘制一个三角形
//
//  Created by 苹果 on 17/7/16.
//  Copyright © 2017年 Mr Liu. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()
{
    GLuint vertexBufferID;
}
@property (nonatomic,strong) GLKBaseEffect *baseEffect;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GLKView *view = (GLKView *)self.view;
    //使用NSAssert()函数的一个运行时检查会验证self.view是否为正确的类型
    //    NSAssert([view isKindOfClass:[GLKView class]], @"viewcontroller’s view is not a GLKView");
    
    view.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];//分配一个新的EAGLContext的实例，并将它初始化为OpenGL ES 2.0
    [EAGLContext setCurrentContext:view.context];//在任何其他的OpenGL ES配置或者渲染之前，应用的GLKview实例的上下文属性都要设置为当前
    
    //设置坐标
    //    const GLfloat vertices[] = {
    //        -0.5f, -0.5f, 0.0f,  0.0f, 0.0f, 1.0f,  0.0f, 0.0f,
    //        0.5f, -0.5f, 0.0f,  0.0f, 1.0f, 0.0f,  1.0f, 0.0f,
    //        0.0f,  0.5f, 0.0f,  1.0f, 0.0f, 0.0f,  0.5f, 1.0f
    //    };
    
    const GLfloat vertices[] = {
        0.5, -0.5, 0.0f,    1.0f, 0.0f, //右下
        -0.5, 0.5, 0.0f,    0.0f, 1.0f, //左上
        -0.5, -0.5, 0.0f,   0.0f, 0.0f, //左下
    };
    glClearColor(1.0f, 1.0f, 1.0f, 1.0f);//设置当前OpenGL ES的上下文的“清除颜色”为不透明白色
    
    glGenBuffers(1, &vertexBufferID);
    glBindBuffer(GL_ARRAY_BUFFER, vertexBufferID);
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);
    
    //启动顶点缓存渲染操作
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, sizeof(GLfloat) * 5, (GLfloat *)NULL + 0);
    
    //设置纹理
    CGImageRef imageRef = [[UIImage imageNamed:@"leaves.gif"] CGImage];
    GLKTextureInfo *textureInfo = [GLKTextureLoader textureWithCGImage:imageRef options:nil error:NULL];
    
    glEnableVertexAttribArray(GLKVertexAttribTexCoord0);
    glVertexAttribPointer(GLKVertexAttribTexCoord0, 2, GL_FLOAT, GL_FALSE, sizeof(GLfloat) * 5, (GLfloat *)NULL + 3);
    
    self.baseEffect = [[GLKBaseEffect alloc]init];
    self.baseEffect.texture2d0.name = textureInfo.name;
    self.baseEffect.texture2d0.enabled = GL_TRUE;
}




- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect{
    
    [self.baseEffect prepareToDraw];
    glClear(GL_COLOR_BUFFER_BIT);
    glDrawArrays(GL_TRIANGLES, 0, 3);
    
}
-(void)dealloc{
    GLKView *view = (GLKView *)self.view;
    [EAGLContext setCurrentContext:view.context];
    
    if (0!=vertexBufferID) {
        glDeleteBuffers(1, &vertexBufferID);
        //设置vertexBufferID为0避免了在对应的缓存被删除后还使用其无效的标识符。
        vertexBufferID = 0;
    }
    
    //设置视图的上下文属性为nil并设置当前的上下文为nil，以便让Cocoa Touch收回所有上下文使用的内存和其他资源
    ((GLKView *)self.view).context = nil;
    [EAGLContext setCurrentContext:nil];
}

@end
