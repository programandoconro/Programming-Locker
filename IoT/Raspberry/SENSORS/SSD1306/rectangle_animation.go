package main

import (
	"github.com/goiot/devices/monochromeoled"
	"golang.org/x/exp/io/i2c"
	"time"
)

func main() {

	d, err := monochromeoled.Open( &i2c.Devfs{ Dev: "/dev/i2c-1" } )
	if err != nil {
		panic( err )
	}

	if err := d.Clear(); err != nil {
		panic( err )
	}
	e := 0
	for e < 1  {
		e = 0

		for i := 0; i < 128; i++{
			if err:= d.SetPixel( i, 1, 1 ); err != nil{
				panic( err )
			}
		}
		for i := 0; i < 64; i++{
			if err:= d.SetPixel( 127,i, 1 ); err != nil{
				panic( err )
			}
		}
		for i := 0; i < 128; i++{
			if err:= d.SetPixel( 127 - i,63, 1 ); err != nil{
				panic( err )
			}
		}
		for i := 0; i < 64; i++{
			if err:= d.SetPixel( 1, 63 - i, 1 ); err != nil{
				panic( err )
			}
		}

		if err := d.Draw(); err != nil {
			panic( err )
		}

		time.Sleep(time.Millisecond * 500)
		
		if err := d.Clear(); err != nil {
			panic( err )
		}

		time.Sleep(time.Millisecond * 500)


	
	}


}
