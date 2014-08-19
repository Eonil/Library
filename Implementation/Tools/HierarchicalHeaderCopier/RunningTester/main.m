//
//  main.m
//  RunningTester
//
//  Created by Hoon H. on 14/8/19.
//
//

#import <Foundation/Foundation.h>
#import "../HierarchicalHeaderCopier/Functions.h"

void
check_result(NSURL* dst)
{
	id	enum1	=	[[NSFileManager defaultManager] enumeratorAtURL:dst includingPropertiesForKeys:nil options:0 errorHandler:^BOOL(NSURL *url, NSError *error)
	{
		assert_no_error(error);
		fail(@"Error occured while enumerating directory.");
	}];
	
	NSUInteger	c1	=	0;
	for (NSURL* u1 in enum1)
	{
		NSLog(@"%@", u1);
		c1	++;
	}
	
	assert_true_with_message(c1 == 6, @"Copied result must be 6 items.");
}

int main(int argc, const char * argv[])
{
	@autoreleasepool
	{
		NSURL*	u1	=	[NSURL fileURLWithPath:@"./Test/DummyData"];
		NSURL*	u2	=	[NSURL fileURLWithPath:@"./Test/CopyResult"];
		
		system("pwd");
		copy_all_only_headers(u1, u2);
		check_result(u2);
		system("find ./Test/CopyResult");
		
		
		return	0;
	}
}

