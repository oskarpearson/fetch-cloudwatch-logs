# Intro

Fetching long codebuild output (or indeed any other cloudwatch logs) is painful,
because you need to click 8,000 times with a long wait every time. Searching
only shows the individual lines that match - rather than the surrounding output.

Additionally, the AWS CLI doesn't help much - because it doesn't automatically
fetch all pages. So it needs to be wrapped in a script like https://gist.github.com/gholker/88639858d53ae3ccec7ddd306cd8ba22#file-download-aws-logs-sh

This simple ruby script will fetch all the logs for a given log group and log
stream.

# Installation

Use `rbenv install` or similar to install the correct version of Ruby.

Then, use `bundle` to install the `aws-sdk-cloudwatchlogs` gem.

# Usage

You can then use a command like this to write the log to a file on your
desktop.

```shell
bundle exec ./fetch-cloudwatch-logs.rb /aws/codebuild/my-log-group uuid-over-here > ~/Desktop/uuid-over-here.txt
```

If you use aws-vault you can use a command like this to run things in the right
aws environment

```shell
aws-vault exec the-environment-name -- bundle exec ./fetch-cloudwatch-logs.rb /aws/codebuild/my-log-group uuid-over-here > ~/Desktop/uuid-over-here.txt
```
