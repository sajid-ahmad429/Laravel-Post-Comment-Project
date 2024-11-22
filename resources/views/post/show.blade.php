<!-- resources/views/post/show.blade.php -->

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ $post->title }}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #eee;
        }

        hr {
            margin-top: 20px;
            margin-bottom: 20px;
            border: 0;
            border-top: 1px solid #ddd;
        }

        a {
            color: #82b440;
            text-decoration: none;
        }

        .blog-comment {
            padding-left: 15%;
            padding-right: 15%;
        }

        .blog-comment ul {
            list-style-type: none;
            padding: 0;
        }

        .blog-comment img.avatar {
            width: 45px;
            height: 45px;
            border-radius: 50%;
            margin-right: 10px;
        }

        .post-comments {
            border: 1px solid #eee;
            margin-bottom: 20px;
            padding: 10px 20px;
            background: #fff;
            color: #6b6e80;
            border-radius: 4px;
        }

        .meta {
            font-size: 13px;
            color: #aaaaaa;
            margin-bottom: 10px;
        }
    </style>
</head>

<body>
    <div class="container py-5">
        <!-- Post Section -->
        <div class="row justify-content-center mb-5">
            <div class="col-md-8">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h1 class="card-title text-primary text-uppercase">{{ $post->title }}</h1>
                        <p class="card-text text-muted text-dark-emphasis">{{ $post->content }}</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Display Success/Error Messages -->
        @if(session('success'))
        <div class="alert alert-success">
            {{ session('success') }}
        </div>
        @elseif(session('error'))
        <div class="alert alert-danger">
            {{ session('error') }}
        </div>
        @endif

        <!-- Comments Section -->
        <div class="row">
            <div class="col-md-12">
                <div class="blog-comment">
                    <h3 class="text-success text-uppercase">Comments</h3>
                    <hr />
                    <!-- Recursive Comments -->
                    <ul class="comments">
                        @foreach ($post->comments->where('parent_comment_id', null) as $comment)
                            @include('comments.comment', ['comment' => $comment, 'allComments' => $post->comments, 'maxDepth' => 3])
                        @endforeach
                    </ul>

                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
