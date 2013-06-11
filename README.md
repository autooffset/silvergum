# Carbon Gum: Silver Gum

Not sure how long this can remain open-source, but I'll be doing my best to keep it that way, even though the plan is that it's part of a business. Useful from the perspective of it being real world code that others can learn a bit from (provided I write code well).

Needless to say, anything within the app that must remain private will be pushed out to environment variables. Here's the list:

* `SECRET_KEY_BASE`: your app's key for signing cookies. You can generate your own secret key via `rake secret`.

I store these environment variables within .env and .powenv files, which are most definitely not included in git.
