import media
import fresh_tomatoes

toy_story = media.Movie("Toy Story",
                        "Story of a boy",
                        "http://upload.wikimedia.org/wikipedia/en/1/13/toy_story.jpg",
                        "https://www.youtube.com/watch?v=vwyZH85NQC4")
#print(toy_story.storyline)

avatar = media.Movie("Avatar",
                     "A marine on an alien planet",
                     "http://upload.wikimedia.org/wikipedia/id//b/b0/Avatar-teaser-poster.jpg",
                     "http://www.youtube.com/watch?v=9ceBgWV8io")
#print(avatar.storyline)
#avatar.show_trailer()

movies = [toy_story, avatar]
fresh_tomatoes.open_movies_page(movies)
