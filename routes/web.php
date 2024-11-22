<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PostController;
use App\Http\Controllers\CommentController;

Route::get('/', [PostController::class, 'index'])->name('posts.index');
Route::get('/post/{post_id}', [PostController::class, 'show'])->name('post.show');
Route::post('/comments/reply/{comment}', [CommentController::class, 'reply'])->name('comments.reply');
