# Travel Website Template

This is a customizable travel website template built with Beego framework. It's designed to be easily modified by AI agents for different types of travel rentals such as wedding hotels, hill resorts, or tree houses.

## Template Variables

The template can be customized through the following variables in `conf/app.conf`:

- `site_name`: The name of the website
- `primary_color`: Primary theme color (hex code)
- `secondary_color`: Secondary theme color (hex code)
- `accent_color`: Accent color for buttons and highlights (hex code)
- `logo_position`: Position of the logo in header ("left" or "right")
- `search_bar_position`: Position of the search bar ("center" or "right")
- `hero_image`: Path to the hero image

## Project Structure

```
travel-template/
├── conf/
│   └── app.conf           # Configuration file with template variables
├── controllers/
│   └── default.go         # Main controller handling template variables
├── routers/
│   └── router.go          # URL routing configuration
├── static/
│   └── img/              # Directory for images
├── views/
│   └── index.tpl         # Main template file
└── main.go               # Application entry point
```

## Getting Started

1. Install Beego framework:
   ```bash
   go get github.com/beego/beego/v2
   ```

2. Run the application:
   ```bash
   go run main.go
   ```

3. Access the website at `http://localhost:8080`

## Customization

To customize the template for different types of rentals:

1. Modify the template variables in `conf/app.conf`
2. Add your logo to `static/img/logo.png`
3. Add your hero image to `static/img/` and update the path in `app.conf`
4. Customize the listing cards in `views/index.tpl`

## Features

- Responsive design using Tailwind CSS
- Configurable color theme
- Flexible layout with adjustable logo and search bar positions
- Hero section with customizable background image
- Featured listings section
- Newsletter subscription form
- Mobile-friendly navigation
