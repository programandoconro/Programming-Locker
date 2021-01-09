package main

import (
	"github.com/goiot/devices/monochromeoled"
	"golang.org/x/exp/io/i2c"
)

func main() {

	d, err := monochromeoled.Open(&i2c.Devfs{Dev: "/dev/i2c-1"})
	if err != nil {
		panic(err)
	}

	// clear the display before putting on anything
	if err := d.Clear(); err != nil {
		panic(err)
	}

	for i := 0; i < 128; i++{
		d.SetPixel(i,1, 1)
		d.SetPixel(i,63, 1)
	}
  
	for i := 0; i < 64; i++{
		d.SetPixel(1,i, 1)
		d.SetPixel(127,i, 1)
	}

	if err := d.Draw(); err != nil {
		panic(err)
	}
}
