//
//  main.m
//  HierarchicalHeaderCopier
//
//  Created by Hoon H. on 14/8/19.
//
//

#import <Foundation/Foundation.h>
#import "Functions.h"



int main(int argc, const char * argv[])
{
	@autoreleasepool
	{
		assert_true_with_message(argc == 3, @"You must specify <src> and <dst>.");
		
		NSString*	src	=	[NSString stringWithUTF8String:argv[0]];
		NSString*	dst	=	[NSString stringWithUTF8String:argv[1]];
		assert_true_with_message([[NSFileManager defaultManager] fileExistsAtPath:src], @"The source directory does not exist.");
		
		NSURL*		u1	=	[[NSURL fileURLWithPath:src] absoluteURL];
		NSURL*		u2	=	[[NSURL fileURLWithPath:dst] absoluteURL];
		assert_true_with_message([u1 isEqual:u2] == NO, @"<src> and <dst> are equals. This is not acceptable.");
		
		////
		
		copy_all_only_headers(u1, u2);
	}
    return 0;
}

