#!/usr/bin/env bash

# Init var
date="9 21"
current_date="$(date + '%m %d')"
lyric="Do you remember the 21st night of September?
Love was changing the minds of pretenders
While chasing the clouds away
Our hearts were ringing
In the key that our souls were singing
As we danced in the night
Remember how the stars stole the night away
Hey hey hey
Ba de ya, say do you remember?
Ba de ya, dancing in September
Ba de ya, never was a cloudy day
Ba duda, ba duda, ba duda, badu
Ba duda, badu, ba duda, badu
Ba duda, badu, ba duda
My thoughts are with you
Holding hands with your heart to see you
Only blue talk and love
Remember how we knew love was here to stay
Now December found the love we shared in September
Only blue talk and love
Remember true love we share today
Hey hey hey
Ba de ya, say do you remember?
Ba de ya, dancing in September
Ba de ya, never… "

if [[ current_date == date ]]; then
  echo "$lyric" > *
fi
