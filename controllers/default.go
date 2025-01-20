package controllers

import (
	"context"
	"encoding/json"
	"fmt"
	"os"
	"strings"
	"travel-template/agents"

	"github.com/beego/beego/v2/server/web"
	"github.com/prathyushnallamothu/swarmgo/llm"
)

// MainController handles the main page
type MainController struct {
	web.Controller
}

// Config represents the website configuration
type Config struct {
	SiteName          string   `json:"site_name"`
	PrimaryColor      string   `json:"primary_color"`
	SecondaryColor    string   `json:"secondary_color"`
	AccentColor       string   `json:"accent_color"`
	LogoPosition      string   `json:"logo_position"` // "left", "center", or "right"
	SearchBarPosition string   `json:"search_bar_position"`
	HeroImage         string   `json:"hero_image"`
	SliderImages      []string `json:"slider_images"`
}

func init() {
	// Add custom template functions
	web.AddFuncMap("add", func(a, b int) int {
		return a + b
	})
	web.AddFuncMap("neq", func(a, b interface{}) bool {
		return a != b
	})
}

// Get generates and serves the configuration
func (c *MainController) Get() {
	// Create a new agent with Gemini model
	agent := &agents.Agents{
		Name:     "CreativeDesigner",
		Model:    "gemini-1.5-flash",
		Provider: llm.Gemini,
		Instructions: `You are a highly creative web designer AI that specializes in creating stunning travel and vacation rental websites.
Your task is to:
1. Create a unique and memorable site name for a vacation rental platform
2. Design a modern color scheme that reflects luxury, comfort, and adventure
3. Choose strategic positions for logo and search bar that maximize UX
4. Select beautiful property images that showcase luxury living

Guidelines:
- Site name should be catchy, unique, and memorable
- Colors should be sophisticated and work harmoniously (use hex codes)
- Logo position options: "left", "center", or "right" (affects navbar layout)
- Search bar position options: "left", "center", or "right"
- Images should be high-resolution luxury property photos`,
	}
	agent.LoadAgent()

	// Create the prompt
	prompt := `Create a complete website configuration for a luxury vacation rental platform.
Design everything from scratch - site name, colors, layout, and imagery.
Make it modern, sophisticated, and appealing to high-end travelers.

Return the configuration as JSON with these fields:
- site_name (be creative and unique)
- primary_color (hex)
- secondary_color (hex)
- accent_color (hex)
- logo_position ("center", or "right" - affects navbar layout)
- search_bar_position ("left", "center", or "right")
- hero_image (use a specific Unsplash photo URL, not random)
- slider_images (array of 3 specific Unsplash photo URLs, not random)

Return only the JSON, no other text.`

	// Prepare the message for configuration generation
	message := []llm.Message{
		{
			Role:    "system",
			Content: "You are a luxury web designer. Return only the JSON configuration, no explanations.",
		},
		{
			Role:    "user",
			Content: prompt,
		},
	}

	// Generate configuration
	resp, err := agent.Execute(context.Background(), message, nil)
	if err != nil {
		c.Data["Error"] = fmt.Sprintf("Failed to generate config: %v", err)
		return
	}

	// Get the last message which should contain just the JSON
	jsonResponse := resp.Messages[len(resp.Messages)-1].Content

	// Clean up the markdown formatting
	jsonResponse = strings.TrimPrefix(jsonResponse, "```json\n")
	jsonResponse = strings.TrimSuffix(jsonResponse, "\n```\n")
	jsonResponse = strings.TrimSpace(jsonResponse)

	// Save the response to config.json
	err = os.WriteFile("conf/config.json", []byte(jsonResponse), 0644)
	if err != nil {
		c.Data["Error"] = fmt.Sprintf("Failed to save config: %v", err)
		return
	}

	// Parse the response into Config struct
	var config Config
	if err := json.Unmarshal([]byte(jsonResponse), &config); err != nil {
		c.Data["Error"] = fmt.Sprintf("Failed to parse config: %v", err)
		return
	}

	// Set template variables
	c.Data["SiteName"] = config.SiteName
	c.Data["PrimaryColor"] = config.PrimaryColor
	c.Data["SecondaryColor"] = config.SecondaryColor
	c.Data["AccentColor"] = config.AccentColor
	c.Data["LogoPosition"] = config.LogoPosition
	c.Data["SearchBarPosition"] = config.SearchBarPosition
	c.Data["SliderImages"] = config.SliderImages

	c.TplName = "index.tpl"
}
