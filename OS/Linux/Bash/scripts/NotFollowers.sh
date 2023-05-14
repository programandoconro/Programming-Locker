

FOLLOWERS=$(curl --silent -i "https://api.github.com/users/programandoconro/followers?per_page=100")

FOLLOWING=$(curl --silent -i "https://api.github.com/users/programandoconro/following?per_page=100")

echo $FOLLOWERS > followers.txt 
echo $FOLLOWING > following.txt

echo $(grep -Po '(?<=login)[^s]*' following.txt | awk '{print $2}') > following.txt
echo $(grep -Po '(?<=login)[^s]*' followers.txt | awk '{print $2}') > followers.txt

echo $(grep -F -x -v -f followers.txt following.txt) > nf.txt
rm following.txt followers.txt

NOTFOLLOWERS=$(cat nf.txt)

rm NotFollowers.txt
for word in $NOTFOLLOWERS; do echo $word >> NotFollowers.txt; done
rm nf.txt

sort NotFollowers.txt | less

