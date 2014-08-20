////
////  TaskManager.h
////  Asynchronous
////
////  Created by Hoon H. on 14/8/19.
////
////
//
//#import <Foundation/Foundation.h>
//
//
////typedef NS_ENUM(NSUInteger, TaskState)
////{
////    TaskStateNone		=	0,
////    TaskStateReady		=	1,
////    TaskStateRunning	=	2,
////    TaskStateCancel		=	3,
////    TaskStateOK			=	4,
////    TaskStateError		=	5,
////};
//
//typedef NS_ENUM(BOOL, TaskState)
//{
//    TaskStateError		=	NO,
//    TaskStateOK			=	YES,
//};
//
//@protocol	TaskControllerDelegate;
//
//@protocol	TaskController
//@property	(readwrite,nonatomic,assign)	id<TaskControllerDelegate>	delegate;
//- (void)	run;
//- (void)	cancel;
////- (void)	prioritize;
////- (void)	deprioritize;
//@end
//
//@protocol	TaskControllerDelegate
//- (void)	taskCancel;
//- (void)	taskSuccess;
//- (void)	taskFailure;
//@end
//
//
///*!
// Abstract class.
// */
//@interface	Task : NSObject
//- (void)	
//@end
//
//@interface	HTTPDownloadTask : Task
//@end
//
//@interface	HTTPUploadTask : Task
//@end
//
//@interface	TaskManager : NSObject
//- (id<TaskController>)runTask:(Task*)task;
////- (id<TaskController>)runTask:(id<Task>)task withSuccessBlock:(void(^)(void))successBlock andFailureBlock:(void(^)(void))failureBlock;
//@end
