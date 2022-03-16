# Connectivity remote test
## environment setup
1. install gem
```
gem install bundler
bundle install
```
2. install appium
```shell
npm install -g appium
```
3. start appium service
```shell
appium -p 4723
```
4. setup device in config/devices.yml
5. choose cucumber profile to run in config/cucumber.yml

#### command line example
```shell
# run ios device
cucumber -p ios
```

