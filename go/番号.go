package main

import ("fmt"
	"time"
	"math/rand"
	"strings"
)


func main() {
fmt.Println("Los 10 kanji de hoy son:")  
                time.Sleep(time.Second * 1)
go random10()
fmt.Scanln()
}


func random10() {

a := "人一丨口日目儿見凵山出十八木未丶来大亅了子心土冂田思二丁彳行寸寺時卜上丿刀分厶禾私中彐尹事可亻何自乂又皮彼亠方生月門間扌手言女本乙气気干年三耂者刂前勹勿豕冖宀家今下白勺的云牛物立小文矢知入乍作聿書学合"
s := strings.Split(a, "")

for {
                s1 := rand.NewSource(time.Now().UnixNano())
                r1 := rand.New(s1)
                r := r1.Intn(99)
                fmt.Println(s[r])
                time.Sleep(time.Second * 10)
}
}

