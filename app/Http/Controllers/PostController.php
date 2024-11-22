<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Post;

class PostController extends Controller
{

    public function index()
    {
        // Fetch all posts where title and content are not empty or null
        $posts = Post::whereNotNull('title')
                 ->where('title', '!=', '')
                 ->whereNotNull('content')
                 ->where('content', '!=', '')
                 ->get();

        // Return view with posts data
        return view('post.index', compact('posts'));
    }

    public function show($post_id)
    {
        // Decode the base64-encoded post_id
        $postId = base64_decode($post_id);

        // Find the post by the decoded ID
        $post = Post::with('comments.replies')->findOrFail($postId);

        $names = [
            'John Doe', 'Jane Smith', 'Mark Wilson', 'Alice Brown', 'Bob White',
            'Michael Johnson', 'Emily Davis', 'Chris Lee', 'Sarah Miller', 'David Clark',
            'Sophia Martinez', 'James Taylor', 'Charlotte Anderson', 'Daniel Harris', 'Olivia Lewis',
            'William Walker', 'Lily Scott', 'Benjamin Young', 'Amelia King', 'Lucas Hall',
            'Grace Adams', 'Ethan Carter', 'Hannah Parker', 'Mason Rodriguez', 'Avery Evans',
            'Jack Mitchell', 'Zoe Moore', 'Henry Perez', 'Isabella Thomas', 'Samuel Garcia'
        ];

        // Pass the random names array to the view
        return view('post.show', compact('post', 'names'));
    }

}
