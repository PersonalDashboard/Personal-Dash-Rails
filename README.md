# Personal Dash: your Daily Overview
![screen shot 2017-07-12 at 10 06 06 am](https://user-images.githubusercontent.com/11463275/28121644-ca5efa98-66e9-11e7-8fb2-e141e797ec59.png)

## Current Features include:<b>
1) Current Time.
2) Current Weather.
3) News from Selected aggregate(s) BBC news (default).
4) Daily How to Article. 
5) Quote of the day.
6) Traffic status between home and work adress.
</b>
## Future Features include:
1) Ability to customize weather city.
2) UI for changing news source.
3) Add additional Boxes or remove unwanted Boxes.
4) Allow More start coord and destination coords.
5) Allow start and destination to be reversable.

## Installation (Macintosh Computer)
Prerequisites: rvm or rbenv installed.
<b>
<br><br>git clone https://github.com/PersonalDashboard/Personal-Dash-Rails.git;
<br>cd Personal-Dash-Rails;
<br>brew install qt@5.5;
<br>echo 'export PATH="$(brew --prefix qt@5.5)/bin:$PATH"' >> ~/.bashrc;
<br>brew link --force qt@5.5;
<br>bundle install;
<br>rake db:create;
<br>rake db:migrate;
<br>rails s;

</b>
