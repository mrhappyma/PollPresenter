*you've heard of propresenter. now get ready for...*

# pollpresenter

simple self-hosted live polling for event(s)! i've used it for [exactly 1](https://funpinkpageant.wixsite.com/funpinkpageant) and it worked flawlessly (but your mileage may vary).

| ![](./1.png) | ![](./2.jpg) |
|--------------|------------|

## features
- create polls
- edit polls
- set custom background colors for each poll
- open polls
- vote on polls
- close polls
- view results (in a cool list or an even cooler pie chart, updating in real time over websockets)
- free & no ads or response limits (thats why it exists)
- no way to delete anything. the best data security method ever.

## setup
todo. if you really want to run this for some reason let me know and i might help.

## usage
- manage polls at `/polls` - everything actually does link to each other here!
- for voting go to `/vote/:id` or `/polls/:id/vote` - ooo options
- i recommend protecting `/polls` pages with cf access or something similar