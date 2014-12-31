# Training Benchmarks
[![Build Status](https://travis-ci.org/evanrkeller/training-benchmarks.png)](https://travis-ci.org/evanrkeller/training-benchmarks)

## Dependencies

  The following tools are requred for the Training Benchmarks App. If you do not already have these packages installed use the following Homebrew commands. For instructions on installing Homebrew, visit <https://github.com/mxcl/homebrew/wiki/installation>

    brew install postgres #pay attention to the info screen for important setup steps after installation

## Getting Started

  Once you have the dependancies resolved, download the code, install gems and create the databases with:

    cd ~/Projects #or where ever you keep your projects
    git clone git@github.com:evanrkeller/training-benchmarks.git
    cd training-benchmarks
    gem install bundler
    bundle install

    # DB setup
    rake db:setup

    # Run the test suites
    rake
