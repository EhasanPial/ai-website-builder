package controllers

import (
	"github.com/beego/beego/v2/server/web"
)

// TestController handles the /test route
type TestController struct {
	web.Controller
}

// Get serves the index template with configuration from app.conf
func (c *TestController) Get() {
	var err error

	// Read configuration values from app.conf
	if c.Data["SiteName"], err = web.AppConfig.String("site_name"); err != nil {
		c.Data["Error"] = "Failed to read site_name"
		return
	}
	if c.Data["PrimaryColor"], err = web.AppConfig.String("primary_color"); err != nil {
		c.Data["Error"] = "Failed to read primary_color"
		return
	}
	if c.Data["SecondaryColor"], err = web.AppConfig.String("secondary_color"); err != nil {
		c.Data["Error"] = "Failed to read secondary_color"
		return
	}
	if c.Data["AccentColor"], err = web.AppConfig.String("accent_color"); err != nil {
		c.Data["Error"] = "Failed to read accent_color"
		return
	}
	if c.Data["LogoPosition"], err = web.AppConfig.String("logo_position"); err != nil {
		c.Data["Error"] = "Failed to read logo_position"
		return
	}
	if c.Data["SearchBarPosition"], err = web.AppConfig.String("search_bar_position"); err != nil {
		c.Data["Error"] = "Failed to read search_bar_position"
		return
	}
	if c.Data["HeroImage"], err = web.AppConfig.String("hero_image"); err != nil {
		c.Data["Error"] = "Failed to read hero_image"
		return
	}

	// Render the template
	c.TplName = "index.tpl"
}
