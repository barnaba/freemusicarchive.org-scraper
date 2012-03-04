# Dependancies

    $ [sudo] gem install mechanize

# Usage

    $ mkdir jazz && cd jazz
    $ ruby ../scrape_freemusicarchive.org.rb http://freemusicarchive.org/genre/Jazz/ | xargs curl -JL --remote-name-all

