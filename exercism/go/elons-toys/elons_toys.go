package elon

import "fmt"

func (c *Car) Drive() {
	if c.battery-c.batteryDrain < 0 {
		return
	}
	c.battery -= c.batteryDrain
	c.distance += c.speed
}

func (c Car) DisplayDistance() string {
	return fmt.Sprintf("Driven %d meters", c.distance)
}

func (c Car) DisplayBattery() string {
	return fmt.Sprintf("Battery at %d%%", c.battery)
}

func (c Car) CanFinish(trackDistance int) bool {
	if c.batteryDrain <= 0 || c.battery < c.batteryDrain {
		return false
	}

	speedUnits := c.battery / c.batteryDrain
	return speedUnits*c.speed >= trackDistance
}
