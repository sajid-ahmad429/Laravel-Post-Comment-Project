@extends('layouts.app')

@section('content')
<style>
    .card:hover {
    transform: translateY(-5px);
    transition: all 0.3s ease-in-out;
}
</style>
<div class="container mt-5">
    <h1 class="text-center mb-4">All Posts</h1>
    <div class="row">
        @foreach ($posts as $post)
            <div class="col-md-4 mb-4">
                <div class="card shadow-sm border-light rounded">
                    <div class="card-header text-center bg-primary-subtle text-dark text-uppercase">
                        <h5 class="card-title">{{ $post->title }}</h5>
                    </div>
                    <div class="card-body">
                        <p class="card-text">{{ Str::limit($post->content, 150) }}</p>
                    </div>
                    <div class="card-footer text-muted d-flex justify-content-between align-items-center bg-body-tertiary">
                        <!-- Posted on text aligned left -->
                        <span class="small">Posted on {{ $post->created_at->format('M d, Y') }}</span>
                        <!-- The button aligned to the right -->
                        <a href="{{ route('post.show', ['post_id' => base64_encode($post->id)]) }}" class="btn btn-danger btn-sm">Comments & Reply</a>
                    </div>
                </div>
            </div>
        @endforeach
    </div>
</div>

@endsection
