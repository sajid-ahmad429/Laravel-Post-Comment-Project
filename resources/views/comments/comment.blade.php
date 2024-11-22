@php
    $isComment = $comment->parent_comment_id == null || $comment->parent_comment_id == '';
@endphp

<li class="clearfix">
    <div class="d-flex align-items-center">
        <!-- User Avatar -->
        <img src="{{ $comment->user->avatar ?? 'https://via.placeholder.com/200' }}" class="avatar" alt="User Avatar" width="40" height="40">
        <!-- User Name -->
        <span class="fw-bold text-primary ms-2">{{ $comment->user->name ?? $names[array_rand($names)] }}</span>
    </div>

    <!-- Comment/Reply Content -->
    <div class="post-comments">
        <p class="meta">
            {{ $comment->created_at->format('M d, Y') }} says:
            <!-- Indicate if it's a Comment or Reply -->
            <span class="badge bg-info text-dark">{{ $isComment ? 'Comment' : 'Reply' }}</span>

            <!-- Depth Flag -->
            <span class="badge {{ $comment->depth < $maxDepth ? 'bg-success' : 'bg-danger' }}">
                Depth: {{ $comment->depth }}
            </span>

            <!-- Reply Button (Only available if depth is less than the max depth) -->
            @if ($comment->depth < $maxDepth)
                <a href="#" class="reply-button float-end" data-bs-toggle="collapse" data-bs-target="#replyForm{{ $comment->id }}" aria-expanded="false">
                    <small>Reply</small>
                </a>
            @endif
        </p>
        <p>{{ $comment->content }}</p>
    </div>

    <!-- Reply Form -->
    @if ($comment->depth < $maxDepth)
        <div class="collapse mt-3" id="replyForm{{ $comment->id }}">
            <form action="{{ route('comments.reply', $comment->id) }}" method="POST">
                @csrf

                <!-- Hidden field to pass the post_id -->
                <input type="hidden" name="post_id" value="{{ $comment->post_id }}">
                <input type="hidden" name="depth" value="{{ $comment->depth + 1 }}">

                <div class="mb-3">
                    <textarea name="content" class="form-control" rows="2" placeholder="Write your reply..."></textarea>
                </div>
                <button type="submit" class="btn btn-sm btn-success">Submit</button>
            </form>
        </div>
    @endif

    <!-- Nested Replies -->
    @php
        $replies = $allComments->where('parent_comment_id', $comment->id);
    @endphp

    @if ($replies->isNotEmpty())
        <ul class="comments">
            @foreach ($replies as $reply)
                @include('comments.comment', ['comment' => $reply, 'allComments' => $allComments, 'maxDepth' => $maxDepth])
            @endforeach
        </ul>
    @endif
</li>
