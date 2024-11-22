<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;

class Comment extends Model
{
    use HasFactory;
    protected $fillable = ['content', 'post_id', 'parent_comment_id', 'depth'];

    public function post()
    {
        return $this->belongsTo(Post::class);
    }

    public function parent()
    {
        return $this->belongsTo(Comment::class, 'parent_comment_id');
    }

    public function replies()
    {
        return $this->hasMany(Comment::class, 'parent_comment_id')->with('replies');
    }

    public static function boot()
    {
        parent::boot();

        static::saving(function ($comment) {
            // Ensure depth is within limit (max 3 levels)
            if ($comment->parent_comment_id) {
                $parent = self::find($comment->parent_comment_id);
                if ($parent && $parent->depth >= 3) {
                    throw new \Exception('Maximum reply depth reached.');
                }
                $comment->depth = $parent->depth + 1;
            } else {
                $comment->depth = 0; // Top-level comment
            }
        });
    }
}
