<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Comment;
use Validator;

class CommentController extends Controller
{
    public function reply(Request $request, Comment $comment)
    {
        // Manually validate the incoming request
        try {
            // Validation rules
            $rules = [
                'content' => 'required|string',
                'post_id' => 'required|exists:posts,id', // Validate post_id correctly
                'parent_comment_id' => 'nullable|exists:comments,id',
                'depth' => 'required|integer|min:1|max:3',
            ];

            // Validate the request data
            $validator = Validator::make($request->all(), $rules);

            if ($validator->fails()) {
                // Return validation errors in JSON format if validation fails
                return response()->json([
                    'success' => false,
                    'message' => 'Validation errors',
                    'errors' => $validator->errors(),
                ], 422); // 422 is the status code for validation errors
            }

            // Ensure that replies do not exceed the maximum depth
            $maxDepth = 3;
            if ($comment->depth >= $maxDepth) {
                return back()->with('error', 'Maximum comment depth reached. Cannot reply to this comment.');
            }

            // Create a new reply
            $reply = new Comment();
            $reply->content = $request->content;
            $reply->post_id = $request->post_id;  // Use the post_id from the request
            $reply->parent_comment_id = $comment->id;
            $reply->depth = $comment->depth;
            $reply->save();

            // Return a success response (can redirect or return JSON based on requirement)
            return back()->with('success', 'Your reply has been posted successfully!');

        } catch (\Exception $e) {
            // Handle general exceptions (e.g., database issues, etc.)
            return response()->json([
                'success' => false,
                'message' => 'An error occurred: ' . $e->getMessage(),
            ], 500); // 500 is the status code for general server errors
        }
    }

}
