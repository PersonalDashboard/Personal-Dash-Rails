# Personal Dash: your Daily Overview
![screen shot 2017-07-23 at 10 39 08 pm](https://user-images.githubusercontent.com/11463275/28506232-dae5cc04-6ff7-11e7-8722-a39295ead420.png)
![screen shot 2017-07-23 at 10 40 11 pm](https://user-images.githubusercontent.com/11463275/28506252-f48f95b8-6ff7-11e7-9b42-aba0efa33118.png)


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
