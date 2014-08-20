//
//  Task.swift
//  Asynchronous
//
//  Created by Hoon H. on 14/8/20.
//
//

import Foundation



public protocol TaskControllerProtocol
{
	public func cancel();
}

enum TaskState
{
	case	None,
	case	Ready,
	case	Running,
	case	Cancellation,
	case	Success,
	case	Failure,
}

public class TaskController
{
	public func cancel()
	{
		_state	=	TaskState.Cancellation;
	}
	
	private var _state:TaskState	=	TaskState.None;
}

public class Task
{
	private var _state_controller:TaskControllerProtocol?	=	nil
	
	private func run()
	{
		
	}
	
	private func setCancellation()
	{
		
	}
	private func setSuccess()
	{
	
	}
	private func setFailure()
	{
		
	}
}

public class TaskManager
{
	public func run(task:Task, success: () -> (), failure: () -> ()) -> ()
	{
		_tasks.append(task)
	}
	
	////
	
	private var	_tasks	=	Array<Task>();
}










public class HTTPTask : Task
{
	public init()
	{
		let	c1	=	NSURLSessionConfiguration.defaultSessionConfiguration();
		let	q1	=	NSOperationQueue.mainQueue();
		
		_delegate	=	Delegate();
		_conn		=	NSURLSession(configuration: c1, delegate: _delegate, delegateQueue: q1)
	}

	////
	
	private struct Delegate : NSURLSessionDelegate
	{
		weak var task:Task;
		
		func 
	}
	
	private var	_delegate:Delegate;
	private var	_conn:NSURLSession;
}








