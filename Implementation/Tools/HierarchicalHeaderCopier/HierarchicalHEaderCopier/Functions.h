//
//  Functions.h
//  HierarchicalHeaderCopier
//
//  Created by Hoon H. on 14/8/19.
//
//

void	fail(NSString* message) __attribute__((noreturn));
void	assert_true_with_message(BOOL state, NSString* message);
void	assert_true(BOOL state);
void	assert_type(id object, Class type);
void	assert_no_error(NSError* error);





void	enum_dirs_on_filesystem(NSURL* root, void(^block)(NSURL* absoluteURL));
void	create_dir_on_filesystem(NSURL* url);
void	delete_dir_on_filesystem(NSURL* url);
NSURL*	make_relative_path_url(NSURL* toBase, NSURL* fromAbsolute);
NSURL*	make_absolute_path_url(NSURL* base, NSURL* relative);

BOOL	is_existing_dir(NSURL* url);

void	create_dir_on_filesystem_with_relative_path(NSURL* base, NSURL* relative);
void	copy_file_on_filesystem_with_relative_path(NSURL* fromBase, NSURL* toBase, NSURL* relativePath);






/*!
 @param	query_whether_to_copy_file	Returns YES if the supplied URL is fine to copy. NO to skip it.
 */
void	copy_all_files(NSURL* src, NSURL* dst, BOOL (^query_whether_to_copy_dir)(NSURL* absoluteSourceURL), BOOL (^query_whether_to_copy_file)(NSURL* absoluteSourceURL));







void	copy_all_only_headers(NSURL* src, NSURL* dst);