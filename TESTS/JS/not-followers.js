const readLine = require("readline");

async function main() {
  const userInfo = { user: "" };
  await readUserInput().then(({ user }) => {
    console.log(`User: ${user}`);
    userInfo.user = user;
  });
  const followers = await getUsers(userInfo.user, "followers");
  const followings = await getUsers(userInfo.user, "following");
  const notFollowingBack = findNotFollowingBack(followers, followings);
  showResults(notFollowingBack);
  
}

function readUserInput() {
  const rl = readLine.createInterface({
    input: process.stdin,
    output: process.stdout,
  });

  return new Promise((resolve) => {
    rl.question("Please enter your Github user name:\n ", (user) => {
      rl.close();
      resolve({ user });
    });
  });
  
}

async function getUsers(userName, userType) {
  return new Promise((resolve) => {
    fetch(`https://api.github.com/users/${userName}/${userType}?per_page=100`, {
      method: "GET",
      headers: {
        "Content-Type": "application/vnd.github.json",
      },
    })
      .then((response) => response.json())
      .then((data) => {
        resolve(data);
      });
  });
  
}

function findNotFollowingBack(followers, followings) {
  let notFollowingBack = [];
  if (followings?.length && followers?.length) {
    followings.forEach((following) => {
      let followingName = following?.login;
      let isFollowingYou = false;

      followers.forEach((follower) => {
        let followerName = follower?.login;
        if (followingName === followerName) {
          isFollowingYou = true;
        }
      });
      if (!isFollowingYou) {
        notFollowingBack.push(followingName);
      }
    });
    return notFollowingBack.sort((a, b) => {
      if (a.toLowerCase() < b.toLowerCase()) return -1;
      else return 1;
    });
    
  } else {
    console.log("Please provide a valid user name");
  }
  
}

function showResults(notFollowingBack) {
  console.log("This are the users that are not following you back on Github:");
  for (users of notFollowingBack) {
    console.log(users);
  }
}

main();
