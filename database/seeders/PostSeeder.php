<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Post;
use App\Models\Comment;
use App\Models\User;
use Faker\Factory as Faker;

class PostSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $faker = Faker::create('en_IN'); // Use Indian locale for Faker

        // Generate multiple posts
        foreach (range(1, 5) as $index) {
            $post = Post::create([
                'title' => 'Importance of ' . $faker->randomElement([
                    'Digital India',
                    'Yoga',
                    'Ayurveda',
                    'Indian Festivals',
                    'Startup Culture'
                ]),
                'content' => $faker->paragraph . ' ' . $faker->randomElement([
                    'India has always been known for its diversity.',
                    'The government has initiated multiple schemes to empower citizens.',
                    'Culture plays a vital role in shaping the lives of Indian people.'
                ]),
            ]);

            // Create top-level comments for each post
            foreach (range(1, rand(2, 4)) as $i) {
                $comment1 = Comment::create([
                    'content' => $faker->randomElement([
                        'I completely agree with this!',
                        'This topic is so relevant in today’s India.',
                        'I believe we need more awareness about this.',
                        'Absolutely insightful!'
                    ]),
                    'post_id' => $post->id,
                    'depth' => 0
                ]);

                // Add nested replies to top-level comments
                foreach (range(1, rand(1, 3)) as $j) {
                    $comment2 = Comment::create([
                        'content' => $faker->randomElement([
                            'Couldn’t have said it better myself!',
                            'Thanks for sharing this perspective.',
                            'This is an important discussion.',
                            'Looking forward to more posts like this.'
                        ]),
                        'post_id' => $post->id,
                        'parent_comment_id' => $comment1->id,
                        'depth' => 1
                    ]);

                    // Add replies to second-level comments if within depth limit
                    if (rand(0, 1)) {
                        Comment::create([
                            'content' => $faker->randomElement([
                                'Totally agree with you.',
                                'That’s an interesting take!',
                                'Let’s discuss this further.',
                                'Great to see others engaging on this topic.'
                            ]),
                            'post_id' => $post->id,
                            'parent_comment_id' => $comment2->id,
                            'depth' => 2
                        ]);
                    }
                }
            }
        }
    }
}
