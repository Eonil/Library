//
//  Functions.c
//  HierarchicalHeaderCopier
//
//  Created by Hoon H. on 14/8/19.
//
//


#import <Foundation/Foundation.h>
#import "Functions.h"

void
fail(NSString* message)
{
	NSLog(@"FAIL: %@", message);
	abort();
}

void
assert_true_with_message(BOOL state, NSString* message)
{
	if (state == NO)
	{
		fail([NSString stringWithFormat:@"<assertion failure!> %@", message]);
	}
}
void
assert_true(BOOL state)
{
	assert_true_with_message(state, @"(reason unspecified, see the source code with debugger)");
}
void
assert_type(id object, Class type)
{
	if ([object isKindOfClass:type] == NO)
	{
		fail([NSString stringWithFormat:@"The object is not an instance of expected type %@", type]);
	}
}
void
assert_no_error(NSError* error)
{
	assert_true_with_message(error == NO, [NSString stringWithFormat:@"An error occured: %@", error]);
}











void
create_dir_on_filesystem(NSURL* url)
{
	assert_true(is_absolute_url(url));
	
	////
	
	if (is_existing_dir(url) == NO)
	{
		NSError*	e1	=	nil;
		BOOL		f1	=	[[NSFileManager defaultManager] createDirectoryAtURL:url withIntermediateDirectories:YES attributes:nil error:&e1];
		
		assert_no_error(e1);
		assert_true(f1 == YES);
	}
}
void
delete_dir_on_filesystem(NSURL* url)
{
	assert_true(is_absolute_url(url));
	
	////
	
	if (is_existing_dir(url))
	{
		NSError*	e1	=	nil;
		BOOL		f1	=	[[NSFileManager defaultManager] removeItemAtURL:url error:&e1];
		
		assert_no_error(e1);
		assert_true(f1 == YES);
	}
}

void
enum_dirs_on_filesystem(NSURL* root, void(^block)(NSURL* absoluteURL))
{
	NSDirectoryEnumerator*	de1	=	[[NSFileManager defaultManager] enumeratorAtURL:root includingPropertiesForKeys:nil options:(NSDirectoryEnumerationSkipsHiddenFiles) errorHandler:^BOOL(NSURL *url, NSError *error)
									 {
										fail([NSString stringWithFormat:@"Cannot enumerate item at URL: %@, error = %@", url, error]);
									 }];
	
	for (NSURL* u2 in de1)
	{
		NSURL*	u3	=	[u2 absoluteURL];
		block(u3);
	}
}

NSURL*
make_relative_path_url(NSURL* toAbsoluteBase, NSURL* fromAbsoluteItem)
{
	assert_type(toAbsoluteBase, [NSURL class]);
	assert_type(fromAbsoluteItem, [NSURL class]);
	assert_true(is_absolute_url(toAbsoluteBase));
	assert_true(is_absolute_url(fromAbsoluteItem));
	
	////
	
	NSString*	s1	=	[toAbsoluteBase path];
	NSString*	s2	=	[fromAbsoluteItem path];
	
	if ([s2 hasPrefix:s1] == NO)
	{
		fail([NSString stringWithFormat:@"The absolute URL(%@) doesn't start with the base URL (%@).", fromAbsoluteItem, toAbsoluteBase]);
	}
	
	NSString*	s3	=	[s2 substringFromIndex:[s1 length]];
	NSURL*		u4	=	[NSURL fileURLWithPath:s3];
	return		u4;
}
NSURL*
make_absolute_path_url(NSURL* base, NSURL* relative)
{
	assert_type(base, [NSURL class]);
	assert_type(relative, [NSURL class]);
	
	return	[base URLByAppendingPathComponent:[relative relativePath]];
}

BOOL
is_existing_dir(NSURL* url)
{
	NSString*	p1	=	[[[url absoluteURL] filePathURL] path];
	BOOL		d1	=	NO;
	BOOL		e1	=	[[NSFileManager defaultManager] fileExistsAtPath:p1 isDirectory:&d1];
	return	e1 && d1;
}
BOOL
is_absolute_url(NSURL* url)
{
	return	[[url absoluteURL] isEqual:url];
}


void
create_dir_on_filesystem_with_relative_path(NSURL* base, NSURL* relative)
{
	NSURL*	u1	=	[base URLByAppendingPathComponent:[relative relativePath]];
	create_dir_on_filesystem(u1);
}

void
copy_file_on_filesystem_with_relative_path(NSURL* fromBase, NSURL* toBase, NSURL* relativePath)
{
	NSURL*	u1	=	make_absolute_path_url(fromBase, relativePath);
	NSURL*	u2	=	make_absolute_path_url(toBase, relativePath);
	
	NSError*	e1	=	nil;
	BOOL		f1	=	[[NSFileManager defaultManager] copyItemAtURL:u1 toURL:u2 error:&e1];
	
	assert_no_error(e1);
	assert_true(f1 == YES);
}








void
copy_all_files(NSURL* src, NSURL* dst, BOOL (^query_whether_to_copy_dir)(NSURL* absoluteSourceURL), BOOL (^query_whether_to_copy_file)(NSURL* absoluteSourceURL))
{
	assert_type(src, [NSURL class]);
	assert_type(dst, [NSURL class]);
	assert_true(is_absolute_url(src));
	assert_true(is_absolute_url(dst));
	
	////
	
	delete_dir_on_filesystem(dst);
	create_dir_on_filesystem(dst);
	enum_dirs_on_filesystem(src, ^(NSURL *absoluteURL)
							{
								BOOL	d1	=	is_existing_dir(absoluteURL);
								NSURL*	u1	=	make_relative_path_url(src, absoluteURL);
								NSLog(@"%@, %@", @(d1), [u1 relativeString]);
								
								if (d1)
								{
									if (query_whether_to_copy_dir(absoluteURL))
									{
										create_dir_on_filesystem_with_relative_path(dst, u1);
									}
								}
								else
								{
									if (query_whether_to_copy_file(absoluteURL))
									{
										copy_file_on_filesystem_with_relative_path(src, dst, u1);
									}
								}
							});
}





void
copy_all_only_headers(NSURL* src, NSURL* dst)
{
	id	allow_copy_dir	=	^(NSURL* absoluteSourceURL)
	{
		return	YES;
	};
	
	id	allow_copy_file	=	^(NSURL* absoluteSourceURL)
	{
		BOOL	begin_with_underscore	=	[[absoluteSourceURL lastPathComponent] hasPrefix:@"_"];
		
		BOOL	h	=	[[absoluteSourceURL pathExtension] isEqualToString:@"h"];
		BOOL	hh	=	[[absoluteSourceURL pathExtension] isEqualToString:@"hh"];
		BOOL	hpp	=	[[absoluteSourceURL pathExtension] isEqualToString:@"hpp"];
		
		return	begin_with_underscore == NO && (h || hh || hpp);
	};

	copy_all_files(src, dst, allow_copy_dir, allow_copy_file);
}








