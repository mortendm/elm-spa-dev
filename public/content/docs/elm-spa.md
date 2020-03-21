## The continued Dream team site

If you wish to continue working with the Dream Team project here are the rest of the exercises that I have made:

The original Dream Team project can be found here [Dream Team original](http://informatik-gym.dk/dream-team).

The additions are:
- selling a player
- selling a team
- finding the youngest player on the team

The final repl with all additions can be found here [Dream Team final](https://repl.it/@MortenDamsgaard/version4-final)

### Selling a player

The point of this exercise is to make a function that takes the various attributes of the players into account when calculating a price. This can be done in several ways but one possible solution is this:

```
function findPrice(playerNumber) {
  var age = basketTeam[playerNumber].playerAge;
  var val = basketTeam[playerNumber].playerValue;
  var inj = basketTeam[playerNumber].injured;

  var price = (50 - age) * 1000 + val * 1000;

  if (inj == true) {
    price = Math.round(price * 0.7);
  }

  alert("The price of the player is " + price + " $.");
}
```

The function takes a playernumber as argument and returns the value of the player. In this example we assume that the value of the player depends on his age, value and whether or not he is injured.


### Selling a team

Here we are reusing the same code to calculate the price of the entire team. The differences are:
1. We are using a for loop to loop through all `Player` objects
2. We are adding the price of the individual players to the sum as the prices are calculated

```
function findTeamPrice(basketTeam) {
  var sum = 0;
  var teamSize = basketTeam.length;
  for (i = 0; i < teamSize; i++) {
    var age = basketTeam[i].playerAge;
    var val = basketTeam[i].playerValue;
    var inj = basketTeam[i].injured;
    var price = (50 - age) * 1000 + val * 1000;

    if (inj == true) {
      price = Math.round(price * 0.7);
    }
    sum += price;
  }
  alert("Price of the team is " + sum + " $");
}
```


### Finding the youngest player on the team

This exercise is a bit harder then the others as it requires a temporary variable in the algorithm.


```
function findYoungestPlayer(basketTeam) {
  var lowest = 100;
  var tmp;
  var teamSize = basketTeam.length;
  for (i = 0; i < teamSize; i++) {
    tmp = basketTeam[i].playerAge;
    if (tmp < lowest) lowest = tmp;
  }

  alert("The youngest player is " + lowest + " years old");
}
```

We start by setting the `lowest` variable to 100. This is necessary to make the algorithm work in the first iteration of the for loop. After the first iteration the `lowest` variable needs to hold the age of the first player and this requires the initial value of `lowest` to be higher than the age of the first player.
In the following iterations the `tmp` variable is set to the value of the player in the loop and compared to `lowest`. If the age of the player is lower than `lowest` then this player's age is assigned to `lowest`.

A similar version that finds the oldest player is below (not in the final code example):

```
function findOldestPlayer(basketTeam) {
  var highest = 0;
  var tmp;
  var teamSize = basketTeam.length;
  for (i = 0; i < teamSize; i++) {
    tmp = basketTeam[i].playerAge;
    if (tmp > highest) highest = tmp;
  }

  alert("The oldest player is " + highest + " years old");
}
```
