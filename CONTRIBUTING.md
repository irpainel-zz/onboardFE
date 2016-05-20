# Submitting Issues
* Name convention: `"[" "FE "? task_context task_hierarchy? "] "
  task_name `
* Add labels
* Set a milestone
* Use [Skitch](https://evernote.com/skitch/) to improve its description
* Use [User stories](https://drive.google.com/open?id=1ZoVKeuSdVwxG8Q5mw8524pyviu5qXVX4qS80RXuW5mU)

# Pull Requests Checklist
* Open a new Pull Request when starting a new issue, adding the "IN PROGRESS" label
* Associate an issue
* Assign it to yourself
* Set the current milestone
* Add some images (using Skitch](https://evernote.com/skitch/)) or video (using [Licecap](http://www.cockos.com/licecap/))
* Move solved issue to Review on [hubboard]()
* For nested PR, use [github compare](https://github.com/blog/612-introducing-github-compare-view) to help on the CR
* Ask for code review on github: `@<People> ready for code review!`

# Merge
* Fetch: `git fetch origin -p`
* Rebase your branch: `git rebase -p origin/develop`
* Merge it and delete its branch on GitHub and then inform your team on Slack: `@group, develop updated`
* Check if your travis build is actually builded

# Sprint X Main Flow

// TODO: add main flow for each sprint

# Planning checklist

## Main Test
* Test in iOS8+
* Test at least in iPhone 4s and iPhone6+ devices
* Test without connection
* Test through a fast connection (wifi)
* Test through a slow connection
* Test all screens when the app comes back from background
* Test push notification flow, if the screen contemplates
* Test if the screen has the correct analytics implemented
* Test in a real device to avoid performance issues and memory leaks
* Test guide target

## New features / APIs
* Consider time to research existing dependencies (i.e.: cocoa pods)
 - To avoid "reinventing the wheel" and also to certificate that the
   possible solution fulfills all the requirements
* Check if the new feature requires an API not implemented yet
 - Dev should validate the API before implementing
 - Negotiate with PO if the API requires a fix or implementation

## Refactoring
* Consider time to refactor
* Consider time to solve technical debts

## Front-end
Attention to:
* Font: Color, Size, Weight, Family
* Margins
* Background colors (especially page background)
* Size of clickable (at least 37px -> 44px)
* Feedback (buttons, list - highlight)
* Scroll with/without keyboard
* Max/Min cases (responsive)
* Text (ortography, use of ponctuation, word case)
* Brand names should be Capital
* The first letter of paragraphs as well
* Remember that we should be able to change the app colors, brand names easily
* More common mistakes here: https://www.evernote.com/l/AOu9wi-MVapORpmjGQrzUtxLgd9kshvj62Q
