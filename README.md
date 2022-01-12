# Car Controller

## Getting Started

1. Clone the repo
```sh
$ git clone https://github.com/mbayucot/car_controller.git && cd car_controller
```
2. Install gems
```sh
$ bundle install
```
3. Run tests
```sh
$ bundle exec rspec
```
4. Run navigator
```sh
$ ruby -Ilib ./bin/car-navigator
$ Enter upper-right coordinates of the playground: 5 5
$ Enter 1st car position: 1 2 N 
$ Enter 1st car heading: LMLMLMLMM
$ Enter 2nd car position: 3 3 E
$ Enter 2nd car heading: MMRMMRMRRM
$ 1 3 N
$ 1 1 E
```